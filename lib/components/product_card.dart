import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'price_formatter.dart';

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
