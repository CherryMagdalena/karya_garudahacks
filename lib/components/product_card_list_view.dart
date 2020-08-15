import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/product.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/clicked_post_screen.dart';
import 'package:karya_garudahacks/components/price_formatter.dart';
import 'package:karya_garudahacks/components/filtered_search.dart';

class ProductCardListView extends StatefulWidget {
  ProductCardListView(this.category);
  String category;
  @override
  _ProductCardListViewState createState() => _ProductCardListViewState();
}

class _ProductCardListViewState extends State<ProductCardListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(''); //change with loading screen later? maybe
            } else {}
            List<Product> productList = productListing(snapshot.data);
            List productCardList = [];

            bool finishedForLoop = false;
            for (int i = 0; i < productList.length; i++) {
              if (widget.category == 'null' ||
                  productList[i].category == widget.category) {
                productCardList.add(i);
              }
              if (i == productList.length - 1) {
                finishedForLoop = true;
              }
            }

            if (snapshot.connectionState != ConnectionState.waiting &&
                finishedForLoop == false) {
              return Text('');
            }

            return Container(
              margin: EdgeInsets.all(10.0),
              height: 250.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 5.0),
                itemCount: productCardList.length,
                itemBuilder: (context, index) {
                  Product product = productList[productCardList[index]];

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
          }),
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
            height: 150.0,
            width: 150.0,
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
