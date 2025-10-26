# Cubit + Dio Exercise

This exercise demonstrates how to use **Cubit** (from flutter_bloc) and **Dio** packages together to fetch and manage data from an API.

## 📚 What You'll Learn

### 1. **Cubit (State Management)**
- How to create a Cubit to manage application state
- How to emit different states (Loading, Loaded, Error)
- How to use BlocProvider to provide Cubit to widgets
- How to use BlocBuilder to rebuild UI when state changes
- How to access Cubit methods using `context.read<UserCubit>()`

### 2. **Dio (HTTP Client)**
- How to configure Dio with base URL and timeouts
- How to make GET requests to fetch data
- How to handle different types of errors (timeout, connection, etc.)
- How to parse JSON responses into Dart objects

### 3. **Best Practices**
- Separation of concerns (Model, Service, Cubit, UI)
- Error handling at different layers
- Using dependency injection
- Pull-to-refresh functionality
- Pattern matching with switch expressions

## 📁 File Structure

```
cubit_dio_excercise/
├── user_model.dart      # Data model for User
├── user_state.dart      # State classes for different UI states
├── user_service.dart    # API service using Dio
├── user_cubit.dart      # Cubit for state management
├── user_page.dart       # UI layer with BlocBuilder
└── README.md           # This file
```

## 🔄 Data Flow

```
UI (user_page.dart)
    ↓ (calls method)
Cubit (user_cubit.dart)
    ↓ (calls API)
Service (user_service.dart)
    ↓ (makes HTTP request)
API (jsonplaceholder.typicode.com)
    ↓ (returns JSON)
Service (converts to Model)
    ↓ (returns data)
Cubit (emits new state)
    ↓ (notifies)
UI (rebuilds with new state)
```

## 🚀 How to Run

1. Make sure `dio` and `flutter_bloc` are in your `pubspec.yaml`:
```yaml
dependencies:
  flutter_bloc: ^8.1.3
  dio: ^5.4.0
```

2. Run `flutter pub get` to install dependencies

3. Update your `main.dart` to show the UserPage:
```dart
import 'package:flutter_00/cubit_dio_excercise/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit + Dio Exercise',
      theme: ThemeData.dark(),
      home: const UserPage(),
    );
  }
}
```

4. Run the app: `flutter run`

## 💡 Key Concepts Explained

### State Management with Cubit
- **UserInitial**: App just started
- **UserLoading**: Fetching data from API
- **UserLoaded**: Data successfully fetched and ready to display
- **UserError**: Something went wrong, show error message

### Cubit Methods
- `loadUsers()`: Fetches all users
- `loadUserById(id)`: Fetches a specific user
- `refreshUsers()`: Reloads the user list

### Dio Configuration
- **BaseOptions**: Configure default settings for all requests
- **Timeouts**: Prevent requests from hanging forever
- **DioException**: Handle network errors gracefully

## 🎯 Try These Exercises

1. **Add a search feature**: Filter users by name
2. **Add pagination**: Load users in batches of 5
3. **Add POST request**: Create a new user (fake API supports this)
4. **Add caching**: Store users locally and show cached data while loading
5. **Add BlocListener**: Show snackbar when error occurs
6. **Add debouncing**: Prevent multiple rapid refresh clicks

## 📖 Additional Resources

- [flutter_bloc documentation](https://bloclibrary.dev/)
- [Dio documentation](https://pub.dev/packages/dio)
- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)
