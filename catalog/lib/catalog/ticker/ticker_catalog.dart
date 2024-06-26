import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _description = 'A Ticker is a UI component used to draw attention to '
    'specific information, messages, or actions within a user interface. '
    'It typically involves a visually distinct container with concise content '
    'and may include icons or buttons for further interaction.';

class TickerCatalog extends StatelessWidget {
  const TickerCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
        title: 'Ticker',
        description: _description,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ticker Version 1',
                style: FunDsTypography.heading24,
              ),
              Text(
                'Ticker Outline',
                style: FunDsTypography.heading16,
              ),
              const SizedBox(height: 16),
              ..._buildTicker(context, TickerOutlineType.outline),
              Text(
                'Ticker Non-Outline',
                style: FunDsTypography.heading16,
              ),
              ..._buildTicker(context, TickerOutlineType.nonOutline),
              const SizedBox(height: 32),
              Text(
                'Ticker Version 2',
                style: FunDsTypography.heading24,
              ),
              Text(
                'Ticker Outline',
                style: FunDsTypography.heading16,
              ),
              const SizedBox(height: 16),
              ..._buildTicker(context, TickerOutlineType.outline,
                  isVersion1: false),
              Text(
                'Ticker Non-Outline',
                style: FunDsTypography.heading16,
              ),
              ..._buildTicker(context, TickerOutlineType.nonOutline,
                  isVersion1: false),
            ],
          ),
        ));
  }

  List<Widget> _buildTicker(BuildContext context, TickerOutlineType type,
      {bool isVersion1 = true}) {
    return List.from(TickerVariant.values).map((e) {
      final Widget widget;
      widget = FunDsTicker(
        title: isVersion1 ? 'Add the title here, no more than 1 line' : null,
        description: 'Ticker description can be put here. Be brief ya! '
            'Can add link in the end too.',
        variant: e,
        outlineType: type,
        textLink: 'Custom Text Link',
        onCloseTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('close icon clicked')));
        },
        onTextLinkTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('text link clicked')));
        },
      );
      return Padding(padding: const EdgeInsets.only(bottom: 16), child: widget);
    }).toList();
  }
}
