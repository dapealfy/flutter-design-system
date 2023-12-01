import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
    required this.title,
    this.description,
    this.disableScrollview = false,
    required this.child,
  });

  final String title;
  final String? description;
  final bool disableScrollview;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            const SizedBox(height: 32),
            Expanded(
              child: disableScrollview
                  ? child
                  : SingleChildScrollView(child: child),
            ),
          ],
        ),
      ),
    );
  }
}
