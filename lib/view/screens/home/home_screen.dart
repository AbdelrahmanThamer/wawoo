import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_version/new_version.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:woogoods/constants/colors_data.dart';
import 'package:woogoods/constants/images.dart';
import 'package:woogoods/constants/size_config.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/util/md2_indicator.dart';
import 'package:woogoods/view/screens/search/search_home_screen.dart';
import '../../../constants/strings.dart';
import '../../../main.dart';
import '../message/support_room_screen.dart';
import 'components/all_screen/all_screen.dart';
import 'components/watch_screens.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  YourPageState createState() => YourPageState();
}

class YourPageState extends State<HomeScreen> {
  final picker = ImagePicker();
  File? thumbnailImage;
  String? thumbnailBase64;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    // Instantiate NewVersion manager object
    final newVersion = NewVersion(
      iOSId: 'com.akaarit.woogoods',
      androidId: 'com.akaarit.woogoods',
    );

    basicStatusCheck(newVersion);
    //advancedStatusCheck(newVersion);
  }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogTitle: 'Update Available',
        dialogText: "A new version of Upgrade is available!. Version ${status.storeVersion}, is now available-your have ${status.localVersion}\nWould you like to update it now",
      );
    }
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId(onesignalAppId);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    /* OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      log("Accepted permission: $accepted");
    });*/
    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // Will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // Will be called whenever the subscription changes
      // (ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
      // Will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(Images.homeLogo),
              ),
              kWidthBox10,
              Expanded(
                flex: 8,
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => const SearchHomeScreen(),
                      
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: getProportionateScreenHeight(38),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Images.search,
                          height: 20,
                        ),
                        kWidthBox15,
                        Text(
                          'Search...'.tr,
                          style: kRegularText2.copyWith(
                            color: kOrdinaryColor,
                          ),
                        ),
                       /*
                        const Spacer(),
                        InkWell(
                          onTap: () => uploadImage(),
                          child: SvgPicture.asset(
                            Images.camera,
                            height: 20,
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
              kWidthBox10,
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (prefs.containsKey(token)) {
                      Get.to(
                            () =>  SupportRoomScreen(name: prefs.getString(userDisplayName) ?? "", email: prefs.getString(userEmail) ?? "",),
                      );
                    } else {
                      showCustomSnackBar(
                          'Please login first'.tr);
                    }
                  },
                  child: SvgPicture.asset(
                    Images.chat,
                    height: 25,
                    color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            isScrollable: true,
            unselectedLabelColor: Get.isDarkMode ? kWhiteColor : kBlackColor2,
            unselectedLabelStyle: Theme.of(context).textTheme.headline2,
            labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Get.isDarkMode ? kWhiteColor : kBlackColor2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
            indicator: const MD2Indicator(
              indicatorSize: MD2IndicatorSize.normal,
              indicatorHeight: 4.0,
              indicatorColor: kPrimaryColor,
            ),
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Watches',
              ),
              Tab(
                text: 'Phone',
              ),
              Tab(
                text: 'Beauty',
              ),
              Tab(
                text: 'Electronic',
              ),
              Tab(
                text: 'Baby',
              ),
              Tab(
                text: 'Grocery',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllScreens(),
            WatchScreens(),
            WatchScreens(),
            WatchScreens(),
            WatchScreens(),
            WatchScreens(),
            WatchScreens(),
          ],
        ),
      ),
    );
  }

  uploadImage() {
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 80,
                height: 5,
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? kWhiteColor
                        : kStUnderLineColor2.withOpacity(.5),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            kHeightBox15,
            textRoboto(
              "Scan Image".tr,
              Get.isDarkMode ? kWhiteColor : kBlackColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
            kHeightBox10,
            const Divider(
              thickness: .3,
              height: .3,
              color: kStUnderLineColor2,
            ),
            kHeightBox20,
            InkWell(
              onTap: () {
                Get.back();
                _getThumbnailImage(
                  type: ImageSource.camera,
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kOrdinaryColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Get.isDarkMode ? kWhiteColor : kBlackColor,
                      ),
                    ),
                  ),
                  kWidthBox20,
                  textRoboto(
                      "From Camera", Get.isDarkMode ? kWhiteColor : kBlackColor,
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ],
              ),
            ),
            kHeightBox20,
            InkWell(
              onTap: () {
                Get.back();
                _getThumbnailImage(
                  type: ImageSource.gallery,
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kOrdinaryColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.perm_media,
                        color: Get.isDarkMode ? kWhiteColor : kBlackColor,
                      ),
                    ),
                  ),
                  kWidthBox20,
                  textRoboto("From Gallery",
                      Get.isDarkMode ? kWhiteColor : kBlackColor,
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ],
              ),
            ),
            kHeightBox20,
          ],
        ),
      ),
    );
  }

  Future<void> _getThumbnailImage({ImageSource? type}) async {
    final pickedFile = await picker.pickImage(source: type!);

    if (pickedFile != null) {
      setState(() {
        thumbnailImage = File(pickedFile.path);
        thumbnailBase64 = base64Encode(thumbnailImage!.readAsBytesSync());
        log(thumbnailImage.toString());
      });
    } else {
      kErrorSnack(
        msg: 'No Image Selected',
      );
    }
  }
}
