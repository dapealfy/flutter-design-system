import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  group('TickerV1 Tests', () {
    testWidgets(
      'Ticker UI and functionality shows correctly',
      (WidgetTester tester) async {
        String value = '';
        await tester.pumpWidget(
          buildTestableWidget(
            child: FunDsTicker(
                label: const Text('Add the title here, no more than 1 line'),
                key: const Key('ticker-v1'),
                description: 'Description',
                variant: FunDsTickerVariant.success,
                type: FunDsTickerType.outline,
                textLink: 'Custom Text Link',
                onCloseTap: () {
                  value = 'clicked';
                }),
          ),
        );
        expect(find.text('Add the title here, no more than 1 line'),
            findsOneWidget);
        expect(find.byKey(const Key('ticker-v1')), findsAny);
        expect(value.isEmpty, isTrue);

        Finder closeIcon = find.byType(InkWell);
        expect(closeIcon, findsOneWidget);
        await tester.tap(closeIcon);
        expect(value, 'clicked');
      },
    );
  });

  group('TickerV2 Tests', () {
    testWidgets(
      'Ticker UI and functionality shows correctly',
      (WidgetTester tester) async {
        String clickableString = 'Custom Text Link';
        var value = 1;

        await tester.pumpWidget(
          buildTestableWidget(
            child: FunDsTicker(
              key: const Key('ticker-v2'),
              description: 'Description',
              variant: FunDsTickerVariant.success,
              type: FunDsTickerType.outline,
              textLink: clickableString,
              onTextLinkTap: () {
                value = 2;
              },
            ),
          ),
        );

        expect(find.byKey(const Key('ticker-v2')), findsAny);
        expect(value, 1);

        // onTap test for TextSpan
        Finder richText = find.byType(RichText);
        final Element element = richText.evaluate().single;
        final RenderParagraph paragraph =
            element.renderObject as RenderParagraph;
        paragraph.text.visitChildren((dynamic span) {
          if (span.text != clickableString) return true; // continue iterating.

          (span.recognizer as TapGestureRecognizer).onTap?.call();
          return false; // stop iterating, we found the one.
        });

        expect(value, 2);
      },
    );
  });
}
