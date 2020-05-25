import 'package:flutter/material.dart';

// Responsive Padding
EdgeInsetsGeometry responsivePadding(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if ( deviceWidth < 700 ) {
    return EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  } else if ( deviceWidth < 1200 ) {
    return EdgeInsets.symmetric(horizontal: 50, vertical: 25);
  } else if ( deviceWidth < 1650 ) {
    return EdgeInsets.symmetric(horizontal: 80, vertical: 40);
  }
  return EdgeInsets.symmetric(horizontal: 100, vertical: 50);
}

// Number of Grid Returned
int responsiveNumGridTiles(MediaQueryData mediaQuery) {
  double deviceWidth  = mediaQuery.size.width;
  if (deviceWidth < 700 ) {
    return 1;
  } else if (deviceWidth < 1200 ) {
    return 2;
  } else if (deviceWidth < 1650 ) {
    return 3;
  }
  return 4;
}

// Image ReSize
double responsiveImageHeight(MediaQueryData mediaQuery) {
  double deviceWidth  = mediaQuery.size.width;
  if (deviceWidth < 700 ) {
    return 250.0;
  } else if (deviceWidth < 1200 ) {
    return mediaQuery.size.width * 0.25;
  } else if (deviceWidth < 1650 ) {
    return mediaQuery.size.width * 0.2;
  }
  return mediaQuery.size.width * 0.15;
}

// Reponsive Title Height
double responsiveTitleHeight(MediaQueryData mediaQuery) {
  double deviceWidth  = mediaQuery.size.width;
  if (deviceWidth < 700 ) {
    return 120;
  } else if (deviceWidth < 1200 ) {
    return mediaQuery.size.width * 0.1;
  } else if (deviceWidth < 1650 ) {
    return mediaQuery.size.width * 0.07;
  }
  return mediaQuery.size.width * 0.05;
  }

