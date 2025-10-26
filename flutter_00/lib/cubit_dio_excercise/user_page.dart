import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_00/cubit_dio_excercise/user_cubit.dart';
import 'package:flutter_00/cubit_dio_excercise/user_service.dart';
import 'package:flutter_00/cubit_dio_excercise/user_state.dart';

// Main page widget that displays the list of users
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider should wrap the entire Scaffold
    // This ensures all children can access the Cubit
    return BlocProvider(
      // create: callback that creates the Cubit instance
      // We inject UserService as a dependency
      create: (context) => UserCubit(UserService())..loadUsers(),
      // "cascade notation" The ..loadUsers() calls loadUsers immediately after creating the Cubit
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cubit - Dio Exercise'),
          // Add a refresh button in the app bar
          actions: [
            // Now this Builder has access to the Cubit because it's inside BlocProvider
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  // When pressed, call refreshUsers() on the Cubit
                  onPressed: () {
                    context.read<UserCubit>().refreshUsers();
                  },
                );
              },
            ),
          ],
        ),
        body: const UserListView(),
      ),
    );
  }
}

// Separate widget for the user list
class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocBuilder rebuilds the widget when the state changes
    // Generic types <UserCubit, UserState> specify which Cubit and State to listen to
    return BlocBuilder<UserCubit, UserState>(
      // builder: function that returns a widget based on the current state
      builder: (context, state) {
        // Using pattern matching (switch expression) to handle different states
        // This ensures we handle all possible states
        return switch (state) {
          // Initial state - show a message to start loading
          UserInitial() => const Center(
              child: Text('Press refresh to load users'),
            ),

          // Loading state - show a circular progress indicator
          UserLoading() => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading users...'),
                ],
              ),
            ),

          // Loaded state - show the list of users
          UserLoaded() => RefreshIndicator(
              // Pull-to-refresh functionality
              onRefresh: () => context.read<UserCubit>().refreshUsers(),
              child: ListView.builder(
                // Number of items in the list
                itemCount: state.users.length,
                // Builder function for each item
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  // ListTile is a convenient widget for displaying list items
                  return ListTile(
                    // Leading icon (left side)
                    leading: CircleAvatar(
                      child: Text(user.name[0]), // First letter of name
                    ),
                    // Main content
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    // Trailing icon (right side)
                    trailing: Text('#${user.id}'),
                    // When tapped, show a dialog with more details
                    onTap: () => _showUserDetails(context, user),
                  );
                },
              ),
            ),

          // Error state - show error message with retry button
          UserError() => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try Again'),
                      // Retry by calling loadUsers()
                      onPressed: () {
                        context.read<UserCubit>().loadUsers();
                      },
                    ),
                  ],
                ),
              ),
            ),
          
          // Default case to handle any other state (shouldn't happen but needed for exhaustiveness)
          _ => const Center(child: Text('Unknown state')),
        };
      },
    );
  }

  // Helper method to show user details in a dialog
  void _showUserDetails(BuildContext context, user) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(user.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user.id}'),
            const SizedBox(height: 8),
            Text('Username: ${user.username}'),
            const SizedBox(height: 8),
            Text('Email: ${user.email}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
          // Button to load this specific user (demonstrates loadUserById)
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<UserCubit>().loadUserById(user.id);
            },
            child: const Text('Load This User Only'),
          ),
        ],
      ),
    );
  }
}
