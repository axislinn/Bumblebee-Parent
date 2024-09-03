part of 'landing_page_bloc.dart';

class LandingPageState extends Equatable {
  final int tabIndex;

  const LandingPageState({required this.tabIndex});
  //const LandingPageState();

  @override
  List<Object> get props => [tabIndex];
}

class LandingPageInitial extends LandingPageState {
  const LandingPageInitial({required super.tabIndex});
}
