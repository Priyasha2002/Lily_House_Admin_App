import 'package:flutter/material.dart';

class AppConstants {
  static const String productImageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> categoriesList = [
    'Phones',
    'Laptops',
    'Electronics',
    'Watches',
    'Fashion',
    'Handbags',
    'Shoes',
    'Books',
    'Cosmetics',
    "Accessories",
  ];

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
    List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
          (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(
          categoriesList[index],
        ),
      ),
    );
    return menuItems;
  }
  static String apiKey = "AIzaSyB3FVENmfsQkr2iGriWoEpDS71oicWUjB0";
  static String appId = "1:29973919513:android:6d7a2fba982fc4e45af788";
  static String messagingSenderId = "29973919513";
  static String projectId = "lily-house-6329c";
  static String storagebucket = "lily-house-6329c.appspot.com";
}