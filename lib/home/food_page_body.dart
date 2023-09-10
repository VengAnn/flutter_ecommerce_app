import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_with_backend/utils/app_colors.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/big_text.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/icon_text_widget.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  var currentPageValue = 0.0;
  double scaleFactor = 0.8;

  @override
  void initState() {
    pageController.addListener(() {
      currentPageValue = pageController.page!;
      setState(() {});
      print("currentPage: ${currentPageValue.toString()}");
    });
    super.initState();
  }

  //dispose
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildPageItems(index);
        },
      ),
    );
  }

  Widget _buildPageItems(int index) {
    // ignore: unnecessary_new
    Matrix4 matrix = new Matrix4.identity();
    if (index == currentPageValue) {
      var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      //pass value to matrix
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == currentPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 250,
            width: double.maxFinite,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/real/hamburger.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width - 120,
              margin: const EdgeInsets.only(left: 15, right: 30, bottom: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  width: 1.0,
                  color: Colors.black.withOpacity(0.3),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.3),
                //     spreadRadius: 2,
                //     blurRadius: 2,
                //   ),
                //   ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigText(text: "Chinese Side"),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          //
                          SmallText(
                            text: "4.5",
                            size: 16,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SmallText(
                            text: "1350",
                            size: 16,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SmallText(
                            text: "Comments",
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextReusableWidget(
                            icondata: Icons.circle_sharp,
                            text: "Normal",
                            colorIcons: Colors.orange,
                            sizeText: 16.0,
                          ),
                          IconAndTextReusableWidget(
                            icondata: Icons.location_on,
                            colorIcons: Colors.green,
                            text: "1.7km",
                            sizeText: 16.0,
                          ),
                          IconAndTextReusableWidget(
                            icondata: Icons.access_time_rounded,
                            colorIcons: AppColor.mainColor,
                            text: "33min",
                            sizeText: 16.0,
                          ),
                        ],
                      ),
                      //
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
