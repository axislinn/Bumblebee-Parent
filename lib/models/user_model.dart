class UserModel {
  final String id;
  final String userName;
  final String email;
  final String profilePicture;
  final String phone;
  final List<String> roles;
  final List<String> relationship;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.profilePicture,
    required this.phone,
    required this.roles,
    required this.relationship,
  });

  // Convert a JSON map into a UserModel instance
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '', // Ensure _id is handled properly
      userName: json['userName'] ?? 'Unknown', // Handle null or missing values
      email: json['email'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      phone: json['phone'] ?? '',
      roles: List<String>.from(json['roles'] ?? []), // Parse roles as List<String>
      relationship: List<String>.from(json['relationship'] ?? []), // Parse relationship as List<String>
    );
  }

  // Convert a UserModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userName': userName,
      'email': email,
      'profilePicture': profilePicture,
      'phone': phone,
      'roles': roles,
      'relationship': relationship,
    };
  }
}
