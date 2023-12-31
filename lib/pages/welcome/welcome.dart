import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorial_app/common/values/colors.dart';
import 'package:tutorial_app/cubit.dart';
import 'package:tutorial_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:tutorial_app/pages/welcome/bloc/welcome_state.dart';

import 'bloc/welcome_events.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
              //   return Container(
              //     width: 40.w,
              //     height: 20.h,
              //     child: SwitchListTile(
              //       value: state,
              //       onChanged: (value) {
              //         BlocProvider.of<ThemeCubit>(context)
              //             .toggleTheme(value: value);
              //       },
              //       title: const Text("Toggle theme"),
              //     ),
              //   );
              // }),
              PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    print("index value is ${index}");
                  },
                  children: [
                    _welcomePage(
                        1,
                        context,
                        "Next",
                        "First See Learning",
                        "Forget about a for of paper all knowlwdge in one learning",
                        "assets/images/reading.png"),
                    _welcomePage(
                        2,
                        context,
                        "Next",
                        "Connect with Everyone",
                        "Always keep in touch with your tutor & friend.let's get connected!",
                        "assets/images/boy.png"),
                    _welcomePage(
                        3,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere,anytime.The time is at your discretion so syudy whenever you want.",
                        "assets/images/man.png"),
                  ]),
              Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: AppColors.primaryThrirdElementText,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))))
            ],
          ),
        );
      })),
    );
  }

// make them Dynamic
// we have to pass a lot of things inside
  Widget _welcomePage(int index, BuildContext contect, String buttonName,
      String title, String subTitle, String imagePath) {
    return Column(children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
      Container(
        child: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal)),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal)),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);

            // fall back to this condition
          } else {
            // forget the earlier routes we dont't need of them.
            // Navigator.of(contect).push(MaterialPageRoute(builder: (contect) => MyHomepage()));
            Navigator.of(contect)
                .pushNamedAndRemoveUntil("signInView", (route) => false);
          }
        },
        child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.w))),
            child: Center(
              child: Text(buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal)),
            )),
      ),
    ]);
  }
}
