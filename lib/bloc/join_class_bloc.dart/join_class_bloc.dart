import 'package:bloc/bloc.dart';
import 'package:bumblebee/data/repository/repositories/join_class_repository.dart';
import 'join_class_event.dart';
import 'join_class_state.dart';


class JoinClassBloc extends Bloc<JoinClassEvent, JoinClassState> {
  final JoinClassRepository joinclassRepository;

  JoinClassBloc({required this.joinclassRepository}) : super(JoinClassInitial()) {

    on<JoinButtonPressed>(_onJoinButtonPressed);
  }

  Future<void> _onJoinButtonPressed(
      JoinButtonPressed event, Emitter<JoinClassState> emit) async {
    emit(JoinClassLoading());
    
    try {
      await joinclassRepository.joinClass(
        event.classCode,
        event.childName,
        event.studentDOB,
      );
      emit(JoinClassSuccess());
    } catch (e) {
      emit(JoinClassFailure(e.toString()));
    }
  }
}
