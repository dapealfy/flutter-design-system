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
    return Storybook(
      initialStory: 'Home',
      stories: buildStory(entries),
      wrapperBuilder: (context, child) {
        return FutureBuilder(
          future: ScreenUtil.ensureScreenSizeAndInit(
            context,
            minTextAdapt: true,
            designSize: const Size(360, 640),
            splitScreenMode: false,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                debugShowCheckedModeBanner: false,
                home: Scaffold(body: Center(child: child)),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
      plugins: [
        ThemeModePlugin(initialTheme: ThemeMode.light),
        DeviceFramePlugin(),
      ],
    );
  }
}
