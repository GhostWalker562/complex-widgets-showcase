import 'package:flutter/material.dart';

class ScalingGestureDetector extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final double end;

  const ScalingGestureDetector(
      {Key key, this.child, this.onTap, this.end = 0.99})
      : super(key: key);
  @override
  _ScalingGestureDetectorState createState() => _ScalingGestureDetectorState();
}

class _ScalingGestureDetectorState extends State<ScalingGestureDetector>
    with TickerProviderStateMixin {
  // Controllers
  AnimationController _anim;
  Animation _scale;

  @override
  void initState() {
    modulate();
    super.initState();
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void modulate() {
    _anim =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _scale = Tween(begin: 1.0, end: widget.end)
        .animate(CurvedAnimation(parent: _anim, curve: Curves.easeOutExpo));
  }

  void playAnimation() {
    // Bounce animation

    _anim.forward();

    _anim.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _anim.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        playAnimation();
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: AnimatedBuilder(
        animation: _anim,
        builder: (context, child) => Transform.scale(
            scale: _scale.value != 1.0 ? _scale.value : _scale.value,
            child: child),
        child: widget.child,
      ),
    );
  }
}
