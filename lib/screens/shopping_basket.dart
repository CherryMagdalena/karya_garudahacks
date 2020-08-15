//Shopping basket page, when clicked add to cart

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/shopping_cart.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/model/product.dart';
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
    Product products;
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
          return Card(
            child: ListTile(
              leading: Image.network(
                ShoppingCart.tocart[index].image,
                width: 100.0,
                height: 100.0,
              ),
              title: Text(ShoppingCart.tocart[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Price(1) :'),
                  Text(
                    priceFormatter(ShoppingCart.tocart[index].price),
                  )
                ],
              ),
              trailing: new Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  new IconButton(
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
                  new IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        if (ShoppingCart.qty[index] == 1) {
                          //ShoppingCart.qty[index];
                        } else {
                          ShoppingCart.qty[index] -= 1;
                        }
                      });
                    },
                  ),
                  new IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        ShoppingCart.tocart.remove(ShoppingCart.tocart[index]);
                        ShoppingCart.qty.removeAt(index);
                        print(ShoppingCart.qty.length);
                      });
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutCart()),
                );
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
