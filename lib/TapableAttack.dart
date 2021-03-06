import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class TappableAttack extends PositionComponent with Tappable {
  static final Paint _white = Paint()..color = const Color(0xFFFFFFFF);
  static final Paint _grey = Paint()..color = const Color(0xFFA5A5A5);

  bool _beenPressed = false;

  TappableAttack({Vector2? position})
      : super(
          position: position ?? Vector2.all(100),
          size: Vector2.all(100),
        );

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _beenPressed ? _grey : _white);
  }

  @override
  bool onTapUp(_) {
    _beenPressed = false;
    return true;
  }

  @override
  bool onTapDown(_) {
    _beenPressed = true;
    angle += 1.0;
    return true;
  }

  @override
  bool onTapCancel() {
    _beenPressed = false;
    return true;
  }
}