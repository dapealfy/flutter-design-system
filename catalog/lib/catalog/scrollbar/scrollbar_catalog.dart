import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''
Widget Name: FunDsScrollbar

See knobs for more options. Right side on the web or gear icon on mobile.

How to use:
```
FunDsScrollbar(
  scrollController: _scrollController1,
  orientation: ScrollbarOrientation.right,
  size: ScrollbarSize.small,
  child: ListView.builder(
    controller: _scrollController1,
    itemCount: 100,
    itemBuilder: (context, index) {
      // Buld the item
    },
  ),
)

```
''';

class ScrollbarCatalog extends StatefulWidget {
  const ScrollbarCatalog({super.key});

  @override
  State<ScrollbarCatalog> createState() => _ScrollbarCatalogState();
}

class _ScrollbarCatalogState extends State<ScrollbarCatalog> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = context.knobs.options(
      label: 'Size',
      initial: ScrollbarSize.small,
      options: const <Option<ScrollbarSize>>[
        Option(label: 'Small', value: ScrollbarSize.small),
        Option(label: 'Medium', value: ScrollbarSize.medium),
      ],
    );

    return CatalogPage(
      title: 'Scrollbar',
      description: _desc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Vertical Scrollbar',
            style: FunDsTypography.heading14,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 200,
            color: FunDsColors.colorGreen50,
            child: FunDsScrollbar(
              scrollController: _scrollController1,
              orientation: ScrollbarOrientation.right,
              size: size,
              child: ListView.builder(
                controller: _scrollController1,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ),

          // Horizontal Scrollbar
          const SizedBox(height: 24),
          Text(
            'Horizontal Scrollbar',
            style: FunDsTypography.heading14,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 100,
            color: FunDsColors.colorGreen50,
            child: FunDsScrollbar(
              scrollController: _scrollController2,
              orientation: ScrollbarOrientation.bottom,
              size: size,
              child: ListView.separated(
                controller: _scrollController2,
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    color: Colors.red,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
