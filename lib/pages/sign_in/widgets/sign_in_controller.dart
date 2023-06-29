import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String typeName) async {
    try {
      if (typeName == 'eamil') {
        final state = context.read<SignInBloc>().state;
        String eamilAddress = state.email;
        String password = state.password;
        if (eamilAddress.isEmpty) {}
        if (password.isEmpty) {}

        // one more time try and chatch because network issues
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: eamilAddress, password: password);

          if (credential.user == null) {}
          if (credential.user!.emailVerified) {}

          var user = credential.user;
          if (user != null) {
// we got verified user from firbase
          } else {
            // we have error getting  user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
