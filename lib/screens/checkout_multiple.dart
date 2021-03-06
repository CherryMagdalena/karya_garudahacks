// Checkout for cart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/order_success_screen.dart';
import 'package:karya_garudahacks/model/shopping_cart.dart';
import 'package:karya_garudahacks/components/price_formatter.dart';

class CheckoutCart extends StatelessWidget {
  clearCart() {
    ShoppingCart.tocart.clear();
  }

  clearQTY() {
    ShoppingCart.qty.clear();
  }

  @override
  Widget build(BuildContext context) {
    Widget personaldetails = Container(
      height: 250.0,
      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Personal Details',
            style: TextStyle(
                color: color1, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(''),
          Text(
            'Name: ',
            style: TextStyle(color: color1, fontSize: 18.0),
          ),
          Text('Mario Luigi'),
          Text(
            'Address: ',
            style: TextStyle(color: color1, fontSize: 18.0),
          ),
          Text('Mushroom Kingdom, Brooklyn, New York'),
          Text(
            'Contact Number: ',
            style: TextStyle(color: color1, fontSize: 18.0),
          ),
          Text('+62 111 1111 1111'),
          Text(
            'Payment Method: ',
            style: TextStyle(color: color1, fontSize: 18.0),
          ),
          Text('BCA Transfer'),
        ],
      ),
    );

    //delivery
    Widget deliveryoptions = Container(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0, top: 5.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Method',
            style: TextStyle(
                color: color1, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(top: 5.0), child: Text('JNE')),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
          iconTheme: IconThemeData(color: color1),
          backgroundColor: color3,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text(
            'Checkout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: ListView.builder(
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
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text('Price(1) :'),
                                ),
                                Expanded(
                                  child: Text(priceFormatter(
                                      ShoppingCart.tocart[index].price)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: new Wrap(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text('Quantity: '),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text(
                                ShoppingCart.qty[index].toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            personaldetails,
            deliveryoptions,
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: color3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
                clearCart();
                clearQTY();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderSuccess()),
                );
              },
              child: Text(
                'Make Order',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
