import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthService {
  static bool _isLoggedIn = false;
  static User? _currentUser;
  static String? _authToken;

  // Backend GraphQL API endpoint
  static const String apiUrl = 'http://localhost:8000/graphql';

  static bool get isLoggedIn => _isLoggedIn;
  static User? get currentUser => _currentUser;
  static String? get authToken => _authToken;

  // Login with GraphQL API
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'query': '''
            mutation Login(\$email: String!, \$password: String!) {
              login(email: \$email, password: \$password) {
                user {
                  id
                  name
                  email
                }
                token
                message
              }
            }
          ''',
          'variables': {
            'email': email,
            'password': password,
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['errors'] != null) {
          return {
            'success': false,
            'message': data['errors'][0]['message'] ?? 'Login failed',
          };
        }

        final loginData = data['data']['login'];
        _authToken = loginData['token'];

        // Create user object from API response
        _currentUser = User(
          name: loginData['user']['name'],
          email: loginData['user']['email'],
          avatarUrl: 'https://ui-avatars.com/api/?name=${loginData['user']['name']}&background=random',
          tripsCompleted: 0, // Will be updated from profile later
          reviewsWritten: 0,
          memberSince: 'Member',
        );

        _isLoggedIn = true;

        return {
          'success': true,
          'message': loginData['message'] ?? 'Login successful!',
          'user': _currentUser,
          'token': _authToken,
        };
      } else {
        return {
          'success': false,
          'message': 'Server error. Please try again.',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Connection error. Make sure the backend is running.',
      };
    }
  }

  // Register with GraphQL API
  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'query': '''
            mutation Register(
              \$name: String!
              \$email: String!
              \$password: String!
              \$password_confirmation: String!
            ) {
              register(
                name: \$name
                email: \$email
                password: \$password
                password_confirmation: \$password_confirmation
              ) {
                user {
                  id
                  name
                  email
                }
                token
                message
              }
            }
          ''',
          'variables': {
            'name': name,
            'email': email,
            'password': password,
            'password_confirmation': passwordConfirmation,
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['errors'] != null) {
          return {
            'success': false,
            'message': data['errors'][0]['message'] ?? 'Registration failed',
          };
        }

        final registerData = data['data']['register'];
        _authToken = registerData['token'];

        // Create user object from API response
        _currentUser = User(
          name: registerData['user']['name'],
          email: registerData['user']['email'],
          avatarUrl: 'https://ui-avatars.com/api/?name=${registerData['user']['name']}&background=random',
          tripsCompleted: 0,
          reviewsWritten: 0,
          memberSince: 'New Member',
        );

        _isLoggedIn = true;

        return {
          'success': true,
          'message': registerData['message'] ?? 'Registration successful!',
          'user': _currentUser,
          'token': _authToken,
        };
      } else {
        return {
          'success': false,
          'message': 'Server error. Please try again.',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Connection error. Make sure the backend is running.',
      };
    }
  }

  // Logout with GraphQL API
  static Future<Map<String, dynamic>> logout() async {
    if (_authToken == null) {
      _isLoggedIn = false;
      _currentUser = null;
      _authToken = null;
      return {
        'success': true,
        'message': 'Logged out successfully',
      };
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_authToken',
        },
        body: jsonEncode({
          'query': '''
            mutation Logout {
              logout {
                message
              }
            }
          ''',
        }),
      );

      // Clear local state regardless of API response
      _isLoggedIn = false;
      _currentUser = null;
      _authToken = null;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'message': data['data']?['logout']?['message'] ?? 'Logged out successfully',
        };
      } else {
        return {
          'success': true,
          'message': 'Logged out successfully',
        };
      }
    } catch (e) {
      // Even if API call fails, clear local state
      _isLoggedIn = false;
      _currentUser = null;
      _authToken = null;

      return {
        'success': true,
        'message': 'Logged out successfully',
      };
    }
  }

  static void checkAuthStatus() {
    // In a real app, you would check if the user has a valid token
    // and validate it with the backend
    // For now, we'll just keep the current state
  }
}
