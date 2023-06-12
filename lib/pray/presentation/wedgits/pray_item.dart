import 'package:flutter/material.dart';

import '../../../core/themes/decorations.dart';

class PrayItem extends StatelessWidget {
  PrayItem(
      {Key? key,
      required this.name,
      required this.imagePath,
      required this.time})
      : super(key: key);
  String name, imagePath, time;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: customBoxDecorationWithImage(10, imagePath),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${time.substring(0, 5)}\n ${time.substring(5)}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(name, style: Theme.of(context).textTheme.subtitle2)
        ],
      ),
    );
  }
}
