import 'package:flutter/material.dart';
import 'package:jewelstoreapp/colors.dart';
import 'package:jewelstoreapp/pages/page1.dart';
import 'package:jewelstoreapp/pages/page2.dart';
import 'package:jewelstoreapp/painted_paths.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'clipped_paths.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //   ),
  // );
  runApp(
    MyPage(),
  );
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: JewelPage(),
      ),
    );
  }
}

class JewelPage extends StatefulWidget {
  @override
  _JewelPageState createState() => _JewelPageState();
}

class _JewelPageState extends State<JewelPage> {
  var backgroundColor;
  //blobs size and position for pageview
  final GlobalKey _blobkey = GlobalKey();
  Size blobSize;
  //
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        blobSizeAndPosition();
      },
    );
  }

  //
  blobSizeAndPosition() {
    RenderBox box = _blobkey.currentContext.findRenderObject();
    blobSize = box.size;
  }
  //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          VxBox().withGradient(backgroundColor).make(),
          //
          // Custom paint blob
          CustomPaint(
            key: _blobkey,
            painter: PaintedBlob(),
            child: VxBox().make(),
          ),
          //top part shadow
          CustomPaint(
            painter: PaintedTopShadow(),
            child: VxBox().make(),
          ),
          //bottom part shadow
          Padding(
            padding: const EdgeInsets.only(bottom: 68.0),
            child: CustomPaint(
              painter: PaintedBottomShadow(),
              child: VxBox().make(),
            ),
          ),

          //top clipped part with bg gradient
          ClipPath(
            clipper: TopClippedPart(),
            child: VxBox().withGradient(backgroundColor).make(),
          ),

          // bottom clipped part witn bg gradient
          ClipPath(
            clipper: BottomClippedPart(),
            child: VxBox().withGradient(backgroundColor).make(),
          ),

          Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: boldHeading,
                ),
              ).pOnly(top: 1.5),
              "Explore Jewels"
                  .text
                  .bold
                  .xl3
                  .fontFamily("Nunitio Sans")
                  .color(boldHeading)
                  .make()
            ],
          ),

          // bottom row
          PageView(
            onPageChanged: (index) {
              setState(() {
                index == 0
                    ? backgroundColor = bgGrad1
                    : backgroundColor = bgGrad2;
              });
            },
            children: [
              PageOne(blobSize),
              PageTwo(blobSize),
            ],
          ),
          //
        ],
      ),
    );
  }
}
