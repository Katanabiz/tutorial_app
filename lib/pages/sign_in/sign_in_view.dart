import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/sign_in_bloc.dart';
import 'widgets/sign_in_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc,SignInState>(
      builder:(context,state){
        return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(
                          child: reusebleText(
                              'Or use your eamil account to login')),
                      Container(
                          margin: EdgeInsets.only(top: 36.h),
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusebleText('Eamil'),
                              SizedBox(height: 5.h),
                              buildTextField(
                                  "Enter your eamil adrees", "email", "user"),
                              reusebleText('Password'),
                              SizedBox(height: 5.h),
                              buildTextField("Enter your your password",
                                  "password", "lock"),
                              forgotPassword("Forgot Password"),
                              buildLogInAndSignUpButton("Log In", "Login"),
                              buildLogInAndSignUpButton("Sign Up", "Signup"),
                            ],
                          ))
                    ],
                  ),
                ))));
      }
    );
  }
}
