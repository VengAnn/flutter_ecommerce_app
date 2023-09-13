import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_e_commerce_app_with_backend/utils/dimensions.dart';

import '../utils/app_colors.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_text_widget.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //Propeties for pageview if you not use package name Carousel
  //   final PageController pageController = PageController(
  //   initialPage: 0,
  //   viewportFraction: 0.85,
  // );

  // var currentPageValue = 0.0;

  // @override
  // void initState() {
  //   pageController.addListener(() {
  //     currentPageValue = pageController.page!;
  //     setState(() {});
  //     //  print("currentPage: ${currentPageValue.toString()}");
  //   });
  //   super.initState();
  // }

  // //dispose
  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }
  List<Widget> imageList = [
    ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/real/coffee.jpg",
          fit: BoxFit.cover,
        )),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/real/apple_pie.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/real/hamburger.jpg",
          fit: BoxFit.cover,
        )),
  ];
  int currentPageValue = 0;
  @override
  Widget build(BuildContext context) {
    // print("currentHeight: ${MediaQuery.of(context).size.height}");
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: Dimensions.parentCarouselContainer, // height: 350,
          // color: Colors.amber,
          child: CarouselSlider(
            options: CarouselOptions(
              height: Dimensions.carouselContainer,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              //reverse: false,
              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 3),
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.26,
              onPageChanged: (index, reason) {
                currentPageValue = index;
                setState(() {});
              },
              scrollDirection: Axis.horizontal,
            ),
            items: imageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    clipBehavior: Clip.none, // Allow children to overflow
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,

                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        // decoration: const BoxDecoration(color: Colors.amber),
                        child: i, // Show imageList
                      ),
                      //
                      Positioned.fill(
                        bottom: -Dimensions.height20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: Dimensions
                                .carouselTextContainer, // maybe height equal: 110,
                            margin: EdgeInsets.only(
                              left: Dimensions.paddingLeft20,
                              right: Dimensions.paddingLeft20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey,
                                  offset: Offset(0, 5),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 2.0,
                                  offset: Offset(-5, 0),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 2.0,
                                  offset: Offset(5, 0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(Dimensions.padding7),
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      text: "Chinese Side",
                                      size: Dimensions.fontSize20,
                                    ),
                                    SizedBox(height: Dimensions.height5),
                                    Row(
                                      children: [
                                        Wrap(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(
                                              Icons.star,
                                              size: Dimensions
                                                  .fontSize20, //size:20
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        //
                                        SmallText(
                                          text: "4.5",
                                          size: Dimensions.fontSize15,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        SmallText(
                                          text: "1350",
                                          size: Dimensions.fontSize15,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        SmallText(
                                          text: "Comments",
                                          size: Dimensions.fontSize15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Dimensions.height5),
                                    //
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextReusableWidget(
                                          icondata: Icons.circle_sharp,
                                          text: "Normal",
                                          sizeText: Dimensions.fontSize15,
                                          colorIcons: Colors.orange,
                                        ),
                                        IconAndTextReusableWidget(
                                          icondata: Icons.location_on,
                                          colorIcons: Colors.green,
                                          text: "1.7km",
                                          sizeText: Dimensions.fontSize15,
                                        ),
                                        IconAndTextReusableWidget(
                                          icondata: Icons.access_time_rounded,
                                          colorIcons: AppColor.mainColor,
                                          text: "33min",
                                          sizeText: Dimensions.fontSize15,
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
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        //
        // const SizedBox(
        //   height: 60,
        // ),
        Wrap(
          children: List.generate(
            imageList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: index == currentPageValue ? 20 : 10,
                height: 5,
                color: index == currentPageValue ? Colors.yellow : Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
