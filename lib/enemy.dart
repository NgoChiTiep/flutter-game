import 'package:dino_run/flamegame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

import '/models/enemy_data.dart';

// This represents an enemy in the game world.
class Enemy extends SpriteAnimationComponent
    with HasHitboxes, Collidable, HasGameRef<MyGame> {
  // The data required for creation of this enemy.
  final EnemyData enemyData;
  Enemy(this.enemyData) {
    animation = SpriteAnimation.fromFrameData(
      enemyData.image,
      SpriteAnimationData.sequenced(
        amount: enemyData.nFrames,
        stepTime: enemyData.stepTime,
        textureSize: enemyData.textureSize,
      ),
    );
  }

  @override
  void onMount() {
    // Add a hitbox for this enemy.
    final shape = HitboxRectangle(relation: Vector2.all(0.8));
    addHitbox(shape);
    // Reduce the size of enemy as they look too
    // big compared to the dino.
    size *= 1.5;
    super.onMount();
  }

  @override
  void update(double dt) {
    position.x -= enemyData.speedX * dt;

    // Remove the enemy and increase player score
    // by 1, if enemy has gone past left end of the screen.
    if (position.x < -enemyData.textureSize.x) {
      removeFromParent();
      // gameRef.player.currentScore += 1;
    }

    super.update(dt);
  }
}
