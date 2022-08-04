import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/view/screens/search/search_screen.dart';

class CategoryList extends StatelessWidget {
  static const routeName = 'category_list';
  const CategoryList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 50,
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () => Get.to(
            () => const SearchScreen(),
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeightBox10,
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'car charger',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  Text(
                    '(200 products)',
                    style: kDescriptionText,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.0,
                      color: Get.isDarkMode
                          ? kStUnderLineColor
                          : kStUnderLineColor2,
                    ),
                  ),
                ],
              ),
              kHeightBox10,
              Container(
                alignment: Alignment.center,
                color: kStUnderLineColor,
                height: .3,
              ),
            ],
          ),
        );
      },
    );
  }
}
