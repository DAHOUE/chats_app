


import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:get/get.dart';


class OneModel {}
class OneController extends GetxController {
  TextEditingController inputOneController = TextEditingController();
  Rx<OneModel> oneModelObj = OneModel().obs;
  Rx<types.User> chatUser = Rx(const types.User(id: 'RECEIVER_USER'));
  Rx<List<types.Message>> messageList = Rx([
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111122',
      author: types.User(id: 'RECEIVER_USER'),
      text: "Okay. See you",
      status: types.Status.delivered,
      createdAt: 2740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111121',
      author: types.User(id: 'RECEIVER_USER'),
      text: "I'm fine too.",
      status: types.Status.delivered,
      createdAt: 2740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111120',
      author: types.User(id: 'RECEIVER_USER'),
      text: "Okay. See you",
      status: types.Status.delivered,
      createdAt: 2740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111119',
      author: types.User(id: 'RECEIVER_USER'),
      text: "I'm fine too.",
      status: types.Status.delivered,
      createdAt: 2740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111120',
      author: types.User(id: 'RECEIVER_USER'),
      text: "Okay. See you",
      status: types.Status.delivered,
      createdAt: 2740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111119',
      author: types.User(id: 'RECEIVER_USER'),
      text: "I'm fine too.",
      status: types.Status.delivered,
      createdAt: 2740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111118',
      author: types.User(id: 'SENDER_USER'),
      text: "Great. You can come.",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111117',
      author: types.User(id: 'SENDER_USER'),
      text: "Yes.",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111116',
      author: types.User(id: 'SENDER_USER'),
      text: "I'm fine and you?",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111115',
      author: types.User(id: 'SENDER_USER'),
      text: "Hey Brother",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111114',
      author: types.User(id: 'RECEIVER_USER'),
      text: "I want to visit you.",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111113',
      author: types.User(id: 'RECEIVER_USER'),
      text: "Are you at home?",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111112',
      author: types.User(id: 'RECEIVER_USER'),
      text: "How are you?",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
    const types.TextMessage(
      type: types.MessageType.text,
      id: '11111111',
      author: types.User(id: 'RECEIVER_USER'),
      text: "Hello Momimjon",
      status: types.Status.delivered,
      createdAt: 1740564575059,
    ),
  ]);

  @override
  void onClose() {
    super.onClose();
    inputOneController.dispose();
  }
}

// A binding class for the OneScreen.
// This class ensures that the OneController is created when the
// OneScreen is first loaded.
class OneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneController());
  }
}