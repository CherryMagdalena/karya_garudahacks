import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:karya_garudahacks/model/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color3,
      child: Center(
        child: SpinKitFoldingCube(
           color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
