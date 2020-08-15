import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/home_screen.dart';
import 'package:karya_garudahacks/services/database.dart';
import 'package:provider/provider.dart';
import 'package:karya_garudahacks/model/user.dart';
import 'package:karya_garudahacks/model/product.dart';

//preparing  lists to contain information
List chosenCategory = [];
List isPressed = List<bool>.filled(7, false, growable: false);

class CategorySelectionPage extends StatefulWidget {
  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<CategoryData>(
    stream: DatabaseService(uid: user.uid).categoryData,
    builder: (context, snapshot) {
      CategoryData categoryData = snapshot.data;
      return Scaffold(
        backgroundColor: color4,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Congratulations, you're in!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: color2,
            ),
          ),
        ),

        body: Container(
          margin: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose 3 of your preferred categories.',
                  style: TextStyle(
                    color: color2,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Container(height: 15,),//spacing
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: 6, ///change to categoriesList
                itemBuilder: (context, index){

                  return RaisedButton(///button!
                    splashColor: isPressed[index] ? color3 : color1,
                    color: isPressed[index] ? color1: color3,
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: (){///on pressed!
                      //ayo isPressed check
                      if (isPressed[index] == false){
                        //add category
                        chosenCategory.add(categoryList[index]);
                      }
                      if (isPressed[index] == true){
                        //remove category
                        chosenCategory.remove(categoryList[index]);
                      }
                      setState((){
                        isPressed[index] = !isPressed[index];
                      }
                      );
                    },
                  );
                },
              ),

              RaisedButton(///Next button!
                color: color2,
                child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )
                ),
                onPressed: () async{///go to home screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  //update database with category data!
                  await DatabaseService(uid: user.uid).updateCategoryData(
                    chosenCategory[0] ?? categoryData.category1,
                    chosenCategory[1] ?? categoryData.category2,
                    chosenCategory[2] ?? categoryData.category3,
                  );
                  //clearing
                  chosenCategory.clear();
                  isPressed.fillRange(0, 7, false);
                },
              ),
            ],
          ),
        ),
      );
      }
    );
  }
}

