// Purchase confirm when clicked purchase (one kind of product)

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/screens/checkout_screen_oneproduct.dart';

class PurchaseConfirmation extends StatefulWidget {
  @override
  _PurchaseConfirmationState createState() => _PurchaseConfirmationState();
}

class _PurchaseConfirmationState extends State<PurchaseConfirmation> {
  int _counter = 1;

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
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Confirmation',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),)
      ),
      body: Card(
        child: ListTile(
          leading: Text('INSERT IMAGE'),
          title: Text('INSERT PRODUCT TITLE'),
          subtitle: Column(
            children: <Widget>[
              Row(
                children:<Widget>[
                  Expanded(child: Text('Price(1): ')),

                  Expanded(child: Text('Rp. ' + 'PRICE')),
                ],
              ),
            ],
          ),

          trailing: Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up),
              onPressed: _addCounter,
              ),
              Container(
                child: Text(_counter.toString(),
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_drop_down),
              onPressed: _minusCounter,
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text('Total: '),
                subtitle: Text('Rp. ' + 'PRICE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => CheckoutOneProduct()
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
