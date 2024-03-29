import 'package:ecommerce_app_admin_app/inner_screens/orders_widget.dart';
import 'package:ecommerce_app_admin_app/widgets/empty_bag.dart';
import 'package:ecommerce_app_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class OrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';
  const OrdersScreenFree({super.key});

  @override
  State<OrdersScreenFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersScreenFree> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(
            label: "Placed orders",
        ),
      ),
      body: isEmptyOrders
        ? EmptyBagWidget(
          imagePath: AssetsManager.order,
          title: "No orders has been placed yet",
          subtitle: "",
      )
          : ListView.separated(
        itemCount: 15,
        itemBuilder: (ctx , index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2 , vertical: 6),
            child: OrdersWidgetFree(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      )
    );
  }
}
