import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:intl/intl.dart';
import 'package:karya_garudahacks/model/product.dart';

void main() {
  runApp(PurchaseHomeScreen());
}

class PurchaseHomeScreen extends StatefulWidget {
  @override
  _PurchaseHomeScreenState createState() => _PurchaseHomeScreenState();
}

class _PurchaseHomeScreenState extends State<PurchaseHomeScreen> {
  //Sample
  List productList = [
    Product(
        username: 'personA',
        category: 'cat',
        image: 'https://cf.shopee.co.id/file/64c03b1bdc5b5b321515993b2ee01a31',
        title: 'Title1',
        description: 'desc',
        price: 10000),
    Product(
        username: 'personA',
        category: 'cat',
        title: 'Title2',
        description: 'desc',
        price: 20000),
    Product(
      username: 'personA',
      category: 'cat',
      description: 'desc',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: color4,
        home: Scaffold(
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
                Container(
                  margin: EdgeInsets.all(15.0),
                  height: 220.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(right: 5.0),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      Product product = productList[index];

                      return ProductCard(
                        image: product.image,
                        title: product.title ?? 'No Data',
                        price: product.price ?? 0,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 15.0,
                      );
                    },
                  ),
                ),
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
                          //To Products Page
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      CategoryButton(
                        text: 'Commissions',
                        onClicked: () {
                          //To Commission Page
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

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;

  ProductCard({this.title, this.price, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(20.0),
              image: image != null
                  ? DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill)
                  : null),
        ),
        Text(title, style: TextStyle(fontSize: 25.0)),
        Text(priceFormatter(price), style: TextStyle(fontSize: 20.0))
      ],
    );
  }
}

String priceFormatter(int price) {
  var numberFormat =
      NumberFormat.simpleCurrency(locale: 'in', decimalDigits: 0);
  String priceString = numberFormat.format(price);
  return priceString;
}
