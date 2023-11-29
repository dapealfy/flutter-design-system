import 'package:catalog/catalog_entries.dart';
import 'package:catalog/core/story_builder.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: buildStory(entries),
      initialStory: 'Home',
      plugins: [
        ThemeModePlugin(initialTheme: ThemeMode.light),
        DeviceFramePlugin(),
      ],
    );
  }
}
