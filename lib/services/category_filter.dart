import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karya_garudahacks/services/database.dart';
import 'package:karya_garudahacks/model/user.dart';

class CategoryFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: DatabaseService(uid: user.uid).categoryData,
      builder: (context, snapshot){
        CategoryData categoryData = snapshot.data;
        //return function(categoryData)
      },
    );
  }
}
