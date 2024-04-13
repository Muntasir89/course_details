import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MediaPlayerController extends GetxController {
  late VideoPlayerController controller;

  @override
  void onInit() {
    super.onInit();
    // Replace with your video source
    // ignore: deprecated_member_use
    controller = VideoPlayerController.network(
      'https://flutter.dev/assets/videos/bee_hive.mp4',
    );
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    await controller.initialize();
    update(); // Inform GetX about changes in the controller
  }

  void playPause() {
    _isPlaying.value = !_isPlaying.value;
    if (_isPlaying.value) {
      controller.play();
    } else {
      controller.pause();
    }
    update(); // Update UI after play/pause change
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  // Add a boolean RxBool to track playback state
  final RxBool _isPlaying = false.obs;
  bool get isPlaying => _isPlaying.value;
}
