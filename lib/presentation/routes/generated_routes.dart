import 'package:bumblebee/Business_Logic/landing_page_bloc/landing_page_bloc.dart';
import 'package:bumblebee/presentation/Screen/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  final LandingPageBloc ladingPageBloc = LandingPageBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LandingPageBloc>.value(
                  value: ladingPageBloc,
                  child: const LandingPage(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error!'),
        ),
        body: const Center(
          child: Text("Error!"),
        ),
      );
    });
  }
}
