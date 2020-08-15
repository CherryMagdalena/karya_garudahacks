import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/model/product.dart';

class PurchaseCommissionsScreen extends StatefulWidget {
  @override
  _PurchaseCommissionsScreenState createState() =>
      _PurchaseCommissionsScreenState();
}

class _PurchaseCommissionsScreenState extends State<PurchaseCommissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomAppBar(),
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: ListView.separated(
              padding: EdgeInsets.only(top: 50.0),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return CategoryButton(categoryList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 40.0,
                );
              }),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String name;
  CategoryButton(this.name);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: color3)),
        color: color2,
        child: Text(
          name,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          //Pass category to the next page
        },
      ),
    );
  }
}
