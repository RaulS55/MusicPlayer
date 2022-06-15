import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/audio_controller.dart';
import 'package:provider/provider.dart';

class TitlePlay extends StatelessWidget {
  const TitlePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Far Away",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9), fontSize: 35),
              ),
              const Text(
                "-Breaking Benjamin-",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              )
            ],
          ),
          const _PlayButtom(),
        ],
      ),
    );
  }
}

class _PlayButtom extends StatefulWidget {
  const _PlayButtom({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayButtom> createState() => _PlayButtomState();
}

class _PlayButtomState extends State<_PlayButtom>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController playController;
  bool firsTime = true;

  final assetAudio = AssetsAudioPlayer();

  @override
  void initState() {
    playController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    open();
    super.initState();
  }

  @override
  void dispose() {
    playController.dispose();
    super.dispose();
  }

  void open() {
    final audioController =
        Provider.of<AudioController>(context, listen: false);
    assetAudio.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'),
        autoStart: false, showNotification: true);

    //Para el tiempo actual de la cancion
    assetAudio.currentPosition.listen((currentDuration) {
      audioController.current = currentDuration;
    });
    //Para la duracion total de la cancion
    assetAudio.current.listen((playinAudio) {
      audioController.duration =
          playinAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.select<AudioController, AnimationController>(
        (c) => c.animationController);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(100),
      color: const Color.fromARGB(255, 231, 198, 114),
      child: AnimatedIcon(
          color: Colors.black,
          icon: AnimatedIcons.play_pause,
          progress: playController),
      onPressed: () {
        if (isPlaying) {
          playController.reverse();
          isPlaying = false;
          controller.stop();
        } else {
          playController.forward();
          isPlaying = true;
          controller.repeat();
        }
        assetAudio.playOrPause();
      },
    );
  }
}
