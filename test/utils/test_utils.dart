import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
