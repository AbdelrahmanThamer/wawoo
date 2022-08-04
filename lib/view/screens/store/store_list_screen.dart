import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/style_data.dart';

import 'store_profile_home_screen.dart';
import 'widgets/store_card_list.dart';

class StoreListScreen extends StatelessWidget {
  static const routeName = 'store_list_screen';

  final bool isTrending;
  const StoreListScreen({Key? key, this.isTrending = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isTrending ? 'Trending Store'.tr : 'Followed Stores'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeightBox10,
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, int index) {
                return StoreCardList(
                  index: index,
                  onPress: () {
                    Get.to(
                      () => StoreProfileHomeScreen(),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
