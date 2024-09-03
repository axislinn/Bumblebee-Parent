part of 'landing_page_bloc.dart';

sealed class LandingPageEvent extends Equatable {
  const LandingPageEvent();

  @override
  List<Object> get props => [];
}

class TabChange extends LandingPageEvent {
  final int tabIndex;

  const TabChange({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}
