import 'package:chap_app/app_utils.dart';
import 'package:chap_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_theme.dart';
import '../widegts.dart';
import 'k0_controller.dart'; // ignore_for_file: must_be_immutable

class K0Screen extends GetWidget<K0Controller> {
  const K0Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [_buildHeader(), _buildChatList()],
        ),
      ),
    );
  }

  // Section Widget
  Widget _buildHeader() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: AppDecoration.stroke,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl".tr,
            style: theme.textTheme.headlineLarge,
          ),
          SizedBox(height: 2.h),
          CustomSearchView(
            controller: controller.searchController,
            hintText: "lbl21".tr,
            contentPadding: EdgeInsets.fromLTRB(8.h, 8.h, 12.h, 8.h),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  // Section Widget
  Widget _buildChatList() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Obx(
          () => ListView.builder(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.k0ModelObj.value.charListItemList.value.length,
            itemBuilder: (context, index) {
              CharListItemModel model =
                  controller.k0ModelObj.value.charListItemList.value[index];
              return ChatlistItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class ChatlistItemWidget extends StatelessWidget {
  ChatlistItemWidget(this.chatlistItemModelObj, {Key? key}) : super(key: key);

  CharListItemModel chatlistItemModelObj;
  var controller = Get.find<K0Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: AppDecoration.outlineBlueGray,
      child: InkWell(
        onTap: (){
          Get.toNamed(AppRoutes.oneScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.h,
              width: 50.h,
              decoration: AppDecoration.gradientGreenAToPrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      chatlistItemModelObj.tf!.value,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      chatlistItemModelObj.tf1!.value,
                      style: CustomTextStyles.titleSmallBlack900,
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            chatlistItemModelObj.tf2!.value,
                            style: CustomTextStyles.labelLargeOnPrimary,
                          ),
                        ),
                        Container(
                          width: 70.h,
                          margin: EdgeInsets.only(left: 4.h),
                          child: Obx(
                            () => Text(
                              chatlistItemModelObj.tf3!.value,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.h),
            Align(
              alignment: Alignment.topCenter,
              child: Obx(
                () => Text(
                  chatlistItemModelObj.tf4!.value,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}