import 'package:flutter/material.dart';
import 'package:get/get.dart';


// This class is used in the [charlist_item_widget] screen.
// ignore_for_file: must_be_immutable
class CharListItemModel {
  CharListItemModel({
    this.tf,
    this.tf1,
    this.tf2,
    this.tf3,
    this.tf4,
    this.id,
  }) {
    tf = tf ?? Rx("lbl3".tr);
    tf1 = tf1 ?? Rx("lbl4".tr);
    tf2 = tf2 ?? Rx("lbl5".tr);
    tf3 = tf3 ?? Rx("lbl6".tr);
    tf4 = tf4 ?? Rx("lbl7".tr);
    id = id ?? Rx("");
  }

  Rx<String>? tf;
  Rx<String>? tf1;
  Rx<String>? tf2;
  Rx<String>? tf3;
  Rx<String>? tf4;
  Rx<String>? id;
}

// This class defines the variables used in the [k0_screen],
// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class K0Model {
  Rx<List<CharListItemModel>> charListItemList = Rx([
    CharListItemModel(
      tf: "lbl3".tr.obs,
      tf1: "lbl4".tr.obs,
      tf2: "lbl5".tr.obs,
      tf3: "lbl6".tr.obs,
      tf4: "lbl7".tr.obs,
    ),
    CharListItemModel(
      tf: "lbl8".tr.obs,
      tf1: "lbl9".tr.obs,
      tf4: "lbl_12_01_22".tr.obs,
    ),
    CharListItemModel(
      tf: "lbl11".tr.obs,
      tf1: "lbl12".tr.obs,
      tf2: "lbl5".tr.obs,
      tf3: "lbl13".tr.obs,
      tf4: "lbl_22".tr.obs,
    ),
    CharListItemModel(
      tf: "lbl14".tr.obs,
      tf1: "lbl15".tr.obs,
      tf2: "lbl5".tr.obs,
      tf3: "lbl13".tr.obs,
      tf4: "lbl_09_23".tr.obs,
    ),
  ]);
}

// A controller class for the K0Screen.
// This class manages the state of the K0Screen, including the
// current K0ModelObj
class K0Controller extends GetxController {
  TextEditingController searchController = TextEditingController();
  Rx<K0Model> k0ModelObj = K0Model().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

// A binding class for the K0Screen.
// This class ensures that the K0Controller is created when the
// K0Screen is first loaded.
class K0Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => K0Controller());
  }
}