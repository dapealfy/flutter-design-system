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
  // HMAC hash in int to make it harded to reverse
  final Uint8List _password = Uint8List.fromList([
    4,
    203,
    89,
    114,
    47,
    167,
    207,
    29,
    51,
    119,
    9,
    197,
    198,
    195,
    24,
    132,
    245,
    0,
    178,
    146,
    16,
    92,
    69,
    195,
    134,
    23,
    204,
    223,
    182,
    59,
    29,
    246
  ]);

  // Hmac key in int to make it harded to reverse
  static const hmacKey = <int>[
    0x32,
    0x1b,
    0x555,
    0x44,
    0x94,
    0x345,
    0x66,
    0x43,
    0xf2,
    0xc15,
    0x1c1
  ];

  bool authenticated = false;
  bool showPassword = false;
  bool wrongPassword = false;

  final passwordController = TextEditingController();

  void checkPassword(String value) {
    // Multiple function hash to give more security
    final hmac = Hmac(sha256, hmacKey);
    final hmacValue = hmac.convert(sha1.convert(utf8.encode(value)).bytes);
    if (hmacValue.bytes.toString() == _password.toString()) {
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
