import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woogoods/controllers/filter_controller.dart';
import 'package:woogoods/view/widgets/custom_loader.dart';
import 'package:woogoods/view/widgets/filter_drawer.dart';
import 'package:woogoods/view/widgets/product_grid_list.dart';
import 'package:woogoods/view/widgets/product_listview.dart';

class AllProductsStore extends StatelessWidget {
  static const routeName = 'all_products';
  final FilterController filterController = Get.find();
  final GlobalKey<ScaffoldState> filterKey = GlobalKey();
  final _scrollController = ScrollController();

  AllProductsStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: filterKey,
      endDrawer: FilterDrawer(
        onPress: () {}, onReset: (){},
      ),
      appBar: AppBar(
        toolbarHeight: 0.0,
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(
        //     getProportionateScreenWidth(35),
        //   ),
        //   child: Obx(
        //     () {
        //       if (filterController.isLoading.isTrue) {
        //         return const Center(
        //           child: CustomLoader(),
        //         );
        //       } else {
        //         return Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //           child: Row(
        //             children: [
        //               Text(
        //                 'Best Match',
        //                 style: kDescriptionText.copyWith(
        //                   color: Get.isDarkMode
        //                       ? kWhiteColor
        //                       : const Color(0xFF707070),
        //                 ),
        //               ),
        //               const Spacer(),
        //               Text(
        //                 'Filter',
        //                 style: kDescriptionText.copyWith(
        //                   color: Get.isDarkMode
        //                       ? kWhiteColor
        //                       : const Color(0xFF707070),
        //                 ),
        //               ),
        //               kWidthBox10,
        //               InkWell(
        //                 onTap: () {
        //                   log('print');
        //                   filterKey.currentState!.openEndDrawer();
        //                 },
        //                 child: SvgPicture.asset(
        //                   Images.filter,
        //                   color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
        //                   height: 16,
        //                 ),
        //               ),
        //               kWidthBox10,
        //               InkWell(
        //                 onTap: () {
        //                   filterController.changeGrid();
        //                 },
        //                 child: filterController.isGrid == true
        //                     ? SvgPicture.asset(
        //                         Images.grid,
        //                         color:
        //                             Get.isDarkMode ? kWhiteColor : kBlackColor2,
        //                         height: 16,
        //                       )
        //                     : SvgPicture.asset(
        //                         Images.list,
        //                         color:
        //                             Get.isDarkMode ? kWhiteColor : kBlackColor2,
        //                         height: 16,
        //                       ),
        //               )
        //             ],
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ),
      ),
      body: Obx(
        () {
          if (filterController.isLoading.isTrue) {
            return const Center(
              child: CustomLoader(),
            );
          } else {
            return filterController.isGrid == true
                ? ProductGridList(
                    controller: _scrollController,
                    noPadding: false,
                  )
                : ProductListView(
                    controller: _scrollController,
                    noPadding: false,
                    productLength: 20,
                  );
          }
        },
      ),
    );
  }
}
