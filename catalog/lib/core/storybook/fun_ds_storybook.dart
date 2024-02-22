// ignore_for_file: depend_on_referenced_packages

import 'dart:collection';

import 'package:catalog/core/storybook/plugin/layout.dart';
import 'package:catalog/core/storybook/plugin/plugin_panel.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart'
    hide LayoutPlugin, PluginPanel;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FunDsStorybook extends StatefulWidget {
  FunDsStorybook({
    super.key,
    required Iterable<Story> stories,
    required Iterable<Plugin> plugins,
    this.initialStory,
    this.wrapperBuilder = materialWrapper,
    this.showPanel = true,
    Layout initialLayout = Layout.auto,
  })  : plugins = UnmodifiableListView([
          LayoutPlugin(initialLayout),
          const ContentsPlugin(),
          const KnobsPlugin(),
          ...plugins,
        ]),
        stories = UnmodifiableListView(stories);

  /// All enabled plugins.
  final List<Plugin> plugins;

  /// All available stories.
  final List<Story> stories;

  /// Optional initial story.
  final String? initialStory;

  /// Each story will be wrapped into a widget returned by this builder.
  final TransitionBuilder wrapperBuilder;

  /// Whether to show the plugin panel at the bottom.
  final bool showPanel;

  @override
  State<FunDsStorybook> createState() => _FunDsStorybookState();
}

class _FunDsStorybookState extends State<FunDsStorybook> {
  final _overlayKey = GlobalKey<OverlayState>();
  final _layerLink = LayerLink();
  late final StoryNotifier _storyNotifier;

  @override
  void initState() {
    super.initState();
    _storyNotifier = StoryNotifier(
      widget.stories,
      initial: widget.initialStory,
    );
  }

  @override
  void didUpdateWidget(covariant FunDsStorybook oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stories != oldWidget.stories) {
      _storyNotifier.stories = widget.stories;
    }
  }

  @override
  void dispose() {
    _storyNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = CurrentStory(
      wrapperBuilder: widget.wrapperBuilder,
    );

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MediaQuery.fromView(
        view: View.of(context),
        child: Nested(
          children: [
            Provider.value(value: widget.plugins),
            ChangeNotifierProvider.value(value: _storyNotifier),
            ...widget.plugins
                .map((p) => p.wrapperBuilder)
                .whereType<TransitionBuilder>()
                .map((builder) => SingleChildBuilder(builder: builder))
          ],
          child: widget.showPanel
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        Expanded(child: currentStory),
                        RepaintBoundary(
                          child: Material(
                            child: SafeArea(
                              top: false,
                              child: CompositedTransformTarget(
                                link: _layerLink,
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                    child: PluginPanel(
                                      plugins: widget.plugins,
                                      overlayKey: _overlayKey,
                                      layerLink: _layerLink,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom,
                        )
                      ],
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Overlay(key: _overlayKey),
                    ),
                  ],
                )
              : currentStory,
        ),
      ),
    );
  }
}
