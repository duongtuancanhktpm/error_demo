import 'package:error_demo/youtube_player/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
// import 'package:pod_player/pod_player.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final controller = Get.put(PlayerController());

  @override
  void initState() {
    controller.playerController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(PlayerController.url1),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("test")),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        PodVideoPlayer(controller: controller.playerController),
        _watchMeeItem(PlayerController.url1),
        _watchMeeItem(PlayerController.url2),
      ],
    );
  }

  Widget _watchMeeItem(String videoUrl) {
    return InkWell(
      onTap: () {
        controller.onChangeVideo(videoUrl);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 16),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(videoUrl),
          ],
        ),
      ),
    );
  }
}
