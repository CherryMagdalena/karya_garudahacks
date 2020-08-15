import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var firestore = Firestore.instance;
Future getPosts() async{
  QuerySnapshot qn = await firestore.collection('posts').getDocuments();
  return qn.documents;
}


//Sample
List productList = [
  Product(
      username: 'personA',
      category: 'cat',
      image: 'https://cf.shopee.co.id/file/64c03b1bdc5b5b321515993b2ee01a31',
      title: 'Title1',
      description: 'desc',
      price: 10000),
  Product(
      username: 'personA',
      category: 'cat',
      title: 'Title2',
      description: 'desc',
      price: 20000),
  Product(
    username: 'personA',
    category: 'cat',
    description: 'desc',
  )
];

class ProductCardListView extends StatefulWidget {
  ProductCardListView(this.currentCategory);
  String currentCategory;
  @override
  _ProductCardListViewState createState() => _ProductCardListViewState();
}

class _ProductCardListViewState extends State<ProductCardListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text(''); //change with loading screen later? maybe
        }
        else{}
        List<Product> productList = productListing(snapshot.data);
        return Container(
        margin: EdgeInsets.all(15.0),
        height: 220.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 5.0),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              Product product = productList[index];

              return ProductCard(
                image: product.image,
                title: product.title ?? 'No Data',
                price: product.price ?? 0,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 15.0,
              );
            },
          ),
      );
  }
}
