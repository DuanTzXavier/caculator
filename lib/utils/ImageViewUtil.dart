import 'package:flutter/widgets.dart';

class ImageViewUtil{
  static Widget getImageView(String assertName){
    return Image(image: AssetImage(assertName));
  }

}