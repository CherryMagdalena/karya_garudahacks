// Clicked Post Screen : when post from home screen is clicked

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/purchase_confirm_page.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/shopping_cart.dart';
import 'package:karya_garudahacks/screens/shopping_basket.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:karya_garudahacks/components/price_formatter.dart';

Column _buildButtonColumn(IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon),
    ],
  );
}


class ClickedPost extends StatelessWidget {
  final Product products;
  ClickedPost(this.products);

  @override
  Widget build(BuildContext context) {
    Widget profile = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(
            Icons.person,
            size: 40,
          ),
          Text(
            products.username,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87,
          ),
          ),
        ],
      ),
    );

    Widget titleSection = Container(
      padding: EdgeInsets.only(left:20.0, top: 20.0),
      alignment: Alignment.centerLeft,
      child: Text(
        products.title,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
    );

    Widget price = Container(
      padding: EdgeInsets.only(left: 20.0),
      alignment: Alignment.centerLeft,
      child: Text(priceFormatter(
          products.price
      )

      ),
    );

    Widget buttons = Container(
      padding: EdgeInsets.only(left:20.0, top:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildButtonColumn(Icons.star), //like button
          SizedBox(width: 7.5,),
          _buildButtonColumn(Icons.share) //share button
        ],
      ),
    );

    Widget buynadd = Container(
      padding: EdgeInsets.only(left: 20.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MaterialButton(


            color:color2,
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => PurchaseConfirmation(this.products)
              ),
              );
            },
            child: Text('Purchase',
              style: TextStyle( color: Colors.white, fontSize: 20.0),
            ),
          ),
          MaterialButton(


            color:color2,
            onPressed: (){
              ShoppingCart.tocart.add(products);
              ShoppingCart.qty.add(1);
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => ShoppingBasket()
                ),
              );
            },
            child: Text('Add to Cart', style: TextStyle( color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );

    Widget comment = Container(
      padding: EdgeInsets.only(left:20.0, top: 40.0),
      alignment: Alignment.centerLeft,
      child: Text('Comments',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
    );

    Widget commentsect = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Text('User123',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  Text('Wow, Awesome!',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: color4,
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profile,
            Image.network(
              products.image,
              width: 400,
              height: 200,
              fit: BoxFit.cover,
            ),
            titleSection,
            price,
            buttons,
            buynadd,
            comment,
            commentsect,
          ],
        ),
      ),

    );
  }
}
