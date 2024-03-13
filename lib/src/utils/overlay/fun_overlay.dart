import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/overlay/arrow_painter.dart';
import 'package:flutter_design_system/src/utils/overlay/rrect_clipper.dart';

enum FunDsOverlayPosition {
  /// Show on top of the child
  top,

  /// Show on bottom of the child
  bottom,

  // Auto detect based on available space
  auto,

  // Prefer show on top of the child, but can go bottom if not enough space
  preferTop,

  // Prefer show on bottom of the child, but can go top if not enough space
  preferBottom,
}

class FunDsOverlay extends StatefulWidget {
  const FunDsOverlay({
    super.key,
    required this.child,
    required this.controller,
    required this.overlayWidget,
    required this.overlayWidth,
    this.overlayPosition = FunDsOverlayPosition.auto,
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
  final FunDsOverlayController controller;

  /// The widget that will be shown as overlay
  final Widget overlayWidget;

  /// The width of the overlay
  final double overlayWidth;

  /// The position of the overlay
  final FunDsOverlayPosition overlayPosition;

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
  State<FunDsOverlay> createState() => _FunDsOverlayState();
}

class _FunDsOverlayState extends State<FunDsOverlay>
    implements FunDsOverlayInteractor {
  final GlobalKey _childKey = GlobalKey();
  final GlobalKey _overlayKey = GlobalKey();
  final OverlayPortalController _portalController = OverlayPortalController();

  Size? _renderedOverlaySize;
  bool _showingInProgress = false;
  bool _isLoading = false;
  bool _isShown = false;

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
    if (_showingInProgress) return;

    _showingInProgress = true;

    setState(() {
      _isShown = true;
      _isLoading = true;
    });

    _portalController.show();

    try {
      // Scroll child to center of scroallable area
      await Scrollable.ensureVisible(
        _childKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        alignment: 0.5,
      );
    } catch (e) {
      _portalController.hide();
    } finally {
      setState(() {
        _isLoading = false;
      });
      _showingInProgress = false;
    }
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
        if (_isLoading) {
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

        // Get overlay size on next frame
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          final overlayRenderBox =
              _overlayKey.currentContext?.findRenderObject() as RenderBox?;

          if (overlayRenderBox?.size == _renderedOverlaySize) return;

          setState(() {
            _renderedOverlaySize = overlayRenderBox?.size;
          });
        });

        // Get child size info
        final childRenderBox =
            _childKey.currentContext?.findRenderObject() as RenderBox;
        final childOffset = childRenderBox.localToGlobal(
          Offset.zero,
          ancestor: overlay.context.findRenderObject(),
        );
        final childSize = childRenderBox.size;
        final childCenter =
            childOffset.translate(childSize.width / 2, childSize.height / 2);

        // Define overlay position, can use [_renderedOverlaySize] to get the
        // overlay size.
        var isTop = widget.overlayPosition == FunDsOverlayPosition.top;

        if (widget.overlayPosition == FunDsOverlayPosition.auto) {
          isTop = childCenter.dy > screenSize.height / 2;
        }

        if (widget.overlayPosition == FunDsOverlayPosition.preferTop) {
          final space = widget.overlaySpace + widget.focusPadding.top;
          isTop =
              childOffset.dy - space - (_renderedOverlaySize?.height ?? 0) > 0;
        }

        if (widget.overlayPosition == FunDsOverlayPosition.preferBottom) {
          // Set isTop when overlay exceed screen height
          final space = widget.overlaySpace + widget.focusPadding.bottom;
          isTop = childOffset.dy +
                  childSize.height +
                  space +
                  (_renderedOverlaySize?.height ?? 0) >
              screenSize.height;
        }

        final overlaySpace = isTop
            ? widget.overlaySpace + widget.focusPadding.top
            : widget.overlaySpace + widget.focusPadding.bottom;

        // Make sure x pos not to overflow the screen
        var overlayXPos = childCenter.dx - (widget.overlayWidth / 2);
        if (overlayXPos < 0) {
          overlayXPos = 0;
        } else if (overlayXPos + widget.overlayWidth > screenSize.width) {
          overlayXPos = screenSize.width - widget.overlayWidth;
        }

        final overlayYPos = isTop
            ? childOffset.dy -
                (_renderedOverlaySize?.height ?? 0) -
                overlaySpace
            : childOffset.dy + childSize.height + overlaySpace;

        final overlayOffset = Offset(
          overlayXPos,
          overlayYPos,
        );

        // Arrow positioning
        final arrowOffset = Offset(
          childCenter.dx - widget.arrowSize.width / 2,
          isTop
              ? overlayOffset.dy + (_renderedOverlaySize?.height ?? 0)
              : overlayOffset.dy - widget.arrowSize.height,
        );

        final targetClipArea = Rect.fromLTRB(
          childOffset.dx - widget.focusPadding.left,
          childOffset.dy - widget.focusPadding.top,
          (childOffset.dx + childSize.width) + widget.focusPadding.right,
          (childOffset.dy + childSize.height) + widget.focusPadding.bottom,
        );

        return GestureDetector(
          onTap: () => widget.onOverlayTap?.call(),
          child: ClipPath(
            clipper: RRectClipper(
              radius: BorderRadius.circular(widget.focusRadius),
              area: targetClipArea,
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
                    top: overlayOffset.dy,
                    left: overlayOffset.dx,
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
