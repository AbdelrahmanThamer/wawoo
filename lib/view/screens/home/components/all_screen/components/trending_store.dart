import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/strings.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/view/screens/home/components/all_screen/widgets/more_widgets.dart';
import 'package:woogoods/view/screens/store/store_list_screen.dart';
import 'package:woogoods/view/screens/store/store_profile_home_screen.dart';

class TrendingStore extends StatelessWidget {
  const TrendingStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          kOrdinaryShadow,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Store'.tr,
                style: kRegularText2.copyWith(
                  color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              MoreWidgets(
                onTap: () => Get.to(
                  () => const StoreListScreen(
                    isTrending: true,
                  ),
                ),
              ),
            ],
          ),
          kHeightBox10,
          MasonryGridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            itemCount: 8,
            physics: const ScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => Get.to(() => StoreProfileHomeScreen()),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.2,
                      child: isImageShow
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://1000logos.net/wp-content/uploads/2021/10/logo-Meta.png',
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    color: kOrdinaryColor2,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image.asset(Images.placeHolder),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: kOrdinaryColor2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                Images.placeHolder,
                              ),
                            ),
                    ),
                    kHeightBox5,
                    Text(
                      'Store Name',
                      style: kDescriptionText.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
