import 'package:flutter_e_commerce_app_with_backend/pages/cart_page/cart_page.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/food/popular_food_detail.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/food/recommended_food_detail.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/home/home_page.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/home/main_food_page.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => "$splashPage";
  static String getInitial() => "$initial";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => "${cartPage}";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    //route MainFood
    GetPage(name: initial, page: () => const HomePage()),
    //route popularFood
    GetPage(
      name: popularFood,
      page: () {
        //get pageId from parameter function above
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          page: "$page",
        );
      },
      transition:
          Transition.fadeIn, //animation when click to another screen or page
    ),
    //route recommendedFood
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: "$page",
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
