import 'package:clockapp/const/all_colors.dart';
import 'package:clockapp/const/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Alarmui extends StatelessWidget {
  const Alarmui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Alarm",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontFamily: "Avenir"),
          ),
          Expanded(
            child: ListView(
              children: alarm
                  .map<Widget>((alarm) => Container(
                        margin: const EdgeInsets.only(bottom: 13),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red.withOpacity(0.4),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(4, 4))
                            ],
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: alarm.gradiantColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.label,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Dti",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Avenir",
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Switch(
                                    value: true,
                                    activeColor: Colors.white,
                                    onChanged: (bool value) {})
                              ],
                            ),
                            const Text(
                              "Friday",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Avenir",
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "7:00 am",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                      fontFamily: "Avenir",
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 34,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                  .followedBy([
                DottedBorder(
                  color: CustomColors.clockOutline,
                  strokeWidth: 3,
                  borderType: BorderType.RRect,
                  dashPattern: const [
                    8,
                    8,
                  ],
                  radius: const Radius.circular(24),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                        color: CustomColors.clockBG),
                    child: TextButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/add_alarm.png",
                            scale: 1.5,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Add Alarm",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }
}
