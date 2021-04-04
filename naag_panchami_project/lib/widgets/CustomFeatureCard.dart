import 'package:flutter/material.dart';
import 'package:naag_panchami/utils/SizeConfig.dart';

class CustomFeatureCard extends StatelessWidget {
  const CustomFeatureCard({
    Key key,
    @required this.size,
    this.imageUrl,
    this.ontap,
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
            left: 3.86 * SizeConfig.widthMultiplier,
            top: 3.86 * SizeConfig.widthMultiplier / 2,
            bottom: 3.86 * SizeConfig.widthMultiplier / 2),
        width: size.width * 0.8,
        height: 40 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            )),
      ),
      // onTap: ontap,
    );
  }
}