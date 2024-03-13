import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsProgressIndicator extends StatelessWidget {
  final List<FunDsProgressIndicatorData> data;
  final FunDsProgressIndicatorType type;
  const FunDsProgressIndicator({
    super.key,
    required this.data,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return type == FunDsProgressIndicatorType.horizontal
        ? _generateHorizontalProgressIndicator(data, type)
        : _generateVerticalProgressIndicator(data, type);
  }
}

Widget _generateVerticalProgressIndicator(
    List<FunDsProgressIndicatorData> data, FunDsProgressIndicatorType type) {
  return ListView.builder(
    itemCount: data.length,
    shrinkWrap: true,
    key: const Key('progressIndicatorVertical'),
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemBuilder: (ctx, index) {
      var item = data[index];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                key: Key('dot-$index'),
                height: 10.r,
                width: 10.r,
                margin: EdgeInsets.symmetric(vertical: 5.r),
                decoration: BoxDecoration(
                  color: _getIndicatorColor(
                    item.state,
                    type,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                item.label,
                key: Key('label-$index'),
                style: FunDsTypography.body14,
              ),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: 4.5.w,
                ),
                if (item != data.last)
                  Container(
                    color: item.state == FunDsProgressIndicatorState.complete ||
                            item.state == FunDsProgressIndicatorState.active
                        ? FunDsColors.colorPrimary
                        : FunDsColors.colorNeutral400,
                    key: Key('separator-$index'),
                    width: 1.w,
                  ),
                SizedBox(
                  width: 13.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0.h),
                  child: Text(
                    item.description ?? '',
                    key: Key('description-$index'),
                    style: FunDsTypography.body12
                        .copyWith(color: FunDsColors.colorNeutral500),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget _generateHorizontalProgressIndicator(
    List<FunDsProgressIndicatorData> data, FunDsProgressIndicatorType type) {
  return SizedBox(
    width: double.infinity,
    height: 30.h,
    child: ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      key: const Key('progressIndicatorHorizontal'),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        var item = data[index];
        return Row(
          children: [
            Container(
                key: Key('dot-$index'),
                padding: EdgeInsets.all(
                    item.state == FunDsProgressIndicatorState.complete ||
                            item.state == FunDsProgressIndicatorState.error
                        ? 6.r
                        : 8.r),
                decoration: BoxDecoration(
                  color: _getIndicatorColor(
                    item.state,
                    type,
                  ),
                  shape: BoxShape.circle,
                  border: item.state == FunDsProgressIndicatorState.incomplete
                      ? Border.all(
                          color: FunDsColors.colorNeutral400,
                          width: 1.5,
                        )
                      : null,
                ),
                child: item.state == FunDsProgressIndicatorState.complete
                    ? Icon(
                        Icons.check,
                        size: 12.sp,
                        color: FunDsColors.colorWhite,
                      )
                    : item.state == FunDsProgressIndicatorState.error
                        ? Icon(
                            Icons.close,
                            size: 12.sp,
                            color: FunDsColors.colorWhite,
                          )
                        : Text(
                            (index + 1).toString(),
                            style: FunDsTypography.body12.copyWith(
                              color: item.state ==
                                      FunDsProgressIndicatorState.incomplete
                                  ? FunDsColors.colorBlack
                                  : FunDsColors.colorWhite,
                            ),
                          )),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Text(
                item.label,
                key: Key('label-$index'),
                style: FunDsTypography.body14,
              ),
            ),
            if (item != data.last)
              Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Container(
                  color: item.state == FunDsProgressIndicatorState.complete ||
                          item.state == FunDsProgressIndicatorState.active
                      ? FunDsColors.colorPrimary
                      : FunDsColors.colorNeutral400,
                  width: 50.w,
                  height: 1,
                  key: Key('separator-$index'),
                ),
              ),
          ],
        );
      },
    ),
  );
}

Color _getIndicatorColor(
    FunDsProgressIndicatorState state, FunDsProgressIndicatorType type) {
  switch (state) {
    case FunDsProgressIndicatorState.active:
      return FunDsColors.colorPrimary;
    case FunDsProgressIndicatorState.complete:
      return FunDsColors.colorGreen500;
    case FunDsProgressIndicatorState.incomplete:
      return type == FunDsProgressIndicatorType.horizontal
          ? FunDsColors.colorWhite
          : FunDsColors.colorNeutral500;
    case FunDsProgressIndicatorState.error:
      return FunDsColors.colorRed500;
  }
}

class FunDsProgressIndicatorData {
  final String label;
  final String? description;
  final FunDsProgressIndicatorState state;
  FunDsProgressIndicatorData(
      {required this.label, this.description, required this.state});
}

enum FunDsProgressIndicatorState {
  complete,
  active,
  incomplete,
  error,
}

enum FunDsProgressIndicatorType {
  horizontal,
  vertical,
}
