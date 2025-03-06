import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import '../app_theme.dart';
import '../app_utils.dart';
import '../widegts.dart';
import 'one_controller.dart'; // ignore_for_file: must_be_immutable

class OneScreen extends GetWidget<OneController> {
  const OneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 698.h,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 10.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(left: 10.h),
                              child: Chat(
                                showUserNames: true,
                                disableImageGallery: false,
                                dateHeaderThreshold: 86400000,
                                messages: controller.messageList.value,
                                user: controller.chatUser.value,
                                // dateHeaderBuilder: (context) {
                                //   return CustomDateSeparator(dateInt: controller.messageList.value.first.createdAt!);
                                // },
                                bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
                                  return message.author.id == controller.chatUser.value.id
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.h)),
                                          child: child)
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.h),
                                          ),
                                          child: child,
                                        );
                                },
                                textMessageBuilder: (textMessage, {required messageWidth, required showName}) {
                                  return textMessage.author.id == controller.chatUser.value.id
                                      ? Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8.h,
                                                vertical: 10.h,
                                              ),
                                              decoration: AppDecoration.green.copyWith(
                                                borderRadius: BorderRadiusStyle.customBorderTL181,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    textMessage.text.toString(),
                                                    style: theme.textTheme.titleSmall!.copyWith(
                                                      color: appTheme.green900,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 12.h),
                                                    child: Text(
                                                      "lbl_09_41".tr,
                                                      style: CustomTextStyles.labelLargeGreen900,
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    imagePath: ImageConstant.imgUnread,
                                                    height: 12.h,
                                                    width: 12.h,
                                                    margin: EdgeInsets.only(left: 4.h),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // CustomImageView(
                                            //   imagePath: ImageConstant.imgMobile,
                                            //   height: 20.h,
                                            //   width: 10.h,
                                            //   alignment: Alignment.bottomCenter,
                                            // ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            // CustomImageView(
                                            //   imagePath: ImageConstant.imgMobileBlueGray50,
                                            //   height: 20.h,
                                            //   width: 10.h,
                                            //   alignment: Alignment.bottomCenter,
                                            // ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 14.h,
                                                vertical: 10.h,
                                              ),
                                              decoration: AppDecoration.fillBlueGray.copyWith(
                                                borderRadius: BorderRadiusStyle.customBorderLR18,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Text(
                                                      textMessage.text.toString(),
                                                      style: CustomTextStyles.titleSmallOnPrimary.copyWith(
                                                        color: theme.colorScheme.onPrimary,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 12.h),
                                                  Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Text(
                                                      "lbl_09_41".tr,
                                                      style: CustomTextStyles.labelLargeOnPrimary_1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                },
                                onSendPressed: (types.PartialText text) {},
                                customBottomWidget: Container(
                                  height: 70.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.h,
                                    vertical: 14.h,
                                  ),
                                  decoration: AppDecoration.strokeWhite,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                        height: 42.h,
                                        width: 42.h,
                                        padding: EdgeInsets.all(8.h),
                                        // decoration: IconButtonStyleHelper.none,
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgAttach,
                                        ),
                                      ),
                                      SizedBox(width: 8.h),
                                      Expanded(
                                        child: CustomTextFormField(
                                          controller: controller.inputOneController,
                                          hintText: "lbl19".tr,
                                          textInputAction: TextInputAction.done,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 8.h,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.h),
                                      CustomIconButton(
                                        height: 42.h,
                                        width: 42.h,
                                        padding: EdgeInsets.all(8.h),
                                        // decoration: IconButtonStyleHelper.none,
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgMenu,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                customStatusBuilder: (message, {required context}) {
                                  return Container();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: _buildAppBar(),
    );
  }

  // Section Widget
  Widget _buildMessageDiv() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 282.h,
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            decoration: AppDecoration.green.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL18,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage3,
                  height: 112.h,
                  width: double.maxFinite,
                  radius: BorderRadius.only(
                    topLeft: Radius.circular(18.h),
                    topRight: Radius.circular(18.h),
                    bottomLeft: Radius.circular(8.h),
                    bottomRight: Radius.circular(8.h),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 10.h, right: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "lbl120".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "lbl_21_41".tr,
                          style: CustomTextStyles.labelLargeGreen900,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRead,
                        height: 12.h,
                        width: 14.h,
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(left: 4.h),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          // CustomImageView(
          //   imagePath: ImageConstant.imgMobile,
          //   height: 20.h,
          //   width: 10.h,
          //   alignment: Alignment.bottomCenter,
          // ),
        ],
      ),
    );
  }

  // Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: appTheme.blueGray50,
      // foregroundColor: Colors.white10,
      
      // height: 80.h,
      leadingWidth: 50.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 20.h),
        onTap: () {
          onTapArrowLeftOne();
        },
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 12.h),
        child: Column(
          children: [
            Row(
              children: [
                AppbarTitleButton(),
                Padding(
                  padding: EdgeInsets.only(left: 12.h, bottom: 11.h),
                  child: Column(
                    children: [
                      AppbarTitle(
                        text: "lbl4".tr,
                      ),
                      AppbarSubtitle(
                        text: "lbl16".tr,
                        margin: EdgeInsets.only(right: 70.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // styleType: Style.bgOutLineBlueGray50_1,
    );
  }

  // Navigates to the previous screen.
  onTapArrowLeftOne() {
    Get.back();
  }
}