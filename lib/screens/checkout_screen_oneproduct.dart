// Checkout from purchase confirm of one product

import 'package:flutter/material.dart';

class CheckoutOneProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //personal details inc name, phone number, address
    Widget personaldetails = Container(
      child:Column(
        children:[
          Text('Name'),
          Text('Mario Luigi'),
          Text('Address'),
          Text('Mushroom Kingdom, Brooklyn, New York'),
          Text('Contact Number'),
          Text('+62 111 1111 1111'),
          Text('Payment Method'),
          Text('BCA Transfer'),
        ],
      ),
    );

    //delivery
    Widget deliveryoptions = Container(
      child:Row(
        children: [
          Text('Delivery Method'),
          Text('JNE'),
        ],
      ),
    );


    return Scaffold(
      body: Container(
        child: Row(
          children: [
            ListTile(
              leading: Text('INSERT IMAGE'),
              title: Text('INSERT PRODUCT TITLE'),
              subtitle: Column(
                children: <Widget>[
                  Row(
                    children:<Widget>[
                      Expanded(child: Text('Quantity: ')),

                      Expanded(child: Text('qty')),
                    ],
                  ),
                ],
              ),

              trailing: new Wrap(
                direction: Axis.vertical,


                children: <Widget>[
                  Container(padding: EdgeInsets.only(top: 15.0),
                    child:Text('Rp. '),
                  ),
                  Container(padding: EdgeInsets.only(top: 15.0),
                    child: Text( 'PRICE'
                    ),
                  ),
                ],
              ),
            ),
            personaldetails,
            deliveryoptions,
          ],
        ),
      ),


      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title:Text('Total: '),
                subtitle: Text('Rp. ' + 'PRICE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text('Make Order',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
