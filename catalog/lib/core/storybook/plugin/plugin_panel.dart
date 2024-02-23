// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class PluginPanel extends StatefulWidget {
  const PluginPanel({
    super.key,
    required this.plugins,
    required this.layerLink,
    required this.overlayKey,
  });

  final List<Plugin> plugins;
  final LayerLink layerLink;
  final GlobalKey<OverlayState> overlayKey;

  @override
  State<PluginPanel> createState() => _PluginPanelState();
}

class _PluginPanelState extends State<PluginPanel> {
  PluginOverlay? _overlay;

  @override
  void dispose() {
    _overlay?.remove();
    super.dispose();
  }

  OverlayEntry _createEntry(WidgetBuilder childBuilder) => OverlayEntry(
        builder: (context) => Provider<OverlayController>(
          create: (context) => OverlayController(
            remove: () {
              _overlay?.remove();
              _overlay = null;
            },
          ),
          child: Positioned(
            height: 400,
            width: MediaQuery.of(context).size.width - 100,
            child: CompositedTransformFollower(
              link: widget.layerLink,
              targetAnchor: Alignment.topLeft,
              followerAnchor: Alignment.bottomLeft,
              showWhenUnlinked: false,
              child: Localizations(
                delegates: const [
                  DefaultMaterialLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                ],
                locale: const Locale('en', 'US'),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PointerInterceptor(
                    child: Material(
                      child: childBuilder(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _onPluginButtonPressed(Plugin p) {
    p.onPressed?.call(context);
    final panelBuilder = p.panelBuilder;
    if (panelBuilder == null) return;

    void insertOverlay() {
      final overlay =
          PluginOverlay(plugin: p, entry: _createEntry(panelBuilder));
      _overlay = overlay;
      widget.overlayKey.currentState?.insert(overlay.entry);
    }

    final overlay = _overlay;
    if (overlay != null) {
      overlay.remove();
      if (overlay.plugin != p) {
        insertOverlay();
      } else {
        _overlay = null;
      }
    } else {
      insertOverlay();
    }
  }

  @override
  Widget build(BuildContext context) => Wrap(
        runAlignment: WrapAlignment.center,
        children: widget.plugins
            .map((p) => (p, p.icon?.call(context)))
            .whereType<(Plugin, Widget)>()
            .map(
              (p) => IconButton(
                icon: p.$2,
                onPressed: () => _onPluginButtonPressed(p.$1),
              ),
            )
            .toList(),
      );
}
