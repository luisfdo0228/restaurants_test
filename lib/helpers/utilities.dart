import 'package:flutter/material.dart';

class Utilities  {


  int getColorPrimary() {
    String hexColor = "#0d3a33";
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  EdgeInsets getEdge(){
    return const EdgeInsets.fromLTRB(20, 15, 20, 15);
  }


}