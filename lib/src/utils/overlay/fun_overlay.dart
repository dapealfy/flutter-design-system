import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/overlay/arrow_painter.dart';
import 'package:flutter_design_system/src/utils/overlay/rrect_clipper.dart';

enum OverlayPosition {
  top,
  bottom,
  auto,
}

class FunOverlay extends StatefulWidget {
  const FunOverlay({
    super.key,
    required this.child,
    required this.controller,
    required this.overlayWidget,
    required this.overlayWidth,
    this.overlayPosition = OverlayPosition.auto,
    this.overlaySpace = 16,
    this.showArrow = false,
    this.arrowSize = const Size(12, 6),
    this.arrowColor = Colors.black,
    this.focusPadding = EdgeInsets.zero,
    this.focusRadius = 8,
    this.onOverlayTap,
    this.ignoreChildPointer = true,
  });

  /// The widget that will be wrapped with overlay
  final Widget child;

  /// The controller for the overlay
  final FunOverlayController controller;

  /// The widget that will be shown as overlay
  final Widget overlayWidget;

  /// The width of the overlay
  final double overlayWidth;

  /// The position of the overlay
  final OverlayPosition overlayPosition;

  /// The space between the overlay and the child
  final double overlaySpace;

  /// Whether to show the arrow
  final bool showArrow;

  /// The size of the arrow
  final Size arrowSize;

  /// The color of the arrow
  final Color arrowColor;

  /// The space of the focus area
  final EdgeInsets focusPadding;

  /// Radius of child focus
  final double focusRadius;

  /// The callback when the overlay is tapped
  final VoidCallback? onOverlayTap;

  /// Ignore child gesture and pointer when overlay is shown
  final bool ignoreChildPointer;

  @override
  State<FunOverlay> createState() => _FunOverlayState();
}

class _FunOverlayState extends State<FunOverlay>
    implements FunOverlayInteractor {
  final GlobalKey _childKey = GlobalKey();
  final GlobalKey _overlayKey = GlobalKey();
  final OverlayPortalController _portalController = OverlayPortalController();

  Size? _renderedOverlaySize;
  bool _showLoading = false;
  bool _isShown = false;
  bool _showInProgress = false;

  @override
  void initState() {
    super.initState();
    widget.controller.attach(this);
  }

  @override
  void dispose() {
    widget.controller.detach();
    super.dispose();
  }

  @override
  void onShow() async {
    if (_showInProgress) return;

    _showInProgress = true;

    setState(() {
      _isShown = true;
      _showLoading = true;
    });

    _portalController.show();

    try {
      await Scrollable.ensureVisible(
        _childKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        alignment: 0.5,
      );

      setState(() {
        _showLoading = false;
      });
    } catch (e) {
      setState(() {
        _showLoading = false;
      });

      _portalController.hide();
    }

    _showInProgress = false;
  }

  @override
  void onHide() {
    setState(() {
      _isShown = false;
    });
    _portalController.hide();
  }

  @override
  void onToggle() {
    if (_portalController.isShowing) {
      onHide();
    } else {
      onShow();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final overlay = Overlay.of(context);

    return OverlayPortal(
      controller: _portalController,
      overlayChildBuilder: (context) {
        final renderBox =
            _childKey.currentContext?.findRenderObject() as RenderBox;

        final childOffset = renderBox.localToGlobal(
          Offset.zero,
          ancestor: overlay.context.findRenderObject(),
        );
        final childSize = renderBox.size;
        final childCenter =
            childOffset.translate(childSize.width / 2, childSize.height / 2);

        final isTop = widget.overlayPosition == OverlayPosition.top ||
            (widget.overlayPosition == OverlayPosition.auto &&
                childCenter.dy > screenSize.height / 2);

        // Get overlay size
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          final overlayRenderBox =
              _overlayKey.currentContext?.findRenderObject() as RenderBox;

          if (overlayRenderBox.size == _renderedOverlaySize) return;

          setState(() {
            _renderedOverlaySize = overlayRenderBox.size;
          });
        });

        var overlayXPos = childCenter.dx - widget.overlayWidth / 2;

        // Make sure not to overflow screen
        if (overlayXPos < 0) {
          overlayXPos = 0;
        } else if (overlayXPos + widget.overlayWidth > screenSize.width) {
          overlayXPos = screenSize.width - widget.overlayWidth;
        }

        final overlaySpace = isTop
            ? widget.overlaySpace + widget.focusPadding.top
            : widget.overlaySpace + widget.focusPadding.bottom;

        final overlayYPos = isTop
            ? childOffset.dy -
                overlaySpace -
                (_renderedOverlaySize?.height ?? 0)
            : childOffset.dy + childSize.height + overlaySpace;

        final tooltipOffset = Offset(
          overlayXPos,
          overlayYPos,
        );

        // Arrow positioning
        // Wait until tooltip size is available
        final arrowOffset = Offset(
          childCenter.dx - widget.arrowSize.width / 2,
          isTop
              ? tooltipOffset.dy + (_renderedOverlaySize?.height ?? 0)
              : tooltipOffset.dy - widget.arrowSize.height,
        );

        if (_showLoading) {
          return Container(
            decoration: const BoxDecoration(
              color: FunDsColors.colorOverlay,
            ),
            child: const Center(
              child: SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () => widget.onOverlayTap?.call(),
          child: ClipPath(
            clipper: RRectClipper(
              radius: BorderRadius.circular(widget.focusRadius),
              area: Rect.fromLTRB(
                childOffset.dx - widget.focusPadding.left,
                childOffset.dy - widget.focusPadding.top,
                (childOffset.dx + childSize.width) + widget.focusPadding.right,
                (childOffset.dy + childSize.height) +
                    widget.focusPadding.bottom,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: FunDsColors.colorOverlay,
              ),
              child: Stack(
                children: [
                  // Arrow
                  if (_renderedOverlaySize != null && widget.showArrow)
                    Positioned(
                      top: arrowOffset.dy,
                      left: arrowOffset.dx,
                      child: RotatedBox(
                        quarterTurns: isTop ? 0 : 2,
                        child: CustomPaint(
                          size: widget.arrowSize,
                          painter: ArrowPainter(
                            color: widget.arrowColor,
                          ),
                        ),
                      ),
                    ),

                  // Overlay Content
                  Positioned(
                    top: tooltipOffset.dy,
                    left: tooltipOffset.dx,
                    child: SizedBox(
                      key: _overlayKey,
                      width: widget.overlayWidth,
                      child: Offstage(
                        offstage: _renderedOverlaySize == null,
                        child: widget.overlayWidget,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: SizedBox(
        key: _childKey,
        child: IgnorePointer(
          ignoring: widget.ignoreChildPointer && _isShown,
          child: widget.child,
        ),
      ),
    );
  }
}
