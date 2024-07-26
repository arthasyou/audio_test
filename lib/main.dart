import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'demo.dart';

void main() {
  final game = Demo();
  runApp(GameWidget(game: game));
}
