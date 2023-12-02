import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_with_backend/controller/popular_product_controller.dart';
import 'package:flutter_e_commerce_app_with_backend/controller/recommended_product_controller.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/cart_page/cart_page.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/food/popular_food_detail.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/food/recommended_food_detail.dart';
import 'package:flutter_e_commerce_app_with_backend/pages/home/main_food_page.dart';
import 'package:flutter_e_commerce_app_with_backend/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  //widgetsFlutterBinding make sure dependency is loaded correctly and wait process
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //load data from controller
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
