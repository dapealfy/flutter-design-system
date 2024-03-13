import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const description = '''
Widget name: FunDsCoachMark

How to use:

CoachMark.overlayTarget(
  context,
  controller: funOverlayController,
  title: 'title 1',
  description: 'description',
  overflow: 'overflow',
  primaryButtonText: 'primaryButtonText',
  onClickPrimary: onClickPrimary,
  secondaryButtonText: 'secondaryButtonText',
  onClickSecondary: onClickSecondary,
  child: const Text('text 1'),
);

funOverlayController.show();
''';

class CoachMarkCatalog extends StatefulWidget {
  const CoachMarkCatalog({super.key});

  @override
  State<CoachMarkCatalog> createState() => _CoachMarkCatalogState();
}

class _CoachMarkCatalogState extends State<CoachMarkCatalog> {
  final FunDsOverlayController _c1 = FunDsOverlayController();
  final FunDsOverlayController _c2 = FunDsOverlayController();
  final FunDsOverlayController _c3 = FunDsOverlayController();
  final FunDsOverlayController _c4 = FunDsOverlayController();
  int _currentCoachmarkId = -1;
  List<FunDsOverlayController> _controllerChains = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Coach Mark',
      description: description,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FunDsCoachMark.overlayTarget(
              context,
              controller: _c1,
              title: 'Make it clear and concise, no more than 2 lines.',
              description: 'Body text to describe the highlighted feature, '
                  'make it clear and concise, and no more than 3 lines.',
              overflow: '1 of 3',
              primaryButtonText: 'Next',
              onClickPrimary: nextTips,
              secondaryButtonText: 'Skip tour',
              onClickSecondary: hideTips,
              child: ListTile(
                title: const Text('Edwin Wahyudi'),
                subtitle: const Text('Our most awesome Product Manager'),
                leading:
                    FunDsAvatar.asset(imagePath: 'assets/images/user_1.jpeg'),
                visualDensity: VisualDensity.comfortable,
                dense: false,
                trailing: const Icon(
                  Icons.recycling,
                  color: FunDsColors.colorGreen600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                showTipsChain([_c1, _c2, _c3, _c4]);
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
                    FunDsCoachMark.overlayTarget(
                      context,
                      controller: _c2,
                      title: 'Make it clear and concise, no more than 2 lines.',
                      description:
                          'Body text to describe the highlighted feature, '
                          'make it clear and concise, and no more than 3 lines.',
                      overflow: '2 of 3',
                      primaryButtonText: 'Next',
                      onClickPrimary: nextTips,
                      secondaryButtonText: 'Skip tour',
                      onClickSecondary: hideTips,
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
                    FunDsCoachMark.overlayTarget(
                      context,
                      controller: _c3,
                      title: 'Make it clear and concise, no more than 2 lines.',
                      description:
                          'Body text to describe the highlighted feature, '
                          'make it clear and concise, and no more than 3 lines.',
                      overflow: '3 of 3',
                      primaryButtonText: 'Next',
                      onClickPrimary: nextTips,
                      secondaryButtonText: 'Skip tour',
                      onClickSecondary: hideTips,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: FunDsCoachMark.overlayTarget(
                context,
                controller: _c4,
                title: 'Make it clear and concise, no more than 2 lines.',
                description: 'Body text to describe the highlighted feature, '
                    'make it clear and concise, and no more than 3 lines.',
                overflow: '3 of 3',
                primaryButtonText: 'Next',
                onClickPrimary: nextTips,
                secondaryButtonText: 'Skip tour',
                onClickSecondary: hideTips,
                child: const Text('dummy item'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showTipsChain(List<FunDsOverlayController> controllers) {
    _currentCoachmarkId = 0;
    _controllerChains = controllers;

    _controllerChains[_currentCoachmarkId].show();
  }

  void nextTips() {
    _controllerChains[_currentCoachmarkId].hide();
    if (_currentCoachmarkId < _controllerChains.length - 1) {
      _currentCoachmarkId += 1;
      _controllerChains[_currentCoachmarkId].show();
    }
  }

  void hideTips() {
    _controllerChains[_currentCoachmarkId].hide();
  }
}
