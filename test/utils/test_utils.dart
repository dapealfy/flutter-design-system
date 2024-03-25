import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

class _Wrapper extends StatelessWidget {
  final Widget child;
  const _Wrapper(this.child);

  @override
  Widget build(BuildContext context) {
    // Init screen utils
    ScreenUtil.init(
      context,
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: false,
    );

    return child;
  }
}

Widget buildTestableWidget({
  required Widget child,
}) {
  return MaterialApp(
    home: Scaffold(body: _Wrapper(child)),
  );
}

void testOnPixel7ProScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(1440, 3036);
  tester.view.devicePixelRatio = 3.5;
  tester.view.platformDispatcher.textScaleFactorTestValue = 1.0;

  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
    tester.view.platformDispatcher.clearTextScaleFactorTestValue();
  });
}
