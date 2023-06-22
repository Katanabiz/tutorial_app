import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(children: [
                _welcomePage(
                    1,
                    context,
                    "Next",
                    "First See Learning",
                    "Forget about a for of paper all knowlwdge in one learning",
                    "image path"),
                _welcomePage(
                    2,
                    context,
                    "Next",
                    "Connect with Everyone",
                    "Always keep in touch with your tutor & friend.let's get connected!",
                    "image path"),
                _welcomePage(
                    3,
                    context,
                    "Get Started",
                    "Always Fascinated Learning",
                    "Anywhere,anytime.The time is at your discretion so syudy whenever you want.",
                    "image path"),
              ]),
              Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8.0),
                          activeSize: const Size(10.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))))
            ],
          ),
        ),
      ),
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
        child: Text(imagePath),
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
      Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.blue,
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
    ]);
  }
}
