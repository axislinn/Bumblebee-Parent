import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumblebee/bloc/bloc/signup_event.dart';
import 'package:bumblebee/bloc/bloc/signup_state.dart';
import 'package:bumblebee/data/repository/repositories/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        if (event.password != event.confirmPassword) {
          yield RegisterFailure(error: 'Passwords do not match');
          return;
        }

        final user = await userRepository.register(
          userName: event.userName,
          email: event.email,
          password: event.password,
          confirmedPassword: event.confirmPassword,
          phone: event.phone,
          roles: event.roles,
          relationship: event.relationship,
        );

        yield RegisterSuccess(user: user);
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    }
  }
}
