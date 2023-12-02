import 'package:flutter_e_commerce_app_with_backend/pages/cart_page/cart_page.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/food/popular_food_detail.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/food/recommended_food_detail.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static List<GetPage> routes = [
    //route MainFood
    GetPage(name: initial, page: () => const MainFoodPage()),
    //route popularFood
    GetPage(
      name: popularFood,
      page: () {
        //get pageId from parameter function above
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),

    //route recommendedFood
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        // print("call poular food page");
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
