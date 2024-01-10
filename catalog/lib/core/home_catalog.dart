import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class HomeCatalog extends StatelessWidget {
  const HomeCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Text('Welcome to the Design System Catalog');
    }

    return const ContentsPlugin().panelBuilder?.call(context) ??
        const SizedBox();
  }
}
