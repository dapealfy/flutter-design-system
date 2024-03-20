import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FunDsSkeletonType { list, list2, card, card2, card3, banner, banner2 }

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFF2F3F5),
    Color(0xFFE3E5EA),
    Color(0xFFF2F3F5),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class FunDsSkeleton extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final FunDsSkeletonType type;

  const FunDsSkeleton({
    super.key,
    required this.child,
    required this.isLoading,
    required this.type,
  });

  @override
  State<FunDsSkeleton> createState() => _FunDsSkeletonState();
}

class _FunDsSkeletonState extends State<FunDsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Shimmer(
        child: firstChild(),
        linearGradient: _shimmerGradient,
      ),
      secondChild: Offstage(child: widget.child, offstage: widget.isLoading),
      crossFadeState: widget.isLoading
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 100),
    );
  }

  Widget firstChild() {
    switch (widget.type) {
      case FunDsSkeletonType.list:
      case FunDsSkeletonType.list2:
        return _buildList();
      case FunDsSkeletonType.card:
      case FunDsSkeletonType.card2:
      case FunDsSkeletonType.card3:
        return _buildCard();
      case FunDsSkeletonType.banner:
      case FunDsSkeletonType.banner2:
        return _buildBanner();
    }
  }

  Widget _buildBanner() {
    return ShimmerLoading(
      isLoading: widget.isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLine(
            width: double.infinity,
            height: 180,
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          if (widget.type == FunDsSkeletonType.banner2) ...[
            const SizedBox(height: 16),
            _buildLine(width: double.infinity, height: 12),
            const SizedBox(height: 12),
            FractionallySizedBox(
              widthFactor: 0.625,
              child: _buildLine(width: double.infinity, height: 12),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FunDsColors.colorNeutral50,
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
      ),
      child: ShimmerLoading(
        isLoading: widget.isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildLine(
                      width: 40,
                      height: 40,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.r),
                      ),
                    ),
                  ),
                  visible: widget.type != FunDsSkeletonType.card3,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLine(width: double.infinity, height: 10),
                      const SizedBox(height: 12),
                      FractionallySizedBox(
                        widthFactor: 0.73,
                        child: _buildLine(
                          width: double.infinity,
                          height: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: _buildLine(
                      width: 45,
                      height: 14,
                    ),
                  ),
                  visible: widget.type == FunDsSkeletonType.card,
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: _buildLine(
                      width: 48,
                      height: 48,
                    ),
                  ),
                  visible: widget.type == FunDsSkeletonType.card3,
                )
              ],
            ),
            Visibility(
              child: Padding(
                padding: const EdgeInsets.only(left: 52, top: 16),
                child: _buildLine(
                  width: 80,
                  height: 24,
                ),
              ),
              visible: widget.type == FunDsSkeletonType.card2,
            ),
            Visibility(
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 94,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLine(width: double.infinity, height: 10),
                          const SizedBox(height: 8),
                          FractionallySizedBox(
                            widthFactor: 0.73,
                            child: _buildLine(
                              width: double.infinity,
                              height: 8,
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildLine(
                      width: 80,
                      height: 24,
                    ),
                  ],
                ),
              ),
              visible: widget.type == FunDsSkeletonType.card3,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return ShimmerLoading(
      isLoading: widget.isLoading,
      child: Row(
        children: [
          Visibility(
            child: _buildLine(
              height: 48,
              width: 48,
              margin: const EdgeInsets.only(right: 16),
            ),
            visible: widget.type == FunDsSkeletonType.list2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLine(height: 12, width: double.infinity),
                const SizedBox(height: 12),
                _buildLine(height: 12, width: double.infinity),
                const SizedBox(height: 12),
                Visibility(
                  child: _buildLine(
                    height: 12,
                    width: MediaQuery.of(context).size.width * 0.65,
                  ),
                  visible: widget.type == FunDsSkeletonType.list,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine({
    required double width,
    required double height,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
  }) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(8.r)),
        color: Colors.white, // needed
      ),
      height: height,
      width: width,
    );
  }
}
