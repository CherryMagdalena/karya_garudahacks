import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:karya_garudahacks/screens/clicked_post_screen.dart';
import 'package:karya_garudahacks/model/user.dart';

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

Column _buildButtonColumn(IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon),
    ],
  );
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

          List<Product> productList = productListing(snapshot.data);
          List profileList = [];

          for(int i=0; i < productList.length; i++){
            if(productList[i].username == widget.profileFilter){
              profileList.add(i);
            }
          }

          if(profileList.length == 0){
            return Container(
              child: Center(
                child: Text(
                  'There are no posts yet.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              ),
            );
          }

          else{
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
          );}
        }
      ),
    );
  }
}



class HomeScreenPosts extends StatefulWidget {
  HomeScreenPosts(this.categoryFilter);
  CategoryData categoryFilter;
  @override
  _HomeScreenPostsState createState() => _HomeScreenPostsState();
}

class _HomeScreenPostsState extends State<HomeScreenPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(" "),
              );
            }
              List<Product> productList = productListing(snapshot.data);
              List homeList = [];

              bool finishedForLoop = false;
                for(int i=0; i < productList.length; i++){
                if(productList[i].category == widget.categoryFilter.category1 || productList[i].category == widget.categoryFilter.category2 || productList[i].category == widget.categoryFilter.category3){
                  homeList.add(i);
                }
                if(i == productList.length-1){
                  finishedForLoop = true;
                }
              }
              if(snapshot.connectionState != ConnectionState.waiting && finishedForLoop==false){
                return Container();
              }
              return Expanded(///home screen layout home screen layout home screen layout
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            //buildstack for image & price
                            Stack(
                              alignment: const Alignment(1.0, 0.9),
                              children: [
                                MaterialButton(
                                  child:  Image.network(
                                    productList[homeList[index]].image,///imagePath
                                    width: 400,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => ClickedPost(productList[homeList[index]])
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                  ),
                                  child: Text( 'Rp.' +
                                      productList[homeList[index]].price.toString(),
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
                                productList[homeList[index]].description,
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
            );
          }
      ),
    );
  }
}
