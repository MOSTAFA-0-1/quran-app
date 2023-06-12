import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/custom_variables.dart';
import 'package:quran/surah/presentation/controller/slider_cubit/slider_cubit.dart';
import 'package:quran/surah/presentation/controller/slider_cubit/slider_states.dart';



class MySlider extends StatefulWidget {
  MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double sliderValue = 0;

  
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SliderCubit, SliderStates>(
      builder: (context, state) {
      
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Slider(
                activeColor: Colors.white,
                min: 0,
                max: 1000,
                value: state.position,
                onChanged: (val) {
                  
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.position.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                    state.duration.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
