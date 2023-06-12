import 'package:flutter/material.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:quran/core/themes/decorations.dart';
import 'package:quran/screens/home.dart';
import '../core/transtion/animated_navigation.dart';

class ExploreItem extends StatelessWidget {
  ExploreItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.id,
      required this.screen})
      : super(key: key);
  String title, subTitle;
  Widget screen;
  int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        animatedPush(context, screen);
        MyIndex.curretExploreindex = id;
        customVar.getRebuildCubit(context).rebuild();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 170,
        decoration: customBoxDecoration(
          radius: 10,
          color: MyIndex.curretExploreindex == id
              ? Theme.of(context).primaryColor
              : const Color.fromARGB(255, 236, 235, 235),
        ),
        child: ListTile(
          title: Text(
            title,
            style: MyIndex.curretExploreindex == id
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline4,
          ),
          subtitle: Text(
            subTitle,
            style: MyIndex.curretExploreindex == id
                ? Theme.of(context).textTheme.subtitle1
                : Theme.of(context).textTheme.headline4,
          ),
          leading: Icon(
            Icons.search,
            size: 35,
          ),
        ),
      ),
    );
  }
}
