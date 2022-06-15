import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Expanded(
      child: ListWheelScrollView(
          itemExtent: 42,
          diameterRatio: 1.5,
          physics: const BouncingScrollPhysics(),
          children: lyrics
              .map((linea) => Text(
                    linea,
                    style: const TextStyle(fontSize: 20),
                  ))
              .toList()),
    );
  }
}
