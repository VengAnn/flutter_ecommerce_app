import 'package:get/get.dart';

//Dimentsions is meaning size such as width height panding and other...
class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //844 is height of fullScreen and i want to height=10
  //you can => 844/10 = 84.4;
  static double carouselContainer = screenHeight / 3.4;
  static double parentCarouselContainer = screenHeight / 2.7;
  static double carouselTextContainer = screenHeight / 7.4;

  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 40.2;
  static double height5 = screenHeight / 126.6;
  static double width10 = screenHeight / 84.4;
  static double paddingLeft20 = screenHeight / 30.0;

  static double fontSize15 = screenHeight / 53.74;
  static double fontSize20 = screenHeight / 42.2;

  static double padding7 = screenHeight / 120.2;

  //IconSize
  static double iconSizeHeight45 = screenHeight / 18.5;
  static double iconSize17 = screenHeight / 35.2;
}
