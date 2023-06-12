import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
   CircularButton({Key? key,required this.iconData,required this.function}) : super(key: key);
 IconData iconData;
  Function function ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(50, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                     Theme.of(context).primaryColor
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                onPressed: () => function(),
                child:  Icon(iconData));
  }
}