import 'package:dino_run/Player.dart';
import 'package:dino_run/TapableAttack.dart';
import 'package:dino_run/enemy_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';

class MyGame extends FlameGame with TapDetector, HasCollidables {
  late final SpriteComponent player;
  late final ParallaxComponent background;
  late final ParallaxComponent background2;
  late final Player _player;
  late final EnemyManager _enemyManager;

  @override
  Future<void> onLoad() async {
    _player = Player();
    background2 = await loadParallaxComponent([
      ParallaxImageData("plx-6.png"),
    ],
        baseVelocity: Vector2(9, 0),
        velocityMultiplierDelta: Vector2(10, 1.0),
        fill: LayerFill.none);
    background = await loadParallaxComponent(
      [
        ParallaxImageData("plx-1.png"),
        ParallaxImageData("plx-2.png"),
        ParallaxImageData("plx-2.png"),
        ParallaxImageData("plx-4.png"),
        ParallaxImageData("plx-5.png"),
      ],
      baseVelocity: Vector2(9, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
    _enemyManager = EnemyManager();
    // background.b
    add(background); // Adds the component
    add(background2); // Adds the component
    add(_player); // Adds the component
    add(_enemyManager);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    super.onTapDown(info);
    _player.jump();
  }
}
