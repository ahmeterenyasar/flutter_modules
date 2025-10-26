import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_00/cubit_dio_excercise/user_service.dart';
import 'package:flutter_00/cubit_dio_excercise/user_state.dart';

// Cubit class - manages the state of user data
// Cubit is simpler than Bloc - you just emit new states directly
// Generic type <UserState> means this Cubit emits UserState objects
class UserCubit extends Cubit<UserState> {
  // UserService instance to make API calls
  final UserService _userService;

  // Constructor:
  // - Takes UserService as dependency (dependency injection)
  // - Calls super(UserInitial()) to set initial state
  UserCubit(this._userService) : super(UserInitial());

  // Method to load users from the API
  // This is called from the UI when we want to fetch data
  Future<void> loadUsers() async {
    // Step 1: Emit loading state
    // This tells the UI to show a loading indicator
    emit(UserLoading());

    try {
      // Step 2: Call the service to fetch users
      // await pauses execution until the data is fetched
      final users = await _userService.fetchUsers();

      // Step 3: Emit success state with the data
      // This tells the UI to display the users
      emit(UserLoaded(users));
    } catch (e) {
      // Step 4: If an error occurs, emit error state
      // This tells the UI to show an error message
      emit(UserError(e.toString()));
    }
  }

  // Method to load a specific user by ID
  // Demonstrates how to handle different types of API calls
  Future<void> loadUserById(int id) async {
    emit(UserLoading());

    try {
      final user = await _userService.fetchUserById(id);
      // Even though we got a single user, we emit it as a list for consistency
      // In a real app, you might have a separate state for single user
      emit(UserLoaded([user]));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  // Method to refresh/reload users
  // This is useful for pull-to-refresh functionality
  Future<void> refreshUsers() async {
    // We can call loadUsers() directly since it already handles the logic
    await loadUsers();
  }
}
