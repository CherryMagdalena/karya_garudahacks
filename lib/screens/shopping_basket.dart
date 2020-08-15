//Shopping basket page, when clicked add to cart

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/shopping_cart.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/checkout_multiple.dart';
import 'package:karya_garudahacks/components/price_formatter.dart';

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  clearCart() {
    ShoppingCart.tocart.clear();
  }

  clearQTY() {
    ShoppingCart.qty.clear();
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
          title: Text(
            'Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: ListView.builder(
        itemCount: ShoppingCart.tocart.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100.0,
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 7.0),
                leading: Image.network(
                  ShoppingCart.tocart[index].image,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                title: Padding(
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 10),
                  child: Text(
                    ShoppingCart.tocart[index].title,
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Price(1) :'),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      priceFormatter(ShoppingCart.tocart[index].price),
                    )
                  ],
                ),
                trailing: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {
                        setState(() {
                          ShoppingCart.qty[index] += 1;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        ShoppingCart.qty[index].toString(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        setState(() {
                          if (ShoppingCart.qty[index] == 1) {
                          } else {
                            ShoppingCart.qty[index] -= 1;
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          ShoppingCart.tocart
                              .remove(ShoppingCart.tocart[index]);
                          ShoppingCart.qty.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
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
            MaterialButton(
              onPressed: () {
                setState(() {
                  clearCart();
                  clearQTY();
                });
              },
              child: Text('Clear Cart'),
            ),
            Expanded(
              child: ListTile(
                title: Text('Total: '),
                subtitle: Text(
                  priceFormatter(ShoppingCart.countTotalPrice()),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (ShoppingCart.tocart.isEmpty) {
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutCart()),
                  );
                }
              },
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
