import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumblebee/bloc/signup_bloc/signup_event.dart';
import 'package:bumblebee/bloc/signup_bloc/signup_state.dart';
import 'package:bumblebee/data/repository/repositories/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterInitial()) {
    // Registering the event handler using on<RegisterButtonPressed>
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  // The event handler for RegisterButtonPressed
  void _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      if (event.password != event.confirmPassword) {
        emit(RegisterFailure(error: 'Passwords do not match'));
        return;
      }

      final user = await userRepository.register(
        userName: event.userName,
        email: event.email,
        password: event.password,
        confirmedPassword: event.confirmPassword,
        phone: event.phone,
        relationship: event.relationship,
      );

      emit(RegisterSuccess(user: user));
    } catch (error) {
      emit(RegisterFailure(error: error.toString()));
    }
  }
}
