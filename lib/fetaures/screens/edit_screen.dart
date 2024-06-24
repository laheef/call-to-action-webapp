import 'package:callout/fetaures/model/home_controller.dart';
import 'package:callout/fetaures/screens/widgets/yt_subscribe_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'dart:html' as html;

class EditScreen extends StatelessWidget {
  EditScreen({super.key});

  final HomeController _homeController = Get.find<HomeController>();
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit YouTube Subscribe Button')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YoutbeSubcribeButton area
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.black38.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Screenshot(
                        controller: screenshotController,
                        child: Obx(
                          () => YoutbeSubcribeButton(
                            channelName:
                                _homeController.channelName.value.isEmpty
                                    ? _homeController.defaultchannelName
                                    : _homeController.channelName.value,
                            channelSubscribe:
                                _homeController.channelSubscribers.value.isEmpty
                                    ? _homeController.defaultchannelSubscribers
                                    : _homeController.channelSubscribers.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _captureAndSavePng,
                    child: const Text('Download Subscribe Button'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            // Edit section
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  TextField(
                    controller: _homeController.channelNameController,
                    onChanged: (value) {
                      _homeController.channelName.value = value.isEmpty
                          ? _homeController.defaultchannelName
                          : value;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Channel Name'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _homeController.channelSubscribeController,
                    onChanged: (value) {
                      _homeController.channelSubscribers.value = value.isEmpty
                          ? _homeController.defaultchannelSubscribers
                          : value;
                    },
                    decoration: const InputDecoration(labelText: 'Subscribers'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _captureAndSavePng() async {
    final Uint8List? imageBytes = await screenshotController.capture();
    if (imageBytes != null) {
      final blob = html.Blob([imageBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'youtube_subscribe_button.png';
      html.document.body!.children.add(anchor);
      anchor.click();
      html.document.body!.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    }
  }
}
