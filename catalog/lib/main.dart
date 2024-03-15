import 'dart:ui';

import 'package:catalog/catalog_entries.dart';
import 'package:catalog/core/auth_page.dart';
import 'package:catalog/core/story_builder.dart';
import 'package:catalog/core/storybook/fun_ds_storybook.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
  double _x = 70.0;
  double _y = 120.0;

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
    final screenSize = MediaQuery.of(context).size;

    return AuthPage(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            FunDsStorybook(
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
                        resizeToAvoidBottomInset: false,
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
            if (_showPanel && _appVersion != null)
              Positioned(
                bottom: 15,
                right: 10,
                child: Text(
                  'FunDs ${_appVersion!}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            Positioned(
              left: screenSize.width - _x,
              top: screenSize.height - _y,
              child: Draggable(
                feedback: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: FunDsColors.colorNeutral200,
                  onPressed: () {
                    setState(() {
                      _showPanel = !_showPanel;
                    });
                  },
                  child: (_showPanel)
                      ? const FunDsIcon(
                          funDsIconography: FunDsIconography.actionIcEyeOpen,
                          size: 24,
                        )
                      : const FunDsIcon(
                          funDsIconography: FunDsIconography.actionIcEyeClose,
                          size: 24,
                        ),
                ),
                childWhenDragging: const SizedBox.shrink(),
                onDragUpdate: (details) {
                  setState(() {
                    _x = screenSize.width - details.globalPosition.dx;
                    _y = screenSize.height - details.globalPosition.dy;
                  });
                },
                onDragEnd: (details) {
                  setState(() {
                    _x = screenSize.width - details.offset.dx;
                    _y = screenSize.height - details.offset.dy;
                  });
                },
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
                          funDsIconography: FunDsIconography.actionIcEyeOpen,
                          size: 24,
                        )
                      : const FunDsIcon(
                          funDsIconography: FunDsIconography.actionIcEyeClose,
                          size: 24,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
