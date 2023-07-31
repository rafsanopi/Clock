import 'package:flutter/material.dart';

import '../model/clockview.dart';

class ClockUi extends StatefulWidget {
  const ClockUi(
      {Key? key,
      this.formatedTime,
      this.formatedDate,
      this.offsettime,
      this.timeZone})
      : super(key: key);

  final formatedTime;
  final formatedDate;
  final offsettime;
  final timeZone;

  @override
  State<ClockUi> createState() => _ClockUiState();
}

class _ClockUiState extends State<ClockUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Container(
        alignment: Alignment.center,
        color: const Color(0XFF2D2F41),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Clock",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: "Avenir"),
            ),
            Text(
              widget.formatedTime,
              style: const TextStyle(
                  fontSize: 50, color: Colors.white, fontFamily: "Avenir"),
            ),
            Text(
              widget.formatedDate,
              style: const TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: "Avenir"),
            ),
            const SizedBox(
              height: 20,
            ),
            Clockview(size: MediaQuery.of(context).size.height / 3),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Time Zone",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: "Avenir"),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.language,
                      color: Colors.white,
                    )),
                Text(
                  "UTC  ${widget.offsettime}${widget.timeZone}",
                  style: const TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: "Avenir"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
