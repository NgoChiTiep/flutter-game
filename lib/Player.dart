import 'package:flame/components.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

const double playerTopBottomSpacing = 10;
const double groundHeight = 20;
const int numberOfTitlesAlongWidth = 10;
const double GRAVITY = 1000;

class Player extends SpriteAnimationComponent {
  double speedY = 0.0;
  double yMax = 0.0;
  late final SpriteAnimation runAnimation;
  late final SpriteAnimation jumpAnimation;

  Player()
      : super(
          position: Vector2(80, 240),
          size: Vector2.all(150),
        );

  @override
  Future<void>? onLoad() async {
    final sprites =
        [0, 1, 2, 3, 4, 5, 6].map((i) => Sprite.load("run${i + 1}.png"));
    runAnimation = SpriteAnimation.spriteList(
      await Future.wait(sprites),
      stepTime: 0.1,
    );

    final jumpSprites = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        .map((i) => Sprite.load("jump${i + 1}.png"));
    jumpAnimation = SpriteAnimation.spriteList(await Future.wait(jumpSprites),
        stepTime: 0.18);
    animation = runAnimation;
    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();

    _reset();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    double sizeWidth = gameSize.toSize().width;
    double sizeHeight = gameSize.toSize().height;

    // // TODO: implement onGameResize
    super.onGameResize(gameSize);
    // height = width = sizeWidth / numberOfTitlesAlongWidth;
    // x = width;

    y = sizeHeight - groundHeight - height + playerTopBottomSpacing;
    yMax = y;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    speedY += GRAVITY * dt;

    // distance = speed * time
    y += speedY * dt;

    if (isOnGround()) {
      y = yMax;
      speedY = 0.0;
      animation = runAnimation;
    } else {
      animation = jumpAnimation;
    }
  }

  bool isOnGround() {
    return (y >= yMax);
  }

  void jump() async {
    if (isOnGround()) {
      speedY = -600;

      // animation
    }
  }

  void _reset() {
    shouldRemove = false;
    position = Vector2(80, 240);
    speedY = 0.0;
  }
}
