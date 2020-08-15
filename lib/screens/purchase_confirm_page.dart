// Purchase confirm when clicked purchase (one kind of product)

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/checkout_screen_oneproduct.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/model/product.dart';

class PurchaseConfirmation extends StatefulWidget {
  Product products;
  PurchaseConfirmation(this.products);
  @override
  _PurchaseConfirmationState createState() => _PurchaseConfirmationState(this.products);
}

class _PurchaseConfirmationState extends State<PurchaseConfirmation> {
  int _counter = 1;
  Product products;
  _PurchaseConfirmationState(this.products);

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  void _minusCounter() {
    setState(() {
      if (_counter == 1) {
        _counter;
      }
      else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int price = 5; //products.price*_counter;
    int qty = _counter;
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
          iconTheme: IconThemeData(color: color1),
          backgroundColor: color3,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text('Confirmation',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)
      ),
      body: Card(
        color: color4,
        child: ListTile(
          leading: Text('INSERT IMAGE'),
          title: Text('INSERT PRODUCT TITLE',
            //products.title, style: TextStyle(color: color1),
          ),
          subtitle: Column(
            children: <Widget>[
              Row(
                children:<Widget>[
                  Expanded(child: Text('Price(1): ', style: TextStyle(color: color2),)),

                  Expanded(child: Text('Rp. ' + 'PRICE'
                     // products.price.toString(),style: TextStyle(color: color2)
                  )),
                ],
              ),
            ],
          ),

          trailing: Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up, color: color1,),
              onPressed: _addCounter,
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(_counter.toString(),
                  style: TextStyle(color: color1),
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_drop_down,color: color1, ),
              onPressed: _minusCounter,
              ),

            ],
          ),
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
                subtitle: Text('Rp. ' + 'PRICE',
                    //price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => CheckoutOneProduct(products,price,qty)
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
