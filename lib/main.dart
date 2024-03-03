
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'consts/app_constants.dart';
import 'consts/theme_data.dart';
import 'inner_screens/dashboard_screen.dart';
import 'inner_screens/edit_upload_product_form.dart';
import 'inner_screens/orders_screen.dart';
import 'inner_screens/search_screen.dart';
import 'providers/product_provider.dart';
import 'providers/theme_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: AppConstants.apiKey,
              appId: AppConstants.appId,
              messagingSenderId: AppConstants.messagingSenderId,
              projectId: AppConstants.projectId,
              storageBucket: AppConstants.storagebucket
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  )
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                    child: SelectableText(""
                        "An error has been occurred ${snapshot.error}"),
                  )
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => ProductProvider(),
              ),
            ],
            child: Consumer<ThemeProvider>(builder: (context,
                themeProvider,
                child,) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'LILY HOUSE ADMIN',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const DashboardScreen(),
                routes: {
                  OrdersScreenFree.routeName: (
                      context) => const OrdersScreenFree(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                  EditOrUploadProductScreen.routeName: (
                      context) => const EditOrUploadProductScreen()
                },
              );
            }),
          );
        }
    );
  }
}













