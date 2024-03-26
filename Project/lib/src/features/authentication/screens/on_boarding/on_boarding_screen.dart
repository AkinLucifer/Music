// import 'package:flutter/material.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:project/src/constants/colors.dart';
// import 'package:project/src/constants/image_strings.dart';
// import 'package:project/src/constants/sizes.dart';
// import 'package:project/src/constants/text_strings.dart';
// import 'package:project/src/features/authentication/controllers/on_boarding_controller.dart';
// import 'package:project/src/features/authentication/models/model_on_boarding.dart';
// import 'package:project/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//    OnBoardingScreen({super.key});
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final controller = LiquidController();
//
//   int CurrentPage =  0;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final obscontroller = OnBoardingController();
//
//
//
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             LiquidSwipe(pages: obscontroller.pages,
//               enableSideReveal: true,
//               liquidController: obscontroller.Controller,
//               onPageChangeCallback: obscontroller.onPageChangedCallback,
//               slideIconWidget: Icon(Icons.arrow_back_ios),
//
//             ),
//             Positioned(bottom : 90.0,
//                 child: OutlinedButton(
//                   onPressed: ()=>obscontroller.animateToNextSlide(),
//                   style: ElevatedButton.styleFrom(
//                     side: const BorderSide(color: Colors.black26),
//                     shape: const CircleBorder(),
//                     padding: const EdgeInsets.all(20),
//                     onPrimary: Colors.white,
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.all(10.0),
//                     decoration: const BoxDecoration(
//                       color: tDarkColor, shape: BoxShape.circle
//                     ),
//                     child: const Icon(Icons.arrow_forward_ios),
//                   ),
//                    )
//             ),
//             Positioned(
//                 top: 50,
//                 right: 20,
//                 child: TextButton(
//               onPressed: () => obscontroller.skip(),
//               child: const Text("Skip", style: TextStyle(color: Colors.grey),),
//             )),
//            Positioned(
//              bottom: 30.0,
//                child: AnimatedSmoothIndicator(
//
//              count: 3,
//              activeIndex: obscontroller.CurrentPage.value,
//              effect: const WormEffect(
//                activeDotColor: Color(0xff272727),
//                dotHeight: 5.0,
//              ),
//            )),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
//
//
