import 'package:bumblebee/models/user_model.dart';

class UserRepository {
  // Simulate user data fetching and authentication

  Future<UserModel> authenticate({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Simulate authentication success/failure
    if (email == 'test@test.com' && password == 'password') {
      return UserModel(id: '1', email: email, name: 'Test User');
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<UserModel> register({required String email, required String password, required String name}) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Simulate successful registration
    return UserModel(id: '2', email: email, name: name);
  }
}
