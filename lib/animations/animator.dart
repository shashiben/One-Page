import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:collection/collection.dart';

class MultiTween<P> extends Animatable<MultiTweenValues<P>> {
  final _tracks = <P, _TweenTrack>{};

  Duration get duration =>
      _tracks.values
          .map((track) => track.duration)
          .sorted((a, b) => a.compareTo(b))
          .lastOrNull ??
      Duration.zero;
  void add(P property, Animatable tween,
      [Duration duration = const Duration(seconds: 1),
      Curve curve = Curves.linear]) {
    if (!_tracks.containsKey(property)) {
      _tracks[property] = _TweenTrack();
    }

    _tracks[property]!.add(tween.chain(CurveTween(curve: curve)), duration);
  }

  @override
  MultiTweenValues<P> transform(double t) =>
      MultiTweenValues<P>(duration, _tracks, t);
}

class MultiTweenValues<P> {
  final Duration _maxDuration;
  final Map<P, _TweenTrack> _tracks;
  final double time;

  MultiTweenValues(this._maxDuration, this._tracks, this.time);

  T get<T>(P property) {
    assert(_tracks.containsKey(property),
        "Property '${property.toString()}' does not exists.");

    return _computeValue(property)!;
  }

  T getOrElse<T>(P property, T defaultValue) {
    T? value =
        _tracks.containsKey(property) ? _computeValue(property) : defaultValue;

    if (value == null) {
      return defaultValue;
    }

    return value;
  }

  T? _computeValue<T>(P property) {
    var timeWhenTweenStarts = 0.0;
    final track = _tracks[property];

    if (track == null) {
      return null;
    }

    for (var tweenWithDuration in track.tweensWithDuration) {
      final tweenDurationInTimeDecimals =
          tweenWithDuration.duration.inMicroseconds.toDouble() /
              _maxDuration.inMicroseconds.toDouble();

      if (time < timeWhenTweenStarts + tweenDurationInTimeDecimals) {
        final normalizedTime =
            (time - timeWhenTweenStarts) / tweenDurationInTimeDecimals;
        return tweenWithDuration.tween.transform(normalizedTime) as T;
      }
      timeWhenTweenStarts += tweenDurationInTimeDecimals;
    }
    return track.tweensWithDuration.last.tween.transform(1.0) as T;
  }
}

class _TweenTrack {
  final tweensWithDuration = <_TweenWithDuration>[];

  void add(Animatable tween, Duration duration) {
    tweensWithDuration.add(_TweenWithDuration(tween, duration));
  }

  Duration get duration {
    if (tweensWithDuration.isEmpty) {
      return Duration.zero;
    }

    return tweensWithDuration
        .map((tweenWithDuration) => tweenWithDuration.duration)
        .reduce((value, duration) => value + duration);
  }
}

class _TweenWithDuration {
  final Animatable tween;
  final Duration duration;

  _TweenWithDuration(this.tween, this.duration);
}

enum AnimationType { opacity, translateX, translateY }

class Animator extends StatelessWidget {
  final double delay;
  final Widget child;
  final double xDistance;
  final double yDistance;
  final Duration xDuration, yDuration, fadeDuration;
  const Animator(
      {Key? key,
      required this.delay,
      required this.child,
      this.xDuration = const Duration(milliseconds: 454),
      this.yDuration = const Duration(milliseconds: 454),
      this.fadeDuration = const Duration(milliseconds: 454),
      this.xDistance = 30,
      this.yDistance = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(
        AnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        fadeDuration,
      )
      ..add(
        AnimationType.translateX,
        Tween(begin: xDistance, end: 1.0),
        xDuration,
      )
      ..add(
        AnimationType.translateY,
        Tween(begin: yDistance, end: 1.0),
        yDuration,
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Transform.scale(
        scale: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX),
                value.get(AnimationType.translateY)),
            child: child),
      ),
    );
  }
}
