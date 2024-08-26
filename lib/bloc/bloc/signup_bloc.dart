import 'package:bumblebee/bloc/bloc/signup_event.dart';
import 'package:bumblebee/bloc/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        // Simulate a registration process
        await Future.delayed(Duration(seconds: 2));
        if (event.password == event.confirmPassword) {
          yield RegisterSuccess();
        } else {
          yield RegisterFailure(error: 'Passwords do not match');
        }
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    }
  }
}
