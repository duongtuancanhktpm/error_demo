import 'package:error_demo/youtube_player/player_screen.dart';
import 'package:get/get.dart';

class RouteNames {
  RouteNames._();

  static const String player = "/player";
}

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouteNames.player,
        page: () => const PlayerScreen(),
      ),
    ];
  }
}