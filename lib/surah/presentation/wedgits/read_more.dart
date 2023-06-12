import 'package:flutter/material.dart';
import 'package:quran/core/screen_size/screen_size.dart';

class ReadMore extends StatefulWidget {
  ReadMore({Key? key, required this.title, required this.content})
      : super(key: key);
  String title, content;
  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool readMore = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(
            width: ScreenSize.width*.9,
            child: Text(
             " ${widget.content}",
              maxLines: readMore ? null : 3,
              style: Theme.of(context).textTheme.headline6
            ),
          ),


          if(widget.content.length * 10 > ScreenSize.width * 2.9)
          InkWell(
            onTap: () {
              setState(() {
                readMore = !readMore;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(readMore ? "عرض اقل" : "عرض المزيد "),
                Icon(readMore ? Icons.arrow_circle_up : Icons.arrow_downward)
              ],
            ),
          )
        ],
      ),
    );
  }
}
