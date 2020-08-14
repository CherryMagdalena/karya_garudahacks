// Home Screen
import 'package:flutter/material.dart';
import 'file:///C:/Users/Samantha/AndroidStudioProjects/karya_garudahacks/lib/screens/clicked_post_screen.dart';

Column _buildButtonColumn(IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon),
    ],
  );
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        body: Container(

          child: Column(

            children: [

              Expanded(

                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            //buildstack for image & price
                            Stack(
                              alignment: const Alignment(1.0, 0.9),
                              children: [
                                MaterialButton(
                                  child:  Text('IMAGE INSERT'),
                                  onPressed: () {
                                    Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => ClickedPost()
                                    ),
                                    );
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                  ),
                                  child: Text( 'Rp.' +
                                    'PRICE OF PRODUCT',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //textSection
                            Container(
                              padding:
                              const EdgeInsets.only(left: 20.0, top: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                               'PRODUCT DESCRIPTION',
                              ),
                            ),
                            //tagS
                            Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Text('#tag1 #cool'),
                            ),
                            //button
                            Container(
                              padding:
                              const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildButtonColumn(Icons.star),
                                  _buildButtonColumn(Icons.comment),
                                  _buildButtonColumn(Icons.share),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}