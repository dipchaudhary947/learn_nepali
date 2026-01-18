import 'package:flutter/material.dart';

class ImgIconStyles {
  
  // GetStarted UI Image 
  static Image homeUiImage({
    required String iconImage,
    required double size,
  }) {
    return Image.asset("assets/images/$iconImage", width: size, height: size);
  }
}