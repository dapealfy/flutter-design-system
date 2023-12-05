import 'package:catalog/catalog_entries.dart';
import 'package:catalog/core/auth_page.dart';
import 'package:catalog/core/story_builder.dart';
import 'package:flutter/foundation.dart';
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
    return AuthPage(
      child: Storybook(
        initialStory: 'Home',
        stories: buildStory(entries),
        wrapperBuilder: (context, child) {
          // Bulder is needed to initialize ScreenUtil
          // Otherwise it will get wrong MediaQuery
          return Builder(
            builder: (context) {
              ScreenUtil.init(
                context,
                minTextAdapt: true,
                designSize: const Size(360, 640),
                splitScreenMode: false,
              );

              return MaterialApp(
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: Center(
                    child: child,
                  ),
                ),
              );
            },
          );
        },
        plugins: [
          ThemeModePlugin(initialTheme: ThemeMode.light),
          kIsWeb
              ? DeviceFramePlugin(
                  initialData: (
                    isFrameVisible: true,
                    device: Devices.android.samsungGalaxyS20,
                    orientation: Orientation.portrait,
                  ),
                )
              : DeviceFramePlugin(),
        ],
      ),
    );
  }
}
