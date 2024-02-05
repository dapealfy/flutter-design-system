import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunDsBottomSheet extends StatelessWidget {
  final String image;
  final String title; //Max 1 line
  final String desc; //Max 2 line
  final FunDsBottomSheetType type;
  final FunDsGroupButton buttons;

  const FunDsBottomSheet({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    required this.type,
    required this.buttons,
  }) : super(key: key);

  static void showBottomSheet({
    Key? key,
    required BuildContext context,
    required String title,
    required String desc,
    required String image,
    required FunDsBottomSheetType type,
    required FunDsGroupButton groupButton,
    double? barrierOpacity,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      barrierColor:
          FunDsColors.colorNeutral900.withOpacity(barrierOpacity ?? 0.8),
      backgroundColor: FunDsColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      builder: (BuildContext context) {
        return FunDsBottomSheet(
          key: key,
          title: title,
          desc: desc,
          image: image,
          type: type,
          buttons: groupButton,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: FunDsColors.colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Wrap(
        key: key,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Center(
                  child: Container(
                    width: 30.w,
                    height: 4.h,
                    decoration: ShapeDecoration(
                      color: FunDsColors.colorNeutral200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1160.r),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCrossNude,
                    size: 24.w,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: getBody(context),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 24,
                ),
                child: buttons,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getBody(BuildContext context) {
    if (type == FunDsBottomSheetType.smallImage) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SizedBox(
                width: 130.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: getImageWidget()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: FunDsTypography.heading20
                    .copyWith(color: FunDsColors.colorNeutral900, height: 0),
              ),
            ),
            Text(
              desc,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: FunDsTypography.body14.copyWith(
                  color: FunDsColors.colorNeutral600,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    } else if (type == FunDsBottomSheetType.bottomImage) {
      return Column(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: FunDsTypography.heading20.copyWith(
                        color: FunDsColors.colorNeutral900, height: 0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  desc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: FunDsTypography.body14.copyWith(
                      color: FunDsColors.colorNeutral600,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: getImageWidget()),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: getImageWidget()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: FunDsTypography.heading20.copyWith(
                        color: FunDsColors.colorNeutral900, height: 0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  desc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: FunDsTypography.body14.copyWith(
                      color: FunDsColors.colorNeutral600,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget getImageWidget() {
    if (image.isEmpty) {
      return const SizedBox();
    } else if (image.contains('.svg')) {
      return SvgPicture.asset(image);
    } else if (Uri.parse(image).isAbsolute) {
      return Image.network(
        image,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
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

enum FunDsBottomSheetType { common, bottomImage, smallImage }
