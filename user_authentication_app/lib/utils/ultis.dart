import 'package:flutter/material.dart';

edgeInsectOnly(left, right, top, bottom) {
  return EdgeInsets.only(top: top, left: left, right: right, bottom: bottom);
}

edgeInsectAll(allMarginSize) {
  return EdgeInsets.all(allMarginSize);
}

edgeInsectSymmentric(horizontalMargin, verticalMargin) {
  return EdgeInsets.symmetric(
      horizontal: horizontalMargin, vertical: verticalMargin);
}
