import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainDialog extends StatelessWidget {
  MainDialog({Key? key, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Location is necessary"),
      actions: [
        TextButton(
          onPressed: () {
           
          },
          child: const Text('OK'),
        ),
         TextButton(
          onPressed: (){
            SystemNavigator.pop();
          },
          child: const Text('NO'),
        )
      ],
    );
  }
}
