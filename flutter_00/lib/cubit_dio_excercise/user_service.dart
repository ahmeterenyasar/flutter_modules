import 'package:dio/dio.dart';
import 'package:flutter_00/cubit_dio_excercise/user_model.dart';

// Service class that handles all API calls
// This separates network logic from business logic (Cubit)
class UserService {
  // Dio instance - the main class from dio package for making HTTP requests
  // We configure it with a base URL so we don't have to repeat it
  final Dio _dio = Dio(
    BaseOptions(
      // Using JSONPlaceholder - a free fake API for testing
      baseUrl: 'https://jsonplaceholder.typicode.com',
      // Timeout after 5 seconds if the server doesn't respond
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  // Method to fetch all users from the API
  // Returns a list of User objects
  // Can throw exceptions if something goes wrong
  Future<List<User>> fetchUsers() async {
    try {
      // Making a GET request to /users endpoint
      // Dio automatically handles the HTTP connection and response parsing
      final response = await _dio.get('/users');

      // Check if the request was successful (status code 200-299)
      if (response.statusCode == 200) {
        // response.data contains the parsed JSON (List<dynamic> in this case)
        final List<dynamic> jsonList = response.data;
        
        // Convert each JSON object to a User object using our model's fromJson
        // map() transforms each element, toList() converts it back to a List
        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        // If status code is not successful, throw an error
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // DioException is thrown for network errors, timeouts, etc.
      // We handle it and provide a user-friendly error message
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout - please check your internet');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Server took too long to respond');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('No internet connection');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      // Catch any other unexpected errors
      throw Exception('Unexpected error: $e');
    }
  }

  // Method to fetch a single user by ID
  // Demonstrates how to use path parameters with Dio
  Future<User> fetchUserById(int id) async {
    try {
      // Using path parameter - /users/1, /users/2, etc.
      final response = await _dio.get('/users/$id');

      if (response.statusCode == 200) {
        // response.data is a Map<String, dynamic> for a single object
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
