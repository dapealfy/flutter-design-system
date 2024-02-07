import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const description = '''
Widget name: FunDsCoachMark

How to use:

CoachMark.overlayBuilder(
  builder: (context) {
    return AnyChild(
      CoachMark.overlayTarget(
        context: context,
        key: _globalKey,
        overlayEntry: CoachMark(...),
        child: MyHighlightWidget(...),
      )
    );
  }
''';

class CoachMarkCatalog extends StatefulWidget {
  const CoachMarkCatalog({super.key});

  @override
  State<CoachMarkCatalog> createState() => _CoachMarkCatalogState();
}

class _CoachMarkCatalogState extends State<CoachMarkCatalog> {
  /// Global keys used for showcase (overlay)
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Coach Mark',
      description: description,
      child: CoachMark.overlayBuilder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CoachMark.overlayTarget(
                  context: context,
                  key: _one,
                  overlayEntry: CoachMark(
                    title: 'Make it clear and concise, no more than 2 lines.',
                    description:
                        'Body text to describe the highlighted feature, '
                        'make it clear and concise, and no more than 3 lines.',
                    overflow: '1 of 3',
                    primaryButtonText: 'Next',
                    onPressedPrimary: () {
                      CoachMark.next(context);
                    },
                    secondaryButtonText: 'Skip tour',
                    onPressedSecondary: () {
                      CoachMark.dismiss(context);
                    },
                  ),
                  child: const ListTile(
                    title: Text('Edwin Wahyudi'),
                    subtitle: Text('Our most awesome Product Manager'),
                    leading:
                        Avatar.asset(imagePath: 'assets/images/user_1.jpeg'),
                    visualDensity: VisualDensity.comfortable,
                    dense: false,
                    trailing: Icon(
                      Icons.recycling,
                      color: FunDsColors.colorGreen600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    CoachMark.start(context, [_one, _two, _three]);
                  },
                  child: const Text('start coach mark'),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/images/error_ibu_amanah_partial.png',
                        ),
                        CoachMark.overlayTarget(
                          context: context,
                          key: _two,
                          overlayEntry: CoachMark(
                            title:
                                'Make it clear and concise, no more than 2 lines.',
                            description:
                                'Body text to describe the highlighted feature, '
                                'make it clear and concise, and no more than 3 lines.',
                            overflow: '2 of 3',
                            primaryButtonText: 'Next',
                            onPressedPrimary: () {
                              CoachMark.next(context);
                            },
                            secondaryButtonText: 'Skip tour',
                            onPressedSecondary: () {
                              CoachMark.dismiss(context);
                            },
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Headline',
                                style: FunDsTypography.heading24,
                              ),
                              Text(
                                'Subhead',
                                style: FunDsTypography.heading14,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        CoachMark.overlayTarget(
                          context: context,
                          key: _three,
                          overlayEntry: CoachMark(
                            title:
                                'Make it clear and concise, no more than 2 lines.',
                            description:
                                'Body text to describe the highlighted feature, '
                                'make it clear and concise, and no more than 3 lines.',
                            overflow: '3 of 3',
                            primaryButtonText: 'Next',
                            onPressedPrimary: () {
                              CoachMark.next(context);
                            },
                            secondaryButtonText: 'Skip tour',
                            onPressedSecondary: () {
                              CoachMark.dismiss(context);
                            },
                          ),
                          child: const Text(
                            'Supporting text includes body content, '
                            'such as an article summary or a restaurant description.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('dummy item'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
