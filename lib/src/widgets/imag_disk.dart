import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/audio_controller.dart';
import 'package:provider/provider.dart';

class ImagDisk extends StatelessWidget {
  const ImagDisk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          Disk(),
          SizedBox(width: 50),
          ProgrestBar(),
        ],
      ),
    );
  }
}

class ProgrestBar extends StatelessWidget {
  const ProgrestBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AudioController>(context);
    return Column(
      children: [
        Text(controller.songTotalDuration,
            style: const TextStyle(color: Colors.grey)),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 5,
              height: 200,
              color: const Color(0xff484750),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 5,
                height: 200 * controller.porcentaje,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(controller.currentDuration,
            style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class Disk extends StatelessWidget {
  const Disk({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff484750), Color(0xff1E1C24)])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
                controller: (controller) {
                  Provider.of<AudioController>(context).animationController =
                      controller;
                },
                animate: false,
                infinite: true,
                duration: const Duration(seconds: 10),
                child: Image.asset("assets/aurora.jpg", fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff484750)),
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
