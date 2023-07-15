import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:monkey_app_demo/core/models/login.dart';
import 'package:monkey_app_demo/core/storage_state.dart';

class AuthenticationHandler {
  Future<LoginResponse> login(LoginRequest req) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.75:8080/api/auth/login/password'),
      body: jsonEncode({
        'username': req.email,
        'password': req.password,
      }),
      headers: {
        "Content-Type": 'application/json'
      }
    );
    var body = LoginResponse.fromJson(jsonDecode(response.body));
    return body;
  }
}

final authenticationHandlerProvider = StateProvider<AuthenticationHandler>(
  (_) => AuthenticationHandler(),
);

final authLoginProvider = FutureProvider.family<LoginResponse, LoginRequest>(
  (ref, res) async {
    return Future.delayed(const Duration(seconds: 0), () async {
      final authResponse = await ref.watch(authenticationHandlerProvider).login(res);
      // final isAuthenticated = authResponse.statusCode == 200;
      // if (isAuthenticated) {
      //   ref.read(setAuthStateProvider.notifier).state = authResponse;
      //   ref.read(setIsAuthenticatedProvider(isAuthenticated));
      //   ref.read(setAuthenticatedUserProvider(authResponse.authValues.email));
      // } else {
      //   ref.read(authErrorMessageProvider.notifier).state =
      //       'Error occurred while login with code: ${authResponse.statusCode}';
      // }

      return authResponse;
    });
  },
);

final authErrorMessageProvider = StateProvider<String>(
  (ref) => '',
);
