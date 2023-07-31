import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alarmdateTime;
  String description;
  late bool isActive;
  List<Color> gradiantColor;
  AlarmInfo(this.alarmdateTime,
      {this.description = "None",
      this.gradiantColor = const [Colors.red, Colors.purple]});
}
