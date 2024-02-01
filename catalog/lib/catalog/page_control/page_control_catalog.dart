import 'dart:async';

import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''
Page control have 3 widgets:
- AnimatedPageControl: A Page control that animates when active index changed
- AttachedPageControl: A Page control that is attached to a PageView
- BasicPageControl: A Page control where you manually manage the offset
''';

class PageControlCatalog extends StatefulWidget {
  const PageControlCatalog({super.key});

  @override
  State<PageControlCatalog> createState() => _PageControlCatalogState();
}

class _PageControlCatalogState extends State<PageControlCatalog> {
  int activeIndexLong = 0;
  int activeIndexShort = 0;
  int activeIndexStrip = 0;
  int activeFilledStrip = 0;

  PageController? circleController;
  PageController? circleLongController;
  PageController? stripController;
  PageController? filledStripController;

  @override
  void initState() {
    super.initState();
    circleController = PageController(initialPage: 0);
    circleLongController = PageController(initialPage: 0);
    stripController = PageController(initialPage: 0);
    filledStripController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    circleController?.dispose();
    circleLongController?.dispose();
    stripController?.dispose();
    filledStripController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dotSize = context.knobs.slider(
      label: 'Dot Size',
      initial: 6,
      min: 6,
      max: 24,
    );

    final spacing = context.knobs.slider(
      label: 'Spacing',
      initial: 4,
      min: 4,
      max: 24,
    );

    final stripWidth = context.knobs.slider(
      label: 'Strip Width',
      initial: 18,
      min: 18,
      max: 48,
    );

    final stripHeight = context.knobs.slider(
      label: 'Strip Height',
      initial: 3,
      min: 3,
      max: 12,
    );

    return CatalogPage(
      title: 'Page Control',
      description: _desc,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Without Page View - Manual Active Index',
            style: FunDsTypography.body16B,
          ),
          Text('Widget: AnimatedPageControl', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          const Divider(),
          Text('Circle - 5 dots', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          AnimatedPageControl(
            count: 5,
            activeIndex: activeIndexShort,
            effect: PageControlEffect.circleEffect(
              count: 5,
              dotSize: dotSize.w,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                activeIndexShort = index;
              });
            },
          ),
          const SizedBox(height: 8),
          ControlButton(
            text: 'Active Index: $activeIndexShort',
            onPrev: () {
              setState(() {
                if (activeIndexShort == 0) {
                  activeIndexShort = 4;
                } else {
                  activeIndexShort--;
                }
              });
            },
            onNext: () {
              setState(() {
                if (activeIndexShort == 4) {
                  activeIndexShort = 0;
                } else {
                  activeIndexShort++;
                }
              });
            },
          ),
          const Divider(),
          Text('Circle - 10 dots', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          AnimatedPageControl(
            count: 10,
            activeIndex: activeIndexLong,
            effect: PageControlEffect.circleEffect(
              count: 10,
              dotSize: dotSize.w,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                activeIndexLong = index;
              });
            },
          ),
          const SizedBox(height: 8),
          ControlButton(
            text: 'Active Index: $activeIndexLong',
            onPrev: () {
              setState(() {
                if (activeIndexLong == 0) {
                  activeIndexLong = 9;
                } else {
                  activeIndexLong--;
                }
              });
            },
            onNext: () {
              setState(() {
                if (activeIndexLong == 9) {
                  activeIndexLong = 0;
                } else {
                  activeIndexLong++;
                }
              });
            },
          ),
          const Divider(),
          Text('Strip - 6 item', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          AnimatedPageControl(
            count: 6,
            activeIndex: activeIndexStrip,
            effect: PageControlEffect.stripEffect(
              width: stripWidth.w,
              height: stripHeight.h,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                activeIndexStrip = index;
              });
            },
          ),
          const SizedBox(height: 8),
          ControlButton(
            text: 'Active Index: $activeIndexStrip',
            onPrev: () {
              setState(() {
                if (activeIndexStrip == 0) {
                  activeIndexStrip = 5;
                } else {
                  activeIndexStrip--;
                }
              });
            },
            onNext: () {
              setState(() {
                if (activeIndexStrip == 5) {
                  activeIndexStrip = 0;
                } else {
                  activeIndexStrip++;
                }
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          Text('Filled Strip - 6 item', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          AnimatedPageControl(
            count: 6,
            activeIndex: activeFilledStrip,
            effect: PageControlEffect.filledStripEffect(
              width: stripWidth.w,
              height: stripHeight.h,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                activeFilledStrip = index;
              });
            },
          ),
          const SizedBox(height: 8),
          ControlButton(
            text: 'Active Index: $activeFilledStrip',
            onPrev: () {
              setState(() {
                if (activeFilledStrip == 0) {
                  activeFilledStrip = 5;
                } else {
                  activeFilledStrip--;
                }
              });
            },
            onNext: () {
              setState(() {
                if (activeFilledStrip == 5) {
                  activeFilledStrip = 0;
                } else {
                  activeFilledStrip++;
                }
              });
            },
          ),

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),

          // Page View
          Text('Attached to Page View', style: FunDsTypography.body16B),
          Text('Widget: AttachedPageControl', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          const Divider(),
          Text('Circle - 5 dots', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          SimplePageView(
            controller: circleController!,
            count: 5,
          ),
          AttachedPageControl(
            controller: circleController!,
            count: 5,
            effect: PageControlEffect.circleEffect(
              count: 5,
              dotSize: dotSize.w,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                circleController?.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          Text('Circle - 10 dots', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          SimplePageView(
            controller: circleLongController!,
            count: 10,
          ),
          AttachedPageControl(
            controller: circleLongController!,
            count: 10,
            effect: PageControlEffect.circleEffect(
              count: 10,
              dotSize: dotSize.w,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                circleLongController?.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          Text('Strip - 6 item', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          SimplePageView(
            controller: stripController!,
            count: 6,
          ),
          AttachedPageControl(
            controller: stripController!,
            count: 6,
            effect: PageControlEffect.stripEffect(
              width: stripWidth.w,
              height: stripHeight.h,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                stripController?.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 16),
          Text('Filled Strip - 6 item', style: FunDsTypography.body12B),
          const SizedBox(height: 8),
          SimplePageView(
            controller: filledStripController!,
            count: 6,
          ),
          AttachedPageControl(
            controller: filledStripController!,
            count: 6,
            effect: PageControlEffect.filledStripEffect(
              width: stripWidth.w,
              height: stripHeight.h,
              spacing: spacing.w,
            ),
            onDotClicked: (index) {
              setState(() {
                filledStripController?.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            },
          ),

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text('Custom Example: IG Story', style: FunDsTypography.body16B),
          Text(
            'Widget: BasicPageControl',
            style: FunDsTypography.body12B,
          ),
          Text(
            'Timer functionality not included on this Component, but you can follow the example code in the catalog',
            style: FunDsTypography.body10,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const SizedBox(
            height: 200,
            child: StoryExample(),
          ),
        ],
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.onPrev,
    required this.onNext,
    required this.text,
  });

  final VoidCallback onPrev;
  final VoidCallback onNext;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: onPrev,
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: onNext,
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}

class SimplePageView extends StatelessWidget {
  final PageController controller;
  final int count;

  const SimplePageView({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 54,
      child: PageView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.primaries[index % Colors.primaries.length],
            ),
            child: Center(
              child: Text(
                '$index',
                style: FunDsTypography.body12B.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
        controller: controller,
        itemCount: count,
      ),
    );
  }
}

class StoryExample extends StatefulWidget {
  const StoryExample({super.key});

  @override
  State<StoryExample> createState() => _StoryExampleState();
}

class _StoryExampleState extends State<StoryExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late PageController _pageController;

  int _activePage = 0;
  bool _onFling = false;
  Timer? _delayTimer;

  int pageCount = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _animController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_activePage == pageCount - 1) {
          _onFling = true;
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else {
          _onFling = true;
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      }
    });

    _animController.forward();
  }

  void restartAfterDelay(int page) {
    _delayTimer?.cancel();
    _delayTimer = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _activePage = page;
      });
      _onFling = false;
      _animController.reset();
      _animController.forward();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            // Dragging page view need to be handled using notification
            if (notification is ScrollStartNotification) {
              _animController.stop();
            } else if (notification is ScrollEndNotification) {
              if (!_onFling) {
                _animController.forward();
              }
            }
            return false;
          },
          child: GestureDetector(
            onTapDown: (details) {
              _animController.stop();
            },
            onTapUp: (details) {
              if (!_onFling) {
                _animController.forward();
              }
            },
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                restartAfterDelay(value);
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                  child: Center(
                    child: Text(
                      '$index',
                      style: FunDsTypography.body12B.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              itemCount: pageCount,
            ),
          ),
        ),

        // Page Control
        Positioned(
          top: 4,
          left: 4,
          right: 4,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final spacing = 4.w;
              final dotWidth =
                  (constraints.maxWidth + spacing) / pageCount - spacing;
              return AnimatedBuilder(
                animation: _animController,
                builder: (context, child) {
                  return BasicPageControl(
                    effect: PageControlEffect.filledStripEffect(
                      onZero: OnZero.empty,
                      width: dotWidth,
                      height: 5.h,
                      spacing: spacing,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withOpacity(0.5),
                    ),
                    count: pageCount,
                    offset: _activePage + _animController.value,
                    onDotClicked: (index) {
                      _animController.stop();
                      setState(() {
                        _onFling = true;
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
