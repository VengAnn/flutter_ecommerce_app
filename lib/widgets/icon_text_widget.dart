import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_with_backend/widgets/small_text.dart';

// ignore: must_be_immutable
class IconAndTextReusableWidget extends StatelessWidget {
  final IconData? icondata;
  final Color colorIcons;
  final String text;
  double? sizeText;
  IconAndTextReusableWidget({
    super.key,
    required this.icondata,
    this.colorIcons = const Color(0xFFDDD4D2),
    required this.text,
    this.sizeText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icondata,
          color: colorIcons,
        ),
        const SizedBox(width: 5.0),
        SmallText(
          text: text,
          size: sizeText,
        ),
      ],
    );
  }
}
