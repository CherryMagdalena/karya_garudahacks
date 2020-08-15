import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/components/product_card_list_view.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/purchase_commissions_screen.dart';
import 'package:karya_garudahacks/screens/purchase_products_screen.dart';

void main() {
  runApp(PurchaseHomeScreen());
}

class PurchaseHomeScreen extends StatefulWidget {
  @override
  _PurchaseHomeScreenState createState() => _PurchaseHomeScreenState();
}

class _PurchaseHomeScreenState extends State<PurchaseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: color4,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Popular This Week',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ProductCardListView(),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryButton(
                    text: 'Products',
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PurchaseProductScreen()));
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  CategoryButton(
                    text: 'Commissions',
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PurchaseCommissionsScreen()));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final Function onClicked;

  CategoryButton({this.text, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: color3)),
        color: color2,
        child: Text(
          text,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        onPressed: onClicked,
      ),
    );
  }
}
