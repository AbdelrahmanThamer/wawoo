import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/size_config.dart';
import 'package:woogoods/constants/strings.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/view/screens/cart/cart_screen.dart';
import 'package:woogoods/view/screens/dashboard/dashboard_screen.dart';
import 'package:woogoods/view/screens/search/search_home_screen.dart';
import 'package:woogoods/view/widgets/custom_appbar.dart';
import 'package:woogoods/view/widgets/input_form_widget.dart';
import 'package:woogoods/view/widgets/text_btn.dart';

import 'components/all_products.dart';
import 'components/category_list.dart';

class StoreProfileHomeScreen extends StatelessWidget {
  static const routeName = 'store_profile_home_screen';
  final TextEditingController searchController = TextEditingController();

  StoreProfileHomeScreen({Key? key, this.initialIndex = 0}) : super(key: key);
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          backgroundColor: const Color(0xFF274AFF).withOpacity(0.99),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFF274AFF),
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: kWhiteColor,
            systemNavigationBarDividerColor: kWhiteColor,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                color: const Color(0xFF274AFF).withOpacity(0.99),
                search: InkWell(
                  onTap: () => Get.to(
                    () => const SearchHomeScreen(),
                  ),
                  child: InputFormWidget(
                    fieldController: searchController,
                    prefixIcon: Icons.search,
                    icon: Icons.camera_alt_outlined,
                    hintText: 'Search...'.tr,
                    borderColor: kPrimaryColor,
                    maxLines: 1,
                    radius: 30,
                    borderWidth: 1.0,
                    height: getProportionateScreenHeight(38),
                    absorbing: true,
                  ),
                ),
                actionWidget: Row(
                  children: [
                    kWidthBox10,
                    InkWell(
                      onTap: () => Get.to(
                        () => const CartListScreen(),
                      ),
                      child: SizedBox(
                        width: 20,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SvgPicture.asset(
                              Images.cart,
                              color: kWhiteColor,
                              height: 20,
                            ),
                            Positioned(
                              top: -10,
                              right: -5,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: kPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '1',
                                  style: kDescriptionText.copyWith(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    kWidthBox10,
                    InkWell(
                      onTap: () => Get.offAll(
                        () => const DashBoardScreen(
                          index: 0,
                        ),
                      ),
                      child: SizedBox(
                        width: 20,
                        child: SvgPicture.asset(
                          Images.moreVert,
                          color: kWhiteColor,
                          height: 20,
                        ),
                      ),
                    ),
                    kWidthBox10,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF274AFF).withOpacity(0.99),
                      const Color(0xFFFF3A27).withOpacity(0.99),
                    ],
                  ),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                        color: kWhiteColor,
                                      ),
                                ),
                                kHeightBox5,
                                Row(
                                  children: [
                                    SizedBox(
                                        child: SvgPicture.asset(
                                      Images.storeProfiles,
                                      color: kWhiteColor,
                                    )),
                                    Text(
                                      ' 10k',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            fontSize: 12.0,
                                            color: kWhiteColor,
                                          ),
                                    ),
                                  ],
                                ),
                                kHeightBox5,
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: 5,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 15.0,
                                      direction: Axis.horizontal,
                                    ),
                                    kWidthBox5,
                                    Text(
                                      '5.0',
                                      style: kDescriptionText.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                    kWidthBox5,
                                    Text(
                                      '(1000 Reviews)',
                                      style: kSmallText.copyWith(
                                        color: Get.isDarkMode
                                            ? kWhiteColor
                                            : Colors.white70,
                                      ),
                                    ),
                                    kWidthBox5,
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
                                        color: kWhiteColor,
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
                                height: getProportionateScreenHeight(30),
                                btnColor:
                                    const Color(0xFFFF6D27).withOpacity(.99),
                                btnColor2:
                                    const Color(0xFFFF6D27).withOpacity(.99),
                                onPress: () {},
                                title: 'Follow'.tr,
                              ),
                              kWidthBox5,
                            ],
                          ),
                        ),
                      ],
                    ),
                    kHeightBox10,
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: TabBar(
                        indicatorColor: kWhiteColor,
                        indicatorWeight: 1,
                        labelColor: kWhiteColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: false,
                        unselectedLabelColor: kWhiteColor,
                        unselectedLabelStyle: kRegularText2.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                        labelStyle: kRegularText2.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: [
                          Tab(
                            text: 'All Products'.tr,
                          ),
                          Tab(
                            text: 'Category'.tr,
                          ),
                        ],
                      ),
                    ),
                    kHeightBox5,
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AllProductsStore(),
                    const CategoryList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
