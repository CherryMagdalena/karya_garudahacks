import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/components/product_card_list_view.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/model/product.dart';

void main() {
  runApp(PurchaseProductScreen());
}

class PurchaseProductScreen extends StatefulWidget {
  @override
  _PurchaseProductScreenState createState() => _PurchaseProductScreenState();
}

class _PurchaseProductScreenState extends State<PurchaseProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        backgroundColor: color4,
        body: ListView.separated(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryList[index],
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                ProductCardListView(categoryList[index]),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 15.0);
          },
        ),
      );
  }
}
