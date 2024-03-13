import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/utils/shimmer.dart';

enum FunDsSkeletonType { list, list2, card, card2, card3, banner, banner2 }

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
      firstChild: firstChild(),
      secondChild: widget.child,
      crossFadeState: widget.isLoading
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 150),
    );
  }

  Widget firstChild() {
    switch (widget.type) {
      case FunDsSkeletonType.list:
      case FunDsSkeletonType.list2:
        return _buildList(widget.type);
      case FunDsSkeletonType.card:
        return Placeholder();
      case FunDsSkeletonType.card2:
        return Placeholder();
      case FunDsSkeletonType.card3:
        return Placeholder();
      case FunDsSkeletonType.banner:
        return Placeholder();
      case FunDsSkeletonType.banner2:
        return Placeholder();
    }
  }

  Widget _buildList(FunDsSkeletonType type) {
    return Shimmer(
      isLoading: true,
      child: Row(
        children: [
          Visibility(
            child: Container(
              height: 48,
              color: Colors.blue,
              width: 48,
            ),
            visible: type == FunDsSkeletonType.list2,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                SizedBox(height: 12),
                Container(height: 12, width: double.infinity, color: Colors.blue),
                SizedBox(height: 12),
                Visibility(
                  child: Container(
                    height: 12,
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.65,
                  ),
                  visible: type == FunDsSkeletonType.list,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
