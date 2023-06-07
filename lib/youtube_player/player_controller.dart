import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class PlayerController extends GetxController {
  static String url1 = "https://www.youtube.com/watch?v=PXTWHpeAEdI";
  static String url2 = "https://www.youtube.com/watch?v=1rgGwx7Qtjc";

  // PodPlayerController playerController = PodPlayerController(
  //   playVideoFrom: PlayVideoFrom.youtube(url1),
  //   podPlayerConfig: const PodPlayerConfig(
  //     autoPlay: true,
  //   ),
  // )..initialise();
  late PodPlayerController playerController;

  void onChangeVideo(String url) {
    playerController.changeVideo(playVideoFrom: PlayVideoFrom.youtube(url));
  }
}
