//Shopping basket page, when clicked add to cart

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/shopping_cart.dart';
import 'package:karya_garudahacks/model/colors.dart';

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  clearCart(){
    ShoppingCart.tocart.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
          iconTheme: IconThemeData(color: color1),
          backgroundColor: color3,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text('Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)
      ),
      body: ListView.builder(
        itemCount: 4,//ShoppingCart.tocart.length,
        itemBuilder: (context, index) {

          return
            Card(
              child: ListTile(
                leading: Text('INSERT IMAGE'), /*Image.asset(
                  ShoppingCart.tocart[index].image,
                  width: 100.0,
                  height: 100.0,
                ), */
                title: Text( 'INSERT TITLE'
                   // ShoppingCart.tocart[index].title
                ),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Price(1) :'),
                        ),
                        Expanded(
                          child: Text( 'INSERT PRICE',
                              //ShoppingCart.tocart[index].price.toString()
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: new Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: (){
                      /*  setState(() {
                          ShoppingCart.qty[index] += 1;
                        }); */
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text( 'INSERT INDEX'
                       // ShoppingCart.qty[index].toString(),
                      ),
                    ),
                    new IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                      /*  setState(() {
                          ShoppingCart.qty[index] -= 1;
                        }); */
                      },
                    ),
                  ],
                ),
              ),
            );

        },
      ),

      bottomNavigationBar: Container(
        color: color3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                onPressed:(){
                  setState(() {
                    clearCart();
                  });
                },
                child: Text('Clear Cart'),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text('Total: '),
                subtitle: Text('Rp. ' + 'PRICE',
                  // ShoppingCart.countTotalPrice().toString()
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    //builder: (context) => Checkout
                  ),
                );
              },
              child: Text('Checkout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
