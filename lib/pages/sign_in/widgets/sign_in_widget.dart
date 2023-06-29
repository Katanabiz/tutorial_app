import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
            color: AppColors.primarySecondaryBackground,
            // height defines the thickness of the line
            height: 1.0)),
    title: Center(
      child: Text("Log In",
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal)),
    ),
  );
}

// we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      padding: EdgeInsets.only(left: 25.h, right: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusebleIcon("google"),
          _reusebleIcon("apple"),
          _reusebleIcon("facebook"),
        ],
      ));
}

Widget _reusebleIcon(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Image.asset("assets/icons/$iconName.png")));
}

Widget reusebleText(String text) {
  return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(text,
          style: TextStyle(
              color: Colors.grey.withOpacity(0.5),
              fontWeight: FontWeight.normal,
              fontSize: 14.sp)));
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(color: AppColors.primaryFourthElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
              width: 270.w,
              height: 50.w,
              child: TextField(

                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                        color: AppColors.primarySecondaryElementText),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: textType == "password" ? true : false,
              ))
        ],
      ));
}

Widget forgotPassword(String text) {
  return SizedBox(
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: (() {}),
        child: Text(text,
            style: TextStyle(
                color: AppColors.primaryText,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryText,
                fontSize: 12.sp)),
      ));
}

Widget buildLogInAndSignUpButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        margin: EdgeInsets.only(top: buttonType == "Login" ? 40.h : 20.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: buttonType == "Login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.w),
            border: Border.all(
                color: buttonType == "Login"
                    ? Colors.transparent
                    : AppColors.primaryFourthElementText),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ]),
        child: Center(
            child: Text(buttonName,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: buttonType == "Login"
                        ? AppColors.primaryBackground
                        : AppColors.primaryText)))),
  );
}
