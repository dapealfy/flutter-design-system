import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class ModalCatalog extends StatelessWidget {
  const ModalCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'ModalCatalog',
      description: 'Widget name: FunDsModal',
      child: Center(
        child: Column(
          children: [
            FunDsButton(
              key: const Key('btn_modal'),
              text: 'Show Modal',
              type: FunDsButtonType.large,
              variant: FunDsButtonVariant.primary,
              onPressed: () {
                FunDsModal.show(
                  context: context,
                  heading: 'Title',
                  title: 'Insert title here, max 2 lines',
                  desc: 'Write something here, something helpful maybe? '
                      'Or ask our beloved copywriter to write it for you ;)',
                  image:
                      'https://images.unsplash.com/photo-1597655601841-214a4cfe8b2c'
                      '?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3'
                      '&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnRhaW4lMjBzY2VuZXJ5fGVufDB8fDB8fHww',
                  groupButton: FunDsGroupButton(
                    variant: FunDsGroupButtonVariant.horizontal,
                    listButton: [
                      FunDsButton(
                        key: const Key('btn_modal_secondary'),
                        type: FunDsButtonType.medium,
                        text: 'CTA Here',
                        variant: FunDsButtonVariant.secondary,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('secondary button clicked!')));
                        },
                      ),
                      FunDsButton(
                        key: const Key('btn_modal_primary'),
                        type: FunDsButtonType.medium,
                        text: 'CTA Here',
                        variant: FunDsButtonVariant.primary,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('primary button clicked!')));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
