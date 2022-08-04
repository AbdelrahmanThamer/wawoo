import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/size_config.dart';

class ChatComposer extends StatelessWidget {
  static const routeName = 'test_state_less_widget';
  const ChatComposer({Key? key, this.isSupport = false}) : super(key: key);
  final bool isSupport;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Get.isDarkMode ? kBlackColor2 : kWhiteColor,
      height: getProportionateScreenHeight(84),
      child: Row(
        children: [
          Icon(
            Icons.attach_file_outlined,
            color: Get.isDarkMode ? kStUnderLineColor : kStUnderLineColor2,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: getProportionateScreenHeight(80),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(fontSize: 15),
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a message'.tr,
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Icon(
            Icons.send,
            color: Get.isDarkMode
                ? kBgColor
                : isSupport
                    ? kPrimaryColor
                    : const Color(0xFF0065FF),
          )
        ],
      ),
    );
  }
}
