import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunDsModal extends StatelessWidget {
  /// Max 1 line
  final String heading;
  final String image;

  /// Max 2 lines
  final String title;

  /// Max 3 lines
  final String description;
  final FunDsGroupButton buttons;

  const FunDsModal({
    super.key,
    required this.heading,
    required this.image,
    required this.title,
    required this.description,
    required this.buttons,
  }) : super();

  static void show({
    Key? key,
    required BuildContext context,
    required String heading,
    required String title,
    required String desc,
    required String image,
    required FunDsGroupButton groupButton,
    bool isDismissible = false,
    double barrierOpacity = 0.8,
  }) {
    showDialog(
      context: context,
      barrierColor: FunDsColors.colorNeutral900.withOpacity(barrierOpacity),
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return FunDsModal(
          key: key,
          heading: heading,
          title: title,
          description: desc,
          image: image,
          buttons: groupButton,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: FunDsColors.colorWhite,
      surfaceTintColor: FunDsColors.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.5, horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: FunDsTypography.heading16,
                  maxLines: 1,
                ),
                GestureDetector(
                  key: const Key('btn-cross-close'),
                  onTap: () => Navigator.of(context).pop(),
                  child: FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCrossNude,
                    size: 24.w,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: FunDsColors.colorNeutral200,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: getContent(context),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: buttons,
          )
        ],
      ),
    );
  }

  Widget getContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: getImageWidget(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: FunDsTypography.heading16.copyWith(
                color: FunDsColors.colorNeutral900,
                height: 0,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.left,
            style: FunDsTypography.body14.copyWith(
              color: FunDsColors.colorNeutral600,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget getImageWidget() {
    if (image.isEmpty) {
      return const SizedBox();
    } else if (image.contains('.svg')) {
      return SvgPicture.asset(image);
    } else if (Uri.parse(image).isAbsolute) {
      return Image.network(
        image,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) return child;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const SizedBox.shrink();
        },
      );
    } else {
      return Image.asset(image);
    }
  }
}
