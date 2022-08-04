import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/size_config.dart';
import 'package:woogoods/constants/style_data.dart';

class MessageCenterCard extends StatelessWidget {
  const MessageCenterCard({
    Key? key,
    required this.index,
    required this.indexLength,
    this.onPress,
  }) : super(key: key);
  final Function? onPress;
  final int index;
  final int indexLength;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress as void Function(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: index == indexLength - 1
                  ? Colors.transparent
                  : kStUnderLineColor,
              width: .3,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Images.userPlaceHolder,
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Shop Name',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Text(
                          '01/10/2021',
                          textAlign: TextAlign.end,
                          style: kRegularText2.copyWith(
                              color: kStUnderLineColor,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    kHeightBox5,
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultrices tellus lacus, velbibendum dui mattis non.',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Get.isDarkMode
                                ? kStUnderLineColor
                                : kStUnderLineColor2,
                            fontSize: 14.0,
                            height: 1.10,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
