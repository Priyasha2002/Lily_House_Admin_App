import 'package:ecommerce_app_admin_app/models/dashboard_btn_model.dart';
import 'package:ecommerce_app_admin_app/providers/theme_provider.dart';
import 'package:ecommerce_app_admin_app/widgets/dashboard_btn.dart';
import 'package:ecommerce_app_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/assets_manager.dart';
import '../widgets/dashboard_btn_widget.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/DashboardScreen";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(label: "Dashboard Screen"),
        leading:  Padding(
            padding:  EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        actions: [
          IconButton(
              onPressed: (){
                themeProvider.setDarkTheme(themeValue: !themeProvider.getIsDarkTheme);
              },
              icon: Icon(
                themeProvider.getIsDarkTheme ? Icons.light_mode : Icons.dark_mode
              ),
          )
        ],
      ),
      
      body: GridView.count(
          crossAxisCount: 2,
        childAspectRatio: 1,
        children: List.generate( 3,
                  (index) =>  Padding(padding: EdgeInsets.all(8),
                    child: DashboardWidgetBord(
                      title:
                      DashboardButtonsModel.dashboardBtnList(context)[index].text,
          imagePath:
          DashboardButtonsModel.dashboardBtnList(context)[index]
              .imagePath,
          onPressed:
          DashboardButtonsModel.dashboardBtnList(context)[index]
              .onPressed,
                    ),
                  )
        ),
      ),
    );
  }
}


