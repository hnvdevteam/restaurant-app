import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:monkey_app_demo/core/storage_state.dart';

class AuthArgs {
  final String email;
  final String password;
  AuthArgs({ this.email,  this.password});
}

class AuthValues {
  AuthValues({
     this.token,
     this.refreshToken,
     this.email,
     this.clientId,
  });
  final String token;
  final String refreshToken;
  final String clientId;
  final String email;

  AuthValues.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        token = json['token'],
        refreshToken = json['refreshToken'],
        clientId = json['clientId'];
}

class AuthResponse {
  AuthResponse({ this.authValues,  this.statusCode});
  final AuthValues authValues;
  final int statusCode;
}

class AuthenticationHandler {
  AuthValues authValues = AuthValues(
    email: '',
    clientId: '',
    refreshToken: '',
    token: '',
  );

  Future<AuthResponse> login(AuthArgs args) async {
    final response = await http.post(
      Uri.http('localhost:4000', '/api/login'),
      body: {
        'email': args.email,
        'password': args.password,
        'token': 'my_token',
      },
    );
    authValues = AuthValues.fromJson(jsonDecode(response.body));
    // return response.statusCode;
    return AuthResponse(
      authValues: authValues,
      statusCode: response.statusCode,
    );
  }
}

final authenticationHandlerProvider = StateProvider<AuthenticationHandler>(
  (_) => AuthenticationHandler(),
);

final authLoginProvider = FutureProvider.family<bool, AuthArgs>(
  (ref, authArgs) async {
    return Future.delayed(const Duration(seconds: 2), () async {
      final authResponse = await ref.watch(authenticationHandlerProvider).login(authArgs);
      final isAuthenticated = authResponse.statusCode == 200;
      if (isAuthenticated) {
        ref.read(setAuthStateProvider.notifier).state = authResponse;
        ref.read(setIsAuthenticatedProvider(isAuthenticated));
        ref.read(setAuthenticatedUserProvider(authResponse.authValues.email));
      } else {
        ref.read(authErrorMessageProvider.notifier).state =
            'Error occurred while login with code: ${authResponse.statusCode}';
      }

      return isAuthenticated;
    });
  },
);

final authErrorMessageProvider = StateProvider<String>(
  (ref) => '',
);