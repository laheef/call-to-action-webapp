import 'package:callout/fetaures/model/home_controller.dart';
import 'package:callout/fetaures/screens/edit_screen.dart';
import 'package:callout/fetaures/screens/widgets/yt_subscribe_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // subscribe button over here
              YoutbeSubcribeButton(
                channelName: homeController.channelName.value,
                channelSubscribe: homeController.channelSubscribers.value,
              ),
              const SizedBox(height: 10),

              // the edit button over here
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Edit'),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => EditScreen());
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
