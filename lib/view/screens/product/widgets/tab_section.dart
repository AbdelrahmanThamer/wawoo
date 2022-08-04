
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/strings.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/controllers/review_controller.dart';
import 'package:woogoods/models/product_details_overview_data.dart';
import 'package:woogoods/models/response/product_list.dart';
import 'package:woogoods/view/screens/product/widgets/review_widget.dart';
import 'package:woogoods/view/screens/review/review_product_screen.dart';
import 'package:woogoods/view/widgets/custom_loader.dart';

import '../../../../controllers/orders_controller.dart';
import '../../../../util/others_methods.dart';
import 'cart_select.dart';
import 'related_products.dart';

class CategorySection extends StatelessWidget {
  final ReviewController reviewController = Get.find();

  final ProductList productList;
  final Category category;
  final int indexList;

  CategorySection({
    Key? key,
    required this.category,
    required this.indexList,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildFoodTileList(context);
  }

  Widget _buildFoodTileList(BuildContext context) {
    return buildBody(context, indexList, productList, reviewController);
  }
}

buildBody(BuildContext context, int index, ProductList productDetailsController,
    ReviewController reviewController) {
  return Container(
    child: index == 0
        ? buildOverView(context, productDetailsController)
        : index == 1
            ? buildProductDetails(context, productDetailsController)
            : index == 2
                ? buildReviews(
                    context, productDetailsController, reviewController)
                : RelatedProducts(
                    catId:
                        (productDetailsController.categories?.length ?? 0) > 0
                            ? (productDetailsController.categories![0].id ?? 0)
                            : 0,
      productId: productDetailsController.id ?? 0,),
  );
}

buildOverView(BuildContext context, ProductList productDetailsController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  kCurrency +
                      '${productDetailsController.salePrice == '' ? productDetailsController.price : productDetailsController.salePrice}',
                  style: kAppBarText.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (productDetailsController.regularPrice != "" &&
                    double.parse(productDetailsController
                        .regularPrice ??
                        '0') >
                        double.parse(
                            productDetailsController.price ??
                                '0'))
                  Row(
                    children: [
                      kWidthBox10,
                      Text(
                        kCurrency + (productDetailsController.regularPrice ?? ''),
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(
                          color: kStUnderLineColor,
                          decoration:
                          TextDecoration.lineThrough,
                        ),
                      ),
                      kWidthBox10,
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: kPrimaryColor,
                          ),
                        ),
                        child: Text(
                          '${((double.parse(productDetailsController.regularPrice ?? '0') - double.parse(productDetailsController.price ?? '0')) / double.parse(productDetailsController.regularPrice ?? '0') * 100).toInt()}% OFF',
                          style: kSmallText.copyWith(
                            color: kPrimaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    OthersMethod.sharePost(
                        title: productDetailsController.name ?? '',
                        subTitle:
                            '| ${productDetailsController.permalink ?? ''}');
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? kBlackColor2
                          : const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SvgPicture.asset(
                      Images.share,
                      width: 13,
                      height: 16,
                      color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
                    ),
                  ),
                ),
              ],
            ),
            kHeightBox10,
            Text(
              productDetailsController.name
                      ?.replaceAll(htmlValidatorRegExp, '') ??
                  '',
              style: kRegularText.copyWith(
                color: Get.isDarkMode ? kWhiteColor : const Color(0xFF303030),
              ),
            ),
            kHeightBox10,
            Row(
              children: [
                Text(
                  productDetailsController.averageRating ?? '',
                  style: kDescriptionText.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
                  ),
                ),
                kWidthBox5,
                RatingBarIndicator(
                  rating: double.parse(
                      productDetailsController.averageRating ?? '0.0'),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
                kWidthBox5,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${productDetailsController.ratingCount} ' +
                            'Reviews'.tr,
                        style: kDescriptionText.copyWith(
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : const Color(0xFF707070),
                        ),
                      ),
                      TextSpan(
                        text: ' | ',
                        style: kDescriptionText.copyWith(
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : const Color(0xFF707070),
                        ),
                      ),
                      TextSpan(
                        text: '500 ' + 'Wishlist'.tr,
                        style: kDescriptionText.copyWith(
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : const Color(0xFF707070),
                        ),
                      ),
                    ],
                  ),
                ),
                kWidthBox5,
              ],
            ),
          ],
        ),
      ),
      kHeightBox10,
      Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersController>(
          builder: (checkoutController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Shipping'.tr,
                            style: kRegularText.copyWith(
                              color: Get.isDarkMode
                                  ? kWhiteColor
                                  : const Color(0xFF303030),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text:
                            ' $kCurrency${checkoutController.shippingFee}',
                            style: kRegularText2.copyWith(
                              color: Get.isDarkMode
                                  ? kWhiteColor
                                  : const Color(0xFF303030),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                kHeightBox10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.shippingBox,
                      width: 15,
                      height: 15,
                      color: Get.isDarkMode ? kWhiteColor : kBlackColor,
                    ),
                    kWidthBox10,
                    Flexible(
                      child: Text(
                        'Cash on Delivery',
                        style: kRegularText2.copyWith(
                          color: Get.isDarkMode
                              ? kWhiteColor
                              : const Color(0xFF303030),
                        ),
                      ),
                    ),
                  ],
                ),
                kHeightBox10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.thunder,
                      width: 15,
                      height: 15,
                      color: Get.isDarkMode ? kWhiteColor : kBlackColor,
                    ),
                    kWidthBox10,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Ships in'.tr,
                            style: kRegularText2.copyWith(
                              color: Get.isDarkMode
                                  ? kWhiteColor
                                  : const Color(0xFF303030),
                            ),
                          ),
                          TextSpan(
                            text: ' 3 - 7 days',
                            style: kRegularText2.copyWith(
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                kHeightBox10,
                const Divider(
                  thickness: .3,
                  height: .3,
                  color: Color(0xFF808080),
                ),
                kHeightBox10,
              ],
            );
          },
        ),
      ),
      SizedBox(
        child: OthersMethod.variationsIsEmptyCheck(productDetailsController) == false
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeightBox10,
                  Container(
                    color: Theme.of(context).cardColor,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Variations'.tr,
                                    style: kRegularText.copyWith(
                                      color: Get.isDarkMode
                                          ? kWhiteColor
                                          : const Color(0xFF303030),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (productDetailsController.manageStock ?? false) {
                                  var cart = CartSelect();
                                  await OthersMethod.variationsSelected(
                                      productDetailsController);
                                  cart.cartView(
                                    context: context,
                                    isCartBuy: true,
                                    productDetailsController:
                                        productDetailsController,
                                  );
                                } else {
                                  showCustomSnackBar(
                                      'This product out of stock!');
                                }
                              },
                              child: Text(
                                'Select',
                                style: kRegularText2.copyWith(
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        kHeightBox10,
                        ListView.builder(
                          itemCount:
                              productDetailsController.attributes?.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, int index) {
                            return SizedBox(
                              child: productDetailsController
                                      .attributes![index].options!.isEmpty
                                  ? const SizedBox()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (productDetailsController
                                                          .attributes?[index]
                                                          .name ??
                                                      '') ==
                                                  'color'
                                              ? 'Color Family'
                                              : (productDetailsController
                                                              .attributes?[
                                                                  index]
                                                              .name ??
                                                          '') ==
                                                      'size'
                                                  ? 'Size'
                                                  : productDetailsController
                                                          .attributes?[index]
                                                          .name ??
                                                      '',
                                          style: kRegularText.copyWith(
                                            color: Get.isDarkMode
                                                ? kWhiteColor
                                                : const Color(0xFF303030),
                                          ),
                                        ),
                                        kHeightBox5,
                                        Wrap(
                                          children: [
                                            for (int i = 0;
                                                i <
                                                    productDetailsController
                                                        .attributes![index]
                                                        .options!
                                                        .length;
                                                i++)
                                              Text(
                                                '${productDetailsController.attributes![index].options?[i] ?? ''} ${(productDetailsController.attributes![index].options!.length == i + 1 ? '' : ', ')}',
                                                style:
                                                    kDescriptionText.copyWith(
                                                  color: Get.isDarkMode
                                                      ? kWhiteColor
                                                      : const Color(0xFF303030),
                                                ),
                                              ),
                                          ],
                                        ),
                                        if (!(productDetailsController
                                                .attributes!.length ==
                                            index + 1))
                                          kHeightBox10,
                                        SizedBox(
                                          child: productDetailsController
                                                      .attributes!.length ==
                                                  index + 1
                                              ? const SizedBox()
                                              : const Divider(
                                                  thickness: .3,
                                                  height: .3,
                                                  color: Color(0xFF808080),
                                                ),
                                        ),
                                      ],
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    ],
  );
}

buildProductDetails(
    BuildContext context, ProductList productDetailsController) {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Details'.tr,
              style: kRegularText.copyWith(
                color: Get.isDarkMode ? kWhiteColor : const Color(0xFF303030),
              ),
            ),
            kHeightBox5,
            Divider(
              thickness: .3,
              height: .3,
              color: Get.isDarkMode ? kBlackColor2 : const Color(0xFF808080),
            ),
            kHeightBox10,
            Text(
              productDetailsController.description
                      ?.replaceAll(htmlValidatorRegExp, '') ??
                  '',
              style: kRegularText2.copyWith(
                color: Get.isDarkMode ? kWhiteColor : const Color(0xFF303030),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

buildReviews(
  BuildContext context,
  ProductList productDetailsController,
  ReviewController reviewController,
) {
  return Obx(
    () {
      if (reviewController.isLoading.isTrue) {
        return const Center(
          child: CustomLoader(),
        );
      } else if (reviewController.reviewList.isEmpty) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          children: [
            Container(
              color: Theme.of(context).cardColor,
              // padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (reviewController.reviewList.isNotEmpty) {
                        Get.to(
                          () => ReviewProductsScreen(
                            rating: productDetailsController.averageRating
                                .toString(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reviews'.tr + ' (0)',
                                style: kRegularText.copyWith(
                                  color: Get.isDarkMode
                                      ? kWhiteColor
                                      : const Color(0xFF303030),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Get.isDarkMode
                                    ? kWhiteColor
                                    : const Color(0xFF808080),
                              ),
                            ],
                          ),
                        ),
                        kHeightBox10,
                        const Divider(
                          thickness: .3,
                          height: .3,
                          color: Color(0xFF808080),
                        ),
                      ],
                    ),
                  ),
                  kHeightBox10,
                  Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    child: Text(
                      'Review is empty!',
                      style: kRegularText.copyWith(
                        color: Get.isDarkMode
                            ? kWhiteColor
                            : const Color(0xFF303030),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kHeightBox15,
          ],
        );
      } else {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
          children: [
            Container(
              color: Theme.of(context).cardColor,
              // padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (reviewController.reviewList.isNotEmpty) {
                        Get.to(
                          () => ReviewProductsScreen(
                            rating: productDetailsController.averageRating
                                .toString(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reviews'.tr +
                                    ' (${reviewController.reviewList.length - 1})',
                                style: kRegularText.copyWith(
                                  color: Get.isDarkMode
                                      ? kWhiteColor
                                      : const Color(0xFF303030),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Get.isDarkMode
                                    ? kWhiteColor
                                    : const Color(0xFF808080),
                              ),
                            ],
                          ),
                        ),
                        kHeightBox10,
                        const Divider(
                          thickness: .3,
                          height: .3,
                          color: Color(0xFF808080),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: reviewController.reviewList.length > 4
                        ? 4
                        : reviewController.reviewList.length,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    itemBuilder: (context, int index) {
                      return ReviewWidget(
                        showImage: false,
                        userName: reviewController.reviewList[index].reviewer,
                        userImage: reviewController
                            .reviewList[index].reviewerAvatarUrls?.firstImage,
                        rating: reviewController.reviewList[index].rating,
                        date: reviewController.reviewList[index].dateCreated,
                        reviewDetails: reviewController
                            .reviewList[index].review!
                            .replaceAll(
                          htmlValidatorRegExp,
                          '',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            kHeightBox15,
          ],
        );
      }
    },
  );
}
