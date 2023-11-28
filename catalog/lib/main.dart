import 'package:catalog/catalog_entries.dart';
import 'package:catalog/core/story_builder.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 640),
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (ctx, child) {
          return Storybook(
            initialStory: 'Home',
            stories: buildStory(entries),
          );
        });
  }
}
