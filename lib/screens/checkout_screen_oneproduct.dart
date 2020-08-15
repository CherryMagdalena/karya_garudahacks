// Checkout from purchase confirm of one product

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/order_success_screen.dart';
import 'package:karya_garudahacks/model/product.dart';

class CheckoutOneProduct extends StatelessWidget {
  final int price;
  final Product products;
  final int qty;
  CheckoutOneProduct(this.products, this.price, this.qty);
  @override
  Widget build(BuildContext context) {
    //personal details inc name, phone number, address
    Widget personaldetails = Container(

      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text('Personal Details',style: TextStyle( color: Colors.blueGrey, fontSize: 20.0,fontWeight: FontWeight.bold), ),
          Text('Name: ', style: TextStyle( color: Colors.blueGrey, fontSize: 20.0),),
          Text('Mario Luigi'),
          Text('Address: ', style: TextStyle( color: Colors.blueGrey, fontSize: 20.0),),
          Text('Mushroom Kingdom, Brooklyn, New York'),
          Text('Contact Number: ', style: TextStyle( color: Colors.blueGrey, fontSize: 20.0),),
          Text('+62 111 1111 1111'),
          Text('Payment Method: ', style: TextStyle( color: Colors.blueGrey, fontSize: 20.0),),
          Text('BCA Transfer'),
        ],
      ),
    );

    //delivery
    Widget deliveryoptions = Container(
      alignment: Alignment.topLeft,
      child:Column(

        children: [
          Text('Delivery Method', style: TextStyle( color: Colors.blueGrey, fontSize: 20.0),),
          Text('JNE'),
        ],
      ),
    );


    return Scaffold(
      backgroundColor: color4,
      appBar:  AppBar(
          iconTheme: IconThemeData(color: color1),
          backgroundColor: color3,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text('Checkout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           ListTile(
              leading: Text('INSERT IMAGE'),
              title: Text(//'INSERT PRODUCT TITLE'
                products.title,

              ),
              trailing: new Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  Container(padding: EdgeInsets.only(top: 15.0),
                    child:Text('Quantity: '),
                  ),
                  Container(padding: EdgeInsets.only(top: 15.0),
                    child: Text( qty.toString(),
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
        color: color3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title:Text('Total: '),
                subtitle: Text('Rp. ' + price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => OrderSuccess()
                  ),
                );
              },
              child: Text('Make Order',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
