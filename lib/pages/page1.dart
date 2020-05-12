import 'package:flutter/material.dart';
import 'package:jewelstoreapp/colors.dart';
import 'package:jewelstoreapp/detailsBoxes.dart';
import 'package:velocity_x/velocity_x.dart';

class PageOne extends StatelessWidget {
  Size blobSize;
  PageOne(Size blobSize) {
    this.blobSize = blobSize;
  }
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 45,
            bottom: 180,
            left: 0,
            right: 0,
            child: Image.asset("images/jewel1.png"),
          ),
          //
          Positioned(
            bottom: 5,
            child: Container(
              width: _width,
              height: 200,
              color: Colors.transparent,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DetailsBox1(context.screenWidth / 2 + 5, "Purple"),
                    //
                    SizedBox(
                      width: 30,
                    ),
                    //
                    DetailsBox2(context.screenWidth / 2 + 5, waveGradient1)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
