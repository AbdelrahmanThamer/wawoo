import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/size_config.dart';
import 'package:woogoods/models/message_model.dart';
import 'package:woogoods/models/user_model.dart';

class SupportConversation extends StatelessWidget {
  const SupportConversation({
    Key? key,
    @required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, int index) {
              final message = messages[index];
              bool isMe = message.sender.id == currentUser.id;
              return Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: index == messages.length - 1 ? 0 : 10),
                    child: Row(
                      mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!isMe)
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: getProportionateScreenWidth(40),
                          height: getProportionateScreenWidth(40),
                          decoration: const BoxDecoration(
                            color: kSecondaryColor,
                            shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset(
                            Images.supportImg,
                            width: 15,
                            height: 15,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          message.time,
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Get.isDarkMode ? kStUnderLineColor : kStUnderLineColor2,
                            fontSize: 12.0,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: isMe ? 10 : 5),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                            color: isMe ? kPrimaryColor : Theme.of(context).cardColor,
                            borderRadius: BorderRadius.only(
                              topLeft:  Radius.circular(isMe ? 10 : 0),
                              topRight:  Radius.circular(isMe ? 0 : 10),
                              bottomLeft: const Radius.circular(10),
                              bottomRight: const Radius.circular(10),
                            )),
                        child: Text(
                          messages[index].text,
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: isMe ? kWhiteColor : Get.isDarkMode ? kWhiteColor : kStUnderLineColor2),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
