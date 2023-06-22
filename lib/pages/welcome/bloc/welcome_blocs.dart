import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_app/pages/welcome/bloc/welcome_events.dart';
import 'package:tutorial_app/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
 // after this we are going to call the Constructo of this class

 WelcomeBloc():super(WelcomeState()){
 // after that we register over envent
  on<WelcomeEvent>((event, emit) {
    // we just emit our state 
    // emit is send new state;
    emit(WelcomeState(page: state.page));
  });
 }

}