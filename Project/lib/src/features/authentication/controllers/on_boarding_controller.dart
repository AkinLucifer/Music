// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:project/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
//
// import '../../../constants/colors.dart';
// import '../../../constants/image_strings.dart';
// import '../../../constants/text_strings.dart';
// import '../models/model_on_boarding.dart';
// import '../screens/on_boarding/on_boarding_page_widget.dart';
//
// class OnBoardingController extends GetxController{
//   final Controller = LiquidController();
//   RxInt CurrentPage =0.obs;
//   final pages = [
//     OnBoardingPageWidget(model: OnBoardingModel(
//         image: tOnBoardingImage1,
//         title: tOnBoardingTitle1,
//         subTitle: tOnBoardingSubTitle1,
//         counterText: tOnBoardingCounter1,
//         bgColor: tOnBoardingPage1Color,
//         )),
//
//     OnBoardingPageWidget(model: OnBoardingModel(
//         image: tOnBoardingImage2,
//         title: tOnBoardingTitle2,
//         subTitle: tOnBoardingSubTitle2,
//         counterText: tOnBoardingCounter2,
//         bgColor: tOnBoardingPage2Color,
//         )),
//     OnBoardingPageWidget(model: OnBoardingModel(
//         image: tOnBoardingImage3,
//         title: tOnBoardingTitle3,
//         subTitle: tOnBoardingSubTitle3,
//         counterText: tOnBoardingCounter3,
//         bgColor: tOnBoardingPage3Color,
//         )),
//   ];
//
//   skip() => Get.to(WelcomeScreen());
//   animateToNextSlide(){
//     int nextPage = Controller.currentPage +1;
//     Controller.animateToPage(page: nextPage);
//   }
//   void onPageChangedCallback(int activePageIndex) {
//       CurrentPage.value = activePageIndex;
//   }
// }