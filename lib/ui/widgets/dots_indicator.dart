import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.activeColor: Colors.white,
    this.inactiveColor: Colors.white30,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;

  // The base size of the dots
  static const double _kDotSize = 6.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 16.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );

    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: controller.page == index ? activeColor : inactiveColor,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize,
            height: _kDotSize,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
