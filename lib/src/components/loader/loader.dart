import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/assets/lottie.dart';
import 'package:lottie/lottie.dart';

class FunDsLoader extends StatelessWidget {
  const FunDsLoader({
    super.key,
    required this.width,
    required this.height,
    this.desc,
    required this.variant,
    required this.position,
  });

  final double width;
  final double height;
  final FunDsLoaderPosition position;
  final FunDsLoaderVariant variant;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    switch (position) {
      case FunDsLoaderPosition.top:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getLottie(),
            if (desc != null)
              Text(
                textAlign: TextAlign.center,
                desc!,
                style: FunDsTypography.body14
                    .copyWith(color: FunDsColors.colorNeutral600),
              )
          ],
        );
      case FunDsLoaderPosition.bottom:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (desc != null)
              Text(
                textAlign: TextAlign.center,
                desc!,
                style: FunDsTypography.body14
                    .copyWith(color: FunDsColors.colorNeutral600),
              ),
            _getLottie(),
          ],
        );
      case FunDsLoaderPosition.left:
        return Row(
          children: [
            _getLottie(),
            if (desc != null)
              Flexible(
                child: Text(
                  desc!,
                  style: FunDsTypography.body14
                      .copyWith(color: FunDsColors.colorNeutral600),
                ),
              )
          ],
        );
      case FunDsLoaderPosition.right:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (desc != null)
              Flexible(
                child: Text(
                  desc!,
                  style: FunDsTypography.body14
                      .copyWith(color: FunDsColors.colorNeutral600),
                ),
              ),
            _getLottie(),
          ],
        );
    }
  }

  Widget _getLottie() {
    switch (variant) {
      case FunDsLoaderVariant.spinner:
        return SizedBox(
          height: height,
          width: width,
          child: Lottie.asset(
            FunDsLottie.spinner,
            fit: BoxFit.fitWidth,
            decoder: customDecoder,
          ),
        );
      case FunDsLoaderVariant.dot:
        return SizedBox(
          height: height,
          width: width,
          child: Lottie.asset(
            FunDsLottie.dot,
            decoder: customDecoder,
          ),
        );
    }
  }

  Future<LottieComposition?> customDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.firstWhere(
        (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'),
      );
    });
  }
}

enum FunDsLoaderPosition { top, bottom, left, right }

enum FunDsLoaderVariant { spinner, dot }
