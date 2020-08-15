// Home Screen
import 'package:flutter/material.dart';
import 'package:karya_garudahacks/components/floating_button.dart';
import 'package:karya_garudahacks/components/app_bar.dart';
import 'package:karya_garudahacks/components/bottom_app_bar.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/services/category_filter.dart';
import 'package:karya_garudahacks/services/database.dart';
import 'package:karya_garudahacks/model/user.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: color4,
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomAppBar(),
        floatingActionButton: FloatingButton(),
        body: StreamBuilder(///if you want to see your home screen layout code, head over to filtered_search.dart and CTRL+F for "home screen layout"
          stream: DatabaseService().postData,
          builder: (context, snapshot){
            PostData postData = snapshot.data;
            CategoryData categoryData = snapshot.data;
            return Container(
              child: Column(
                children: [CategoryFilter(),]
            ),
            );
          }
        ),
      ),
    );
  }
}