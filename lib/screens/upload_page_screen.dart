import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/model/product.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder:
  OutlineInputBorder(borderSide: BorderSide(color: color5, width: 2.0)),
  focusedBorder:
  OutlineInputBorder(borderSide: BorderSide(color: color1, width: 2.0)),
);

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String imagePath, category, title, description;
  int price;

  @override
  Widget build(BuildContext context) {

    void imageAcquisition(){
      showModalBottomSheet(
          context: context,
          builder: (context){
           return Container(
             child: Column(
               children: [
                 //acquire image from camera
                 FlatButton.icon(
                     onPressed: (){
                     },
                     icon: Icon(Icons.camera_alt),
                     label: Text('Camera')
                 ),

                 //acquire image from gallery
                 FlatButton.icon(
                     onPressed: (){
                     },
                     icon: Icon(Icons.folder),
                     label: Text('Gallery')
                 ),
               ],
             ),
           );
          });
    }

    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color3,
        title: Text('Upload your work'),
        actions: [
          FlatButton.icon(
              icon: Icon(
                  Icons.file_upload,
                  color: color1,
              ),
              label: Text(
                  'Upload',
                  style: TextStyle(color: color1),
              ),
              onPressed: (){
                //upload image to firebase storage
              },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.5),
        margin: EdgeInsets.all(7.5),
        child: Column(
          children: [
            //container for the image and button to acquire image
            imagePath == null
                ? Container(
              child: RaisedButton(
                color: color2,
                child: Column(
                  children:[
                    Icon(Icons.add, color: Colors.white,),
                    VerticalDivider(width: 2.0,),
                    Text(
                      'Add Image',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ]
                ),
                onPressed: (){
                  //image acquisition
                  imageAcquisition();
                },
              ),
            )
                : Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                )
              ),
            ),
            SizedBox(height: 20,),
            //dropdown menu for category selection
            Align(
              alignment: Alignment.topLeft,
              child: DropdownButton(
                  hint: Text('Select category'),
                  value: category,
                  items: categoryList.map((category){
                    return DropdownMenuItem(
                      child: Text(category),
                      value: category,
                    );
                  }),
                  onChanged: (val) => setState(()=> category =val),
              )
            ),
            SizedBox(height: 20,),
            //image/work title
            TextField(
              decoration: textInputDecoration.copyWith(hintText: 'Title'),
              onChanged: (val) => setState(()=> title = val),
            ),
            SizedBox(height: 20,),
            //image/work description
            TextField(
              decoration: textInputDecoration.copyWith(hintText: 'Description'),
              onChanged: (val) => setState(()=> description = val),
            ),
            SizedBox(height: 20,),
            //image/work price
            TextField(
              decoration: textInputDecoration.copyWith(hintText: 'Price'),
              onChanged: (val) => setState(()=> price = int.parse(val)),
            ),
          ],
        ),
      ),
    );
  }
}
