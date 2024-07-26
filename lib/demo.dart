import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class Demo extends FlameGame {
  late AudioPool pool;
  final String audioPath = 's.mp3';

  @override
  FutureOr<void> onLoad() async {
    pool = await AudioPool.createFromAsset(
      path: audioPath,
      maxPlayers: 2,
    );

    final btn = ButtonComponent(
      onPressed: () async {
        StopFunction stop = await pool.start(volume: 1.0);
        // You can store the stop function and call it when you need to stop the audio
        // For example, to stop the audio after 5 seconds:
        Future.delayed(Duration(seconds: 5), () => stop());
      },
    );

    // world.add(btn);

    return super.onLoad();
  }
}

class ButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;

  ButtonComponent({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Play Audio'),
    );
  }
}

void main() {
  runApp(
    GameWidget(
      game: Demo(),
    ),
  );
}
