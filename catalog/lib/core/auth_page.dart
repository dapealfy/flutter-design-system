import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
  final Uint8List _password = Uint8List.fromList([
    96,
    237,
    39,
    120,
    126,
    129,
    250,
    133,
    162,
    166,
    157,
    31,
    52,
    52,
    34,
    232,
    217,
    238,
    119,
    151,
    60,
    242,
    82,
    13,
    240,
    215,
    96,
    118,
    172,
    242,
    232,
    117
  ]);

  static const _hmacKey = <int>[
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
    setState(() {
      final result = validate(value);
      authenticated = result;
      wrongPassword = !result;
    });
  }

  bool validate(String value) {
    // Multiple hash functions to make it harder to brute force (hopefully)
    // NOTE: Client side hashing is not secure and can be tampered,
    // but it's better than nothing
    final hmac = Hmac(sha256, _hmacKey);
    final hmacValue =
        hmac.convert(sha1.convert(utf8.encode(value)).bytes).bytes;
    return _password.toString() == hmacValue.toString();
  }

  String? _appVersion;
  void fetchVersion() {
    PackageInfo.fromPlatform().then((info) {
      setState(() {
        _appVersion = info.version;
      });
    });
  }

  @override
  void initState() {
    fetchVersion();
    super.initState();
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
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/funds_logo.png',
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 54),
                  if (_appVersion != null)
                    Text(
                      _appVersion!,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black54,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      errorText: wrongPassword ? 'Invalid' : null,
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
                  const SizedBox(height: 16),
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
    );
  }
}
