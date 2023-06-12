// import 'package:flutter/material.dart';
// import 'package:quran/screens/home.dart';
// import 'package:quran/screens/readers.dart';
// import '../pray/presentation/wedgits/pray_item.dart';
// import '../surah/presentation/wedgits/aya_of_day.dart';
// import '../widgets/explore_item.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


// class TestAnimation extends StatelessWidget {
//    TestAnimation({Key? key}) : super(key: key);

//    List<Map<String, String>> praysData = [
//     {"name": "Fajar", "url": "assets/images/sunrise.jpg"},
//     {"name": "Duhar", "url": "assets/images/duher.png"},
//     {"name": "Asar", "url": "assets/images/asr.jpg"},
//     {"name": "Maghrib", "url": "assets/images/sunset.png"},
//     {"name": "Esha", "url": "assets/images/night.jpg"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child:  AnimationLimiter(
//           child: Column(
//             children: AnimationConfiguration.toStaggeredList(
//               duration: const Duration(milliseconds: 2000),
//               childAnimationBuilder: (widget) => SlideAnimation(
//                 horizontalOffset: 50.0,
//                 child: FadeInAnimation(
//                   child: widget,
//                 ),
//               ),
//               children: [
//                   const Stacked(),
//                  const SizedBox(height: 20,),
//                    Text("مواقيت الصلاة",style: Theme.of(context).textTheme.headline4,),
                  
//                   SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                       itemCount: praysData.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(4),
//                           child: PrayItem(
//                               name: praysData[index]["name"]!,
//                               imagePath: praysData[index]["url"]!),
//                         );
//                       },
//                     ),
//                   ),
//                   const AyaOfDay(),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                    ExploreItem(title: "Readers",subTitle: "5",screen:  Readers(),)
//                 ],
             
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }