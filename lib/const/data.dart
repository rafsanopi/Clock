import 'package:clockapp/const/all_colors.dart';
import 'package:clockapp/const/enums.dart';
import 'package:clockapp/const/menu_info.dart';

import '../model/alarm_info.dart';

List<MenuInfo> menuItem = [
  MenuInfo(MenuType.clock, imgsourse: "assets/clock_icon.png", title: "Clock"),
  MenuInfo(MenuType.alarm, imgsourse: "assets/alarm_icon.png", title: "Alarm"),
  MenuInfo(MenuType.timer, imgsourse: "assets/timer_icon.png", title: "Timer"),
  MenuInfo(MenuType.stopwatch,
      imgsourse: "assets/stopwatch_icon.png", title: "Stopwatch"),
];

List<AlarmInfo> alarm = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
      description: "Genshin", gradiantColor: GradientColors.sky),
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
      description: "COC", gradiantColor: GradientColors.sunset),
];
