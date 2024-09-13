import 'package:bumblebee/data/repository/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumblebee/bloc/signup_bloc/signup_bloc.dart';
import 'package:bumblebee/bloc/signup_bloc/signup_event.dart';
import 'package:bumblebee/bloc/signup_bloc/signup_state.dart';
import 'package:bumblebee/screens/auth/loginscreen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _rolesController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: userRepository),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Registration Successful! Please login.')),
              );
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Registration Failed: ${state.error}')),
              );
            }
          },
          child: SingleChildScrollView(  // Wrap Column inside SingleChildScrollView
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(labelText: 'User Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  TextField(
                    controller: _rolesController,
                    decoration: InputDecoration(labelText: 'Roles'),
                  ),
                  TextField(
                    controller: _relationshipController,
                    decoration: InputDecoration(labelText: 'Relationship'),
                  ),
                  SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          // Now the context inside this Builder will have access to the RegisterBloc
                          final registerBloc = BlocProvider.of<RegisterBloc>(context);
                          registerBloc.add(
                            RegisterButtonPressed(
                              userName: _userNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              phone: _phoneController.text,
                              roles: _rolesController.text,
                              relationship: _relationshipController.text,
                            ),
                          );
                        },
                        child: Text('Register'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
