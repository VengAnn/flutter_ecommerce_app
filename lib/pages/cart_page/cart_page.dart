import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_with_backend/controller/cart_controller.dart';
import 'package:flutter_e_commerce_app_with_backend/routes/route_helper.dart';
import 'package:flutter_e_commerce_app_with_backend/utils/dimensions.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/app_icon.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/big_text.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.blue,
                    backgroundColor: Colors.grey[200]!,
                    size: (Dimensions.iconsize16 * 2),
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.initial);
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.blue,
                    backgroundColor: Colors.grey[200]!,
                    size: (Dimensions.iconsize16 * 2),
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.blue,
                  backgroundColor: Colors.grey[200]!,
                  size: (Dimensions.iconsize16 * 2),
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            right: Dimensions.width10,
            left: Dimensions.width10,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height5),
              width: double.maxFinite,
              height: MediaQuery.sizeOf(context).height,
              // color: Colors.blue,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: Dimensions.height5),
                                width: Dimensions.width20 * 5,
                                height: Dimensions.height20 * 5,
                                decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "${AppConstants.BASE_URL}/uploads/${cartController.getItems[index].img}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height20),
                                ),
                              ),
                              //
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: Dimensions.height5,
                                    left: Dimensions.width5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text:
                                            "${cartController.getItems[index].name}",
                                        size: Dimensions.fontSize20 * 1.5,
                                        color: Colors.black54,
                                      ),
                                      SmallText(
                                        text: "spicy",
                                        size: Dimensions.fontSize15 / 1.2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                "\$ ${cartController.getItems[index].price}",
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height5 / 1.6,
                                              bottom: Dimensions.height5 / 1.7,
                                              left: Dimensions.width20,
                                              right: Dimensions.width20,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15),
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // cartController
                                                    //    .(false);
                                                  },
                                                  child:
                                                      const Icon(Icons.remove),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width5,
                                                ),
                                                BigText(
                                                  text:
                                                      "0", //popularProduct.incrementItemCarts
                                                  size: Dimensions.fontSize20,
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // popularProduct
                                                    //     .setQuantity(true);
                                                  },
                                                  child: const Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
