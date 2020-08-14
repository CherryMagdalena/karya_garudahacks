// Clicked Post Screen : when post from home screen is clicked

import 'package:flutter/material.dart';
import 'package:karya_garudahacks/purchase_confirm_page.dart';

Column _buildButtonColumn(IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon),
    ],
  );
}

Container _container(String label) {
  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      border: Border.all(width: 2),
    ),
    child: Text(
      label,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
    ),
  );
}

class ClickedPost extends StatelessWidget {
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
            'INSERT USERNAME',
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
      child: Text('INSERT TITLE',
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
      child: Text('Rp.' + 'INSERT PRICE')
    );

    Widget buttons = Container(
      padding: EdgeInsets.only(left:20.0, top:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildButtonColumn(Icons.star), //like button
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
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => PurchaseConfirmation()
              ),
              );
            },
            child: Text('Purchase',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 20.0),
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
      body: Column(
        children: [
          profile,
          //INSERT IMAGE FROM DB
          titleSection,
          price,
          buttons,
          buynadd,
          comment,
          commentsect,
        ],
      ),

    );
  }
}
