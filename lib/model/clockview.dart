import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clockview extends StatefulWidget {
  const Clockview({Key? key, this.size}) : super(key: key);
  final size;

  @override
  State<Clockview> createState() => _ClockviewState();
}

class _ClockviewState extends State<Clockview> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Transform.rotate(
          angle: -pi / 2, child: CustomPaint(painter: Clockpainter())),
    );
  }
}

class Clockpainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillbrush = Paint()..color = const Color(0XFF444974);

    var outLinebrush = Paint()
      ..color = const Color(0XFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    var centerfillbrush = Paint()..color = const Color(0XFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0XFF748EF6), Color(0XFF77DDFF)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0XFFEA74AB), Color(0XFFC279FB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    canvas.drawCircle(center, radius * 0.75, fillbrush);
    canvas.drawCircle(center, radius * 0.75, outLinebrush);

//60 sec = 360 degree ,  1 sec = 6 degree

//12 hour = 360 degree ,  1 hour = 30 degree , 1 min = 0.5 degree

    var hourHandX = centerX +
        radius *
            0.4 *
            cos((DateTime.now().hour * 30 + DateTime.now().minute * 0.5) *
                pi /
                180);
    var hourHandY = centerX +
        radius *
            0.4 *
            sin((DateTime.now().hour * 30 + DateTime.now().minute * 0.5) *
                pi /
                180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX =
        centerX + radius * 0.6 * cos(DateTime.now().minute * 6 * pi / 180);
    var minHandY =
        centerX + radius * 0.6 * sin(DateTime.now().minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX =
        centerX + radius * 0.6 * cos(DateTime.now().second * 6 * pi / 180);
    var secHandY =
        centerX + radius * 0.6 * sin(DateTime.now().second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, radius * 0.12, centerfillbrush);

    var dashBrush = Paint()
      ..color = Colors.white
      ..strokeWidth = radius * 0.02;
    var outercircleRadius = radius;
    var innercircleRadius = radius - radius * 0.1;
    for (double i = 0; i <= 360; i += 12) {
      var x1 = centerX + outercircleRadius * cos(i * pi / 180);
      var y1 = centerX + outercircleRadius * sin(i * pi / 180);

      var x2 = centerX + innercircleRadius * cos(i * pi / 180);
      var y2 = centerX + innercircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
