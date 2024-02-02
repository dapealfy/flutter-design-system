import 'dart:ui';

import 'package:catalog/catalog_entries.dart';
import 'package:catalog/core/auth_page.dart';
import 'package:catalog/core/story_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showPanel = true;
  double _x = 88.0;
  double _y = 88.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AuthPage(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Storybook(
                initialStory: 'Home',
                stories: buildStory(entries),
                showPanel: _showPanel,
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
                        themeMode: ThemeMode.light,
                        scrollBehavior: const MaterialScrollBehavior().copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.trackpad,
                          },
                        ),
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
              Positioned(
                left: screenSize.width - _x,
                top: screenSize.height - _y,
                child: Draggable(
                    feedback: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _showPanel = !_showPanel;
                        });
                      },
                      child: (_showPanel)
                          ? const FunDsIcon(
                              funDsIconography:
                                  FunDsIconography.actionIcEyeOpen,
                              size: 24,
                            )
                          : const FunDsIcon(
                              funDsIconography:
                                  FunDsIconography.actionIcEyeClose,
                              size: 24,
                            ),
                    ),
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: FunDsColors.colorNeutral200,
                      onPressed: () {
                        setState(() {
                          _showPanel = !_showPanel;
                        });
                      },
                      child: (_showPanel)
                          ? const FunDsIcon(
                              funDsIconography:
                                  FunDsIconography.actionIcEyeOpen,
                              size: 24,
                            )
                          : const FunDsIcon(
                              funDsIconography:
                                  FunDsIconography.actionIcEyeClose,
                              size: 24,
                            ),
                    ),
                    onDraggableCanceled: (Velocity velocity, Offset offset) {
                      setState(() {
                        _x = screenSize.width - offset.dx;
                        _y = screenSize.height -  offset.dy;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
