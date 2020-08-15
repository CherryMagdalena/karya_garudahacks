import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:karya_garudahacks/screens/clicked_post_screen.dart';

var firestore = Firestore.instance;
Future getPosts() async{
  QuerySnapshot qn = await firestore.collection('posts').getDocuments();
  return qn.documents;
}

productListing(var thing){
  List<Product> productList = [];
  for(int i=0; i < thing.length; i++){
    productList.add(Product(
      username: thing[i].data['username'],
      category: thing[i].data['category'],
      image: thing[i].data['imagePath'],
      title: thing[i].data['title'],
      description: thing[i].data['description'],
      price: int.parse(thing[i].data['price']),
    ));
  }
  return productList;
}


class SearchScreenPosts extends StatefulWidget {
  @override
  _SearchScreenPostsState createState() => _SearchScreenPostsState();
}

class _SearchScreenPostsState extends State<SearchScreenPosts> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text(''); //change with loading screen later? maybe
          }
          else{}
          List<Product> productList = productListing(snapshot.data);
          return Expanded(
            child: GridView.count(
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              crossAxisCount: 3,
              children: List.generate(productList.length, (index){
                return RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: Image.network(
                    productList[index].image,
                    width: 500,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClickedPost(
                              productList[index]
                            )
                      ),
                    );
                }
                );
              })
            ),
          );
        }
      ),
    );
  }
}

class ProfileScreenPosts extends StatefulWidget {
  ProfileScreenPosts(this.profileFilter);
  String profileFilter;
  @override
  _ProfileScreenPostsState createState() => _ProfileScreenPostsState();
}

class _ProfileScreenPostsState extends State<ProfileScreenPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text(''); //change with loading screen later? maybe
          }
          else{}
          List<Product> productList = productListing(snapshot.data);
          return Expanded(
            child: GridView.count(
              mainAxisSpacing: 5.0,
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              children: List.generate(productList.length, (index){
                return RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    child: Image.network(
                      productList[index].image,
                      width: 500,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClickedPost(
                              productList[index]
                            )
                      ),
                    );
                    }
                );
              })
            ),
          );
        }
      ),
    );
  }
}


