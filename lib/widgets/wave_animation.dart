import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class WaveWidget extends StatefulWidget {
  const WaveWidget({Key? key}) : super(key: key);

  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7000),
    );
    _animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double waveHeight = MediaQuery.of(context).size.height / 4;

    return SizedBox(
      height: waveHeight,
      child: Stack(
        children: [
          _oneBottle(0.2, '성실'),
          _oneBottle(-0.7, '성장'),
          _oneBottle(0.8, '열정'),
          Positioned.fill(
            child: ClipPath(
              clipper: WaveClipper(_animation.value),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _oneBottle(double align, String keyword) {
    align = (align + 1) / 2;
    var leftPosition = MediaQuery.of(context).size.width * align -
        WaveClipper.bottleHeight / 2;
    var leftCenterPosition = align * (MediaQuery.of(context).size.width);
    var degree =
        cos(_animation.value + leftCenterPosition * WaveClipper.waveDouble) *
            45 *
            0.3;
    return Positioned(
      left: leftPosition,
      top: WaveClipper.getYWithX(leftCenterPosition.toInt(), _animation.value,
          topMargin: 0),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(degree / 360),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/water-bottle.png',
              width: WaveClipper.bottleHeight,
              height: WaveClipper.bottleHeight,
            ),
            Text(
              keyword,
              style: TextStyle(
                  color: Colors.blue.shade900, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  WaveClipper(this.animationValue);
  final double animationValue;

  @override
  Path getClip(Size size) {
    var p = Path();
    var points = <Offset>[];
    for (var i = 0; i < size.width; i++) {
      points.add(
        Offset(
          i.toDouble(),
          WaveClipper.getYWithX(i, animationValue),
        ),
      );
    }
    p.moveTo(0, WaveClipper.getYWithX(0, animationValue));
    p.addPolygon(points, false);
    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);

    return p;
  }

  static const double waveHeight = 40;
  static const double bottleHeight = 80;
  static const double waveDouble = 0.01;
  static double getYWithX(int x, double animationValue,
      {double topMargin = bottleHeight / 1.5}) {
    var y = ((sin(animationValue + x * waveDouble) + 1) / 2) * waveHeight +
        topMargin;
    return y;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
