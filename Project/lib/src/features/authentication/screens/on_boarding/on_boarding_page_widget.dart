import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage(model.image), height: size.height*0.5,),
          Column(
            children: [
              Text(model.title, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text(model.subTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
              SizedBox(height: 180.0,)
            ],
          ),

          Text(model.counterText, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),),
        ],
      ),
    );
  }
}