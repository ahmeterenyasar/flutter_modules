// Model class representing a User
// This is a simple data class that will hold user information
// We use fromJson factory constructor to convert JSON data to User object
class User {
  final int id;
  final String name;
  final String email;
  final String username;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
  });

  // Factory constructor to create a User object from JSON
  // This is called when we receive data from the API
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
    );
  }

  // Method to convert User object to JSON (useful for sending data to API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
    };
  }
}
