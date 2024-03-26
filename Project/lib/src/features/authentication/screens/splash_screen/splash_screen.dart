// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../constants/colors.dart';
// import '../../../../constants/image_strings.dart';
// import '../../../../constants/sizes.dart';
// import '../../../../constants/text_strings.dart';
// import '../../controllers/splash_screen_controller.dart';
//
// class SplashScreen extends StatelessWidget {
//   SplashScreen({Key? key}) : super(key: key);
//
//   final splashController = Get.put(SplashScreenController());
//
//   @override
//   Widget build(BuildContext context) {
//     splashController.startAnimation();
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 30,
//             left: -10,
//             height: 100,
//             child: Image(image: AssetImage(tSplashTopICon)),
//           ),
//           Positioned(
//             top: 150,
//             left: splashController.animate.value ? tDefaultSize : -80,
//             child: Opacity(
//               opacity: splashController.animate.value ? 1 : 0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     tAppName,
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     tAppTagLine,
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: splashController.animate.value ? 300 : 0,
//             left: 150,
//             child: Opacity(
//               opacity: splashController.animate.value ? 1 : 0,
//               child: Image(image: AssetImage(tSplashImage)),
//             ),
//           ),
//           Positioned(
//             bottom: splashController.animate.value ? 40 : 0,
//             right: splashController.animate.value ? tDefaultSize : 0,
//             child: Opacity(
//               opacity: splashController.animate.value ? 1 : 0,
//               child: Container(
//                 width: tSplashContainerSize,
//                 height: tSplashContainerSize,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: tPrimaryColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }