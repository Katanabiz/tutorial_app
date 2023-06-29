import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tutorial_app/cubit.dart';
import 'package:tutorial_app/pages/welcome/bloc/welcome_blocs.dart';

import 'pages/sign_in/bloc/sign_in_bloc.dart';
import 'pages/sign_in/sign_in_view.dart';
import 'pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HydratedBloc.storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(),
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
                    "signInView": (contet) => const SignInView(),
                  },
                )));
  }
}
