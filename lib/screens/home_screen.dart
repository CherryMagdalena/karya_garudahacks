// Home Screen
import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/floating_button.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:karya_garudahacks/services/category_filter.dart';

class HomeScreen extends StatelessWidget {
  Product products;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: color4,
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        floatingActionButton: FloatingButton(),
        body: CategoryFilter(),
      ),
    );
  }
}