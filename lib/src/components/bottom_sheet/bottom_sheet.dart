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
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
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
    return Wrap(
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
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 12.w),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 20.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 12.w,
              ),
              child: getBody(context),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 12.h,
              ),
              child: buttons,
            )
          ],
        ),
      ],
    );
  }

  Widget getBody(BuildContext context) {
    if (type == FunDsBottomSheetType.smallImage) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SizedBox(
                width: 130.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: image.isEmpty
                      ? const SizedBox()
                      : image.contains('.svg')
                          ? SvgPicture.asset(image)
                          : Uri.parse(image).isAbsolute
                              ? Image.network(image)
                              : Image.asset(image),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: FunDsTypography.heading20
                    .copyWith(color: FunDsColors.colorNeutral900),
              ),
            ),
            Text(
              desc,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: FunDsTypography.body14
                  .copyWith(color: FunDsColors.colorNeutral600),
            ),
          ],
        ),
      );
    } else if (type == FunDsBottomSheetType.bottomImage) {
      return Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FunDsTypography.heading20
                      .copyWith(color: FunDsColors.colorNeutral900),
                ),
              ),
              Text(
                desc,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: FunDsTypography.body14
                    .copyWith(color: FunDsColors.colorNeutral600),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child:image.isEmpty
                      ? const SizedBox()
                      : image.contains('.svg')
                      ? SvgPicture.asset(image)
                      : Uri.parse(image).isAbsolute
                          ? Image.network(image)
                          : Image.asset(image),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child:image.isEmpty
                      ? const SizedBox()
                      : image.contains('.svg')
                      ? SvgPicture.asset(image)
                      : Uri.parse(image).isAbsolute
                          ? Image.network(image)
                          : Image.asset(image),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: FunDsTypography.heading20
                      .copyWith(color: FunDsColors.colorNeutral900),
                ),
              ),
              Text(
                desc,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: FunDsTypography.body14
                    .copyWith(color: FunDsColors.colorNeutral600),
              ),
            ],
          ),
        ],
      );
    }
  }
}

enum FunDsBottomSheetType { common, bottomImage, smallImage }
