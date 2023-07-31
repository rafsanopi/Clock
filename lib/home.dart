// ignore_for_file: prefer_const_constructors

import 'package:clockapp/const/data.dart';
import 'package:clockapp/const/enums.dart';
import 'package:clockapp/const/menu_info.dart';
import 'package:clockapp/ui/alarm_ui.dart';
import 'package:clockapp/ui/clock_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatedTime = DateFormat('h:mm a').format(DateTime.now());
    var formatedDate = DateFormat('EEE, MMM d,').format(DateTime.now());
    var timeZone = DateTime.now().timeZoneOffset.toString().split(".").first;
    var offsettime = "";
    if (!timeZone.startsWith("-")) offsettime = "+";
    return Scaffold(
      backgroundColor: Color(0XFF2D2F41),
      body: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItem
                  .map((currentmenuInfo) => Buildmenubutton(
                        currentmenuinfo: currentmenuInfo,
                      ))
                  .toList(),
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 7,
            ),
            Expanded(child: Consumer<MenuInfo>(
              builder: (BuildContext context, value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return ClockUi(
                    formatedDate: formatedDate,
                    formatedTime: formatedTime,
                    offsettime: offsettime,
                    timeZone: timeZone,
                  );
                }
                return Alarmui();
              },
            )),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Buildmenubutton extends StatelessWidget {
  late MenuInfo currentmenuinfo;

  Buildmenubutton({Key? key, required this.currentmenuinfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: currentmenuinfo.menuType == value.menuType
                    ? Color.fromARGB(255, 84, 49, 165)
                    : Colors.transparent, //background color
              ),
              onPressed: () {
                var menuInfo = Provider.of<MenuInfo>(context, listen: false);
                menuInfo.updateMenuinfo(currentmenuinfo);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Image.asset(
                      currentmenuinfo.imgsourse,
                      scale: 1.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentmenuinfo.title,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
