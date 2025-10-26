import 'package:flutter_00/cubit_dio_excercise/user_model.dart';

// State classes for UserCubit
// These represent different states our app can be in while fetching data

// Base class for all user states
// Using sealed class ensures all possible states are handled in switch statements
abstract class UserState {}

// Initial state - when the app starts and no data has been fetched yet
class UserInitial extends UserState {}

// Loading state - when we're fetching data from the API
// This is useful to show a loading indicator to the user
class UserLoading extends UserState {}

// Success state - when data has been successfully fetched
// Contains a list of users that we can display
class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded(this.users);
}

// Error state - when something goes wrong (network error, API error, etc.)
// Contains an error message that we can display to the user
class UserError extends UserState {
  final String message;

  UserError(this.message);
}
