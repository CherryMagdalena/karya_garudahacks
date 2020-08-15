import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/clicked_post_screen.dart';
import 'package:karya_garudahacks/components/price_formatter.dart';

//Sample
List productList = [
  Product(
      username: 'personA',
      category: 'sculpture',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/e/e2/Nok_sculpture_Louvre_70-1998-11-1.jpg',
      title: 'Unique Sculpture',
      description: 'desc',
      price: 320800),
  Product(
      username: 'personB',
      category: 'painting',
      image:
          'https://cdn.pixabay.com/photo/2018/05/20/03/36/watercolor-3414923_960_720.jpg',
      title: 'Watercolor',
      description: 'desc',
      price: 20000),
  Product(
      username: 'personC',
      category: 'wayang',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/9/99/Wayang_sejarah.jpg',
      title: 'Wayang',
      description: 'desc',
      price: 100000)
];

class ProductCardListView extends StatefulWidget {
  @override
  _ProductCardListViewState createState() => _ProductCardListViewState();
}

class _ProductCardListViewState extends State<ProductCardListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 250.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 5.0),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          Product product = productList[index];

          return ProductCard(
            product,
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

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ClickedPost(product)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 170.0,
            width: 170.0,
            decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(20.0),
                image: product.image != null
                    ? DecorationImage(
                        image: NetworkImage(product.image), fit: BoxFit.fill)
                    : null),
          ),
          Text(product.title, style: TextStyle(fontSize: 20.0)),
          Text(priceFormatter(product.price), style: TextStyle(fontSize: 17.0))
        ],
      ),
    );
  }
}
