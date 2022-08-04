import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/size_config.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/view/screens/account/components/widgets/profile_button2.dart';

import 'message_room_screen.dart';
import 'support_room_screen.dart';
import 'wigets/messge_center_card.dart';

class MessageCenterScreen extends StatelessWidget {
  static const routeName = 'message_center_screen';

  const MessageCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Center'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              ProfileButton2(
                bgColor: Theme.of(context).cardColor,
                icon: Icons.support,
                height: getProportionateScreenHeight(60.0),
                radius: 5.0,
                title: 'Contact Support Team'.tr,
                elevation: 1.0,
                isSwitchActive: false,
                onTap: () => Get.to(
                  () => const SupportRoomScreen(name: '', email: '',),
                  
                ),
              ),
              kHeightBox10,
              SizedBox(
                width: SizeConfig.screenWidth,
                child: Card(
                  color: Theme.of(context).cardColor,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 1.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeightBox10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Chats With Sellers'.tr,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return MessageCenterCard(
                            index: index,
                            indexLength: 5,
                            onPress: () {
                              Get.to(
                                () => const MessageRoomScreen(),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
