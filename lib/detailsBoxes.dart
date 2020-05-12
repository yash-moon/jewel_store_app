import 'package:flutter/material.dart';
import 'package:jewelstoreapp/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsBox1 extends StatelessWidget {
  double _width;
  double _height;
  double _boxSize;
  Color _boxThemeColor;
  String _jewelColor;
  String _rareness;
  //
  DetailsBox1(double boxSize, String jewelColor) {
    this._width = boxSize - 17;
    this._height = boxSize;
    this._boxSize = boxSize;
    if (jewelColor == "Purple") {
      _jewelColor = jewelColor;
      _boxThemeColor = jewelColor1;
      _rareness = "Very Rare";
    } else {
      _jewelColor = jewelColor;
      _boxThemeColor = jewelColor2;
      _rareness = "Uncommon";
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VxBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Wave Jewel"
                    .text
                    .size(_height * 0.1)
                    .fontFamily("Nunito Sans")
                    .color(Color(0xff545A69))
                    .extraBold
                    .make(),
                //
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: _boxSize * 0.05),
                      width: _boxSize * 0.08,
                      height: _boxSize * 0.08,
                      decoration: BoxDecoration(
                          color: _boxThemeColor, shape: BoxShape.circle),
                    ),
                    //
                    _jewelColor.text
                        .size(_boxSize * 0.07)
                        .fontFamily("Nunito Sans")
                        .color(_boxThemeColor)
                        .make(),
                  ],
                )
              ],
            ),
          )
              .padding(
                EdgeInsets.only(
                    left: _boxSize * 0.11,
                    top: _boxSize * 0.1,
                    bottom: _boxSize * 0.11),
              )
              .make(),
          //
          SizedBox(
            child: Divider(
              color: Colors.grey.shade300,
            ),
          ),
          //
          VxBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Rareness"
                    .text
                    .fontFamily("Nunito Sans")
                    .size(_boxSize * 0.07)
                    .color(Color(0xff545A69).withOpacity(0.5))
                    .make(),
                _rareness.text
                    .fontFamily("Nunito Sans")
                    .size(_boxSize * 0.08)
                    .color(Color(0xff545A69))
                    .make()
              ],
            ),
          )
              .padding(
                EdgeInsets.only(left: _boxSize * 0.11, top: _boxSize * 0.1),
              )
              .make()
        ],
      ),
    ).white.withRounded(value: 8).width(_width).height(_height).makeCentered();
  }
}

class DetailsBox2 extends StatelessWidget {
  double _width;
  double _height;
  double _boxSize;
  var _waveGrad;
  //
  DetailsBox2(double boxSize, Gradient waveGrad) {
    this._width = boxSize - 17;
    this._height = boxSize;
    this._boxSize = boxSize;
    this._waveGrad = waveGrad;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VxBox(
          child: ClipPath(
            clipper: waveClip(),
            child: VxBox()
                .withRounded(value: 8)
                .withGradient(_waveGrad)
                .makeCentered(),
          ),
        ).white.withRounded(value: 8).size(_width, _height).makeCentered(),
        //
        VxBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Price Trends"
                        .text
                        .size(_height * 0.1)
                        .fontFamily("Nunito Sans")
                        .color(boldHeading)
                        .extraBold
                        .make(),
                    "1 April - Today"
                        .text
                        .size(_boxSize * 0.06)
                        .fontFamily("Nunito Sans")
                        .color(lightHeading)
                        .make(),
                  ],
                ),
              )
                  .transparent
                  .padding(EdgeInsets.only(
                      left: _boxSize * 0.11,
                      top: _boxSize * 0.1,
                      bottom: _boxSize * 0.11))
                  .make(),
              //
              VxBox(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Range"
                      .text
                      .fontFamily("Nunitio Sans")
                      .size(_boxSize * 0.07)
                      .color(lightHeading)
                      .make(),
                  "\$520 - \$560 / gm."
                      .text
                      .fontFamily("Nunitio Sans")
                      .size(_boxSize * 0.07)
                      .color(lightHeading)
                      .make(),
                ],
              ))
                  .transparent
                  .padding(EdgeInsets.only(
                      left: _boxSize * 0.11, top: _boxSize * 0.23))
                  .make()
            ],
          ),
        ).transparent.withRounded(value: 8).size(_width, _height).makeCentered()
      ],
    );
  }
}

class waveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.54);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.61, size.width / 2,
        size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.38, size.width, size.height * 0.38);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
