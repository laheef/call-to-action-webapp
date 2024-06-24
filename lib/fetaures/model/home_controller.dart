import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString channelName = "".obs;
  RxString channelSubscribers = "".obs;
  String defaultchannelName = "Faheem Khan";
  String defaultchannelSubscribers = "4453k";

  TextEditingController channelNameController = TextEditingController();
  TextEditingController channelSubscribeController = TextEditingController();
}
