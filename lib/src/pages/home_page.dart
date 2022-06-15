import 'package:flutter/material.dart';
import 'package:music_player/src/models/audio_controller.dart';
import 'package:music_player/src/widgets/backgound.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:music_player/src/widgets/imag_disk.dart';
import 'package:music_player/src/widgets/lyrics.dart';
import 'package:music_player/src/widgets/title_play.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AudioController(),
      builder: (_, child) => child!,
      child: Scaffold(
          backgroundColor: const Color(0xff201E28),
          body: SafeArea(
            child: Stack(
              children: [
                const Backgraund(),
                Column(
                  children: const [
                    CustomAppBar(),
                    ImagDisk(),
                    TitlePlay(),
                    SizedBox(height: 22),
                    Lyrics()
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
