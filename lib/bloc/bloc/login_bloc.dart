import 'package:bumblebee/data/repository/repositories/user_repository.dart';
import 'package:bumblebee/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        UserModel user = await userRepository.authenticate(
          email: event.email,
          password: event.password,
        );
        yield LoginSuccess(user: user);
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
