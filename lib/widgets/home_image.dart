import 'package:flutter/material.dart';

import '../core/screen_size/screen_size.dart';
import '../core/themes/decorations.dart';

class Stacked extends StatelessWidget {
  const Stacked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height * .4,
      decoration:
          customBoxDecorationWithImage(20, "assets/images/mosque_2.jpg"),
      // child: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: const [
      //           Icon(Icons.abc),
      //           Text("الاحد"),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 30),
      //       child: Center(
      //         child: Column(
      //           children: [
      //             RichText(
      //                 text: const TextSpan(
      //                     text: "05:34", children: [TextSpan(text: "pm")])),
      //             Text("Next is ")
      //           ],
      //         ),
      //       ),
      //     ),
      //     Row(
      //       children: [
      //         Column(
      //           children: [Text("data"), Text("1223456")],
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
