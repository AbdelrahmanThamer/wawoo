import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/size_config.dart';
import 'package:woogoods/constants/strings.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/view/widgets/text_btn.dart';

class StoreCardList extends StatelessWidget {
  final bool isFlow;
  final int index;
  final Function? onPress;
  const StoreCardList({
    Key? key,
    this.isFlow = false,
    required this.index,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          InkWell(
            onTap: onPress as void Function()?,
            child: Card(
              color: Theme.of(context).cardColor,
              margin: EdgeInsets.zero,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  kHeightBox10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: isImageShow
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  Images.user,
                                  width: getProportionateScreenWidth(65),
                                  height: getProportionateScreenWidth(65),
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: kOrdinaryColor2,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: getProportionateScreenWidth(65),
                                height: getProportionateScreenWidth(65),
                                child: Image.asset(Images.placeHolder),
                              ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shop Name',
                                maxLines: 1,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              kHeightBox5,
                              Row(
                                children: [
                                  SizedBox(
                                      child: SvgPicture.asset(
                                    Images.storeProfiles,
                                    color: Get.isDarkMode
                                        ? kWhiteColor
                                        : kBlackColor2,
                                  )),
                                  Text(
                                    ' 10k',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          fontSize: 12.0,
                                          color: Get.isDarkMode
                                              ? kWhiteColor
                                              : kBlackColor2,
                                        ),
                                  ),
                                ],
                              ),
                              kHeightBox5,
                              Text(
                                '99% positive Sell Ratings',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      fontSize: 12.0,
                                      color: Get.isDarkMode
                                          ? kWhiteColor
                                          : kBlackColor2,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            TextButtons(
                              radius: 5.0,
                              height: getProportionateScreenHeight(24),
                              btnColor: index == 2
                                  ? kFbColors
                                  : const Color(0xFFFF6D27).withOpacity(.99),
                              btnColor2: index == 2
                                  ? kFbColors
                                  : const Color(0xFFFF6D27).withOpacity(.99),
                              onPress: () {},
                              title: index == 2 ? 'Following'.tr : 'Follow'.tr,
                            ),
                            kWidthBox5,
                          ],
                        ),
                      ),
                    ],
                  ),
                  kHeightBox10,
                ],
              ),
            ),
          ),
          kHeightBox10,
        ],
      ),
    );
  }
}
