import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

Future<void> soundSuccess(AudioPlayer audioPlayer) async {
  // Ovoz ijrosi
  await audioPlayer.play(AssetSource('audio/success.mp3'));
}
Future<void> soundError(AudioPlayer audioPlayer) async {
  // Ovoz ijrosi
  await audioPlayer.play(AssetSource('audio/error.mp3'));

  // Vibratsiya
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(duration: 500); // 500 ms davomida vibratsiya
  }
}