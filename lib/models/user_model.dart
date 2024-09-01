class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;
  final String confirmedPassword;
  final String phone;
  final String roles;
  final String relationship;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmedPassword,
    required this.phone,
    required this.roles,
    required this.relationship,
  });

  // Convert a JSON map into a UserModel instance
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmedPassword: json['confirmedPassword'] as String,
      phone: json['phone'] as String,
      roles: json['roles'] as String,
      relationship: json['relationship'] as String,
    );
  }

  // Convert a UserModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'password': password,
      'confirmedPassword': confirmedPassword,
      'phone': phone,
      'roles': roles,
      'relationship': relationship,
    };
  }
}
