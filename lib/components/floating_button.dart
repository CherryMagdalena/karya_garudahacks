import 'package:flutter/material.dart';
import 'package:karya_garudahacks/model/colors.dart';
import 'package:karya_garudahacks/screens/upload_page_screen.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add_circle_outline,
        color: Colors.white,
      ),
      backgroundColor: color2,
      //Navigate to upload screen
      onPressed: () => UploadPage(),
    );
  }
}
