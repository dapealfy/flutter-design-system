import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const String _password =
      '90983a77eb47a739452139e9cfc87cfff5692b262bee4e222a35d743e3ec15c9';

  bool authenticated = false;
  bool showPassword = false;
  bool wrongPassword = false;

  final passwordController = TextEditingController();

  void checkPassword(String value) {
    final passwordHash = sha256.convert(utf8.encode(value)).toString();
    if (passwordHash == _password) {
      setState(() {
        authenticated = true;
      });
    } else {
      setState(() {
        wrongPassword = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (authenticated || !kIsWeb) {
      return widget.child;
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(const Size(500, 200)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          errorText: wrongPassword ? 'Wrong password' : null,
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                        ),
                        obscureText: !showPassword,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: passwordController,
                        onSubmitted: (value) {
                          checkPassword(value);
                        },
                        onChanged: (value) {
                          if (wrongPassword) {
                            setState(() {
                              wrongPassword = false;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    FloatingActionButton.extended(
                      onPressed: () {
                        checkPassword(passwordController.text);
                      },
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Enter'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
