import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorial_app/pages/welcome/bloc/welcome_blocs.dart';

import 'pages/sign_in/sign_in_view.dart';
import 'pages/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy:false,
            create: (context) => WelcomeBloc(),
          )
        ],
        child: ScreenUtilInit(
            builder: (contxt, child) => MaterialApp(
                 // title: 'Flutter Demo',
                  // theme: ThemeData(
                  //   primarySwatch: Colors.blue,
                  // ),
                  home: const Welcome(),
                  routes: {
                    "signInView":(contet)=>const SignInView(),
                  },
                )));
  }
}
