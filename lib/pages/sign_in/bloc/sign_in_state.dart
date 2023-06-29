part of 'sign_in_bloc.dart';

@immutable
 class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});
  SignInState copyWith({String? eamil, String? password}) {
    return SignInState(
        email: eamil ?? email, password: password ?? this.password);
  }
}
