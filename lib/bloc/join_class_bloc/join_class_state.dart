import 'package:equatable/equatable.dart';

abstract class JoinClassState extends Equatable {
  const JoinClassState();

  @override
  List<Object> get props => [];
}

class JoinClassInitial extends JoinClassState {}

class JoinClassLoading extends JoinClassState {}

class JoinClassSuccess extends JoinClassState {}

class JoinClassFailure extends JoinClassState {
  final String error;

  const JoinClassFailure(this.error);

  @override
  List<Object> get props => [error];
}