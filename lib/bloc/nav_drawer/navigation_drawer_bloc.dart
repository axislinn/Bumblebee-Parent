import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

// Event
abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class NavigateToFeed extends NavigationEvent {}
class NavigateToJoinClass extends NavigationEvent {}
class NavigateToSettings extends NavigationEvent {}
class NavigateToInfo extends NavigationEvent {}

// State
abstract class NavigationState extends Equatable {
  @override
  List<Object?> get props => [];
}
class FeedPageState extends NavigationState {}
class JoinClassPageState extends NavigationState {}
class SettingsPageState extends NavigationState {}
class InfoPageState extends NavigationState {}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(FeedPageState()) {
    on<NavigateToFeed>((event, emit) => emit(FeedPageState()));
    on<NavigateToJoinClass>((event, emit) => emit(JoinClassPageState()));
    on<NavigateToSettings>((event, emit) => emit(SettingsPageState()));
    on<NavigateToInfo>((event, emit) => emit(InfoPageState()));
  }
}
