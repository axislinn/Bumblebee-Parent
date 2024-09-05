import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumblebee/bloc/login_bloc/login_event.dart';
import 'package:bumblebee/bloc/login_bloc/login_state.dart';
import 'package:bumblebee/data/repository/repositories/user_repository.dart';
import 'package:bumblebee/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    // Register the event handler for LoginButtonPressed
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

//   Future<void> _onLoginButtonPressed(
//   LoginButtonPressed event, Emitter<LoginState> emit) async {
//   emit(LoginLoading());
//   try {
//     UserModel user = await userRepository.authenticate(
//       email: event.email,
//       password: event.password,
//     );
//     emit(LoginSuccess(user: user));
//   } catch (error) {
//     print('LoginBloc: Error occurred during login - $error');
//     emit(LoginFailure(error: error.toString()));
//   }
// }


Future<void> _onLoginButtonPressed(
  LoginButtonPressed event, Emitter<LoginState> emit) async {
  emit(LoginLoading());
  try {
    UserModel user = await userRepository.authenticate(
      email: event.email,
      password: event.password,
    );
    // Ensure only success state is emitted if authentication succeeds
    emit(LoginSuccess(user: user));
  } catch (error) {
    print('LoginBloc: Error occurred during login - $error');
    emit(LoginFailure(error: error.toString()));
  }
}


}
