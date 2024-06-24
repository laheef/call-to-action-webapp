import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YoutbeSubcribeButton extends StatelessWidget {
  String channelName;
  String channelSubscribe;
  YoutbeSubcribeButton(
      {super.key, required this.channelName, required this.channelSubscribe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                height: 45,
                width: 45,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/profile-pic.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channelName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  channelSubscribe,
                  style: const TextStyle(color: Colors.black45),
                ),
              ],
            ),
            const Text(
              'SUBSCRIBE',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Icon(Icons.notifications_on_rounded)
          ],
        ),
      ),
    );
  }
}
