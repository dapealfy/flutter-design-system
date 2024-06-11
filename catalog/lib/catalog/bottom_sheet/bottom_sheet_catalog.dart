import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BottomSheetCatalog extends StatelessWidget {
  const BottomSheetCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final option = context.knobs.options<FunDsBottomSheetType>(
      label: 'Bottom Sheet Type',
      description: 'Pick one type, close and open bottom sheet again',
      initial: FunDsBottomSheetType.common,
      options: [
        const Option(label: 'Common', value: FunDsBottomSheetType.common),
        const Option(
            label: 'Small Image', value: FunDsBottomSheetType.smallImage),
        const Option(
            label: 'Bottom Image', value: FunDsBottomSheetType.bottomImage),
      ],
    );

    final isUsingStringDescription = context.knobs.options(
        label: 'Modify Description',
        description:
            'Whether to use string or richText for more flexible styling',
        initial: true,
        options: [
          const Option(
            label: 'Common String',
            value: true,
          ),
          const Option(
            label: 'RichText',
            value: false,
          ),
        ]);

    return CatalogPage(
      title: 'BottomSheetCatalog',
      description: 'Widget name: FunDsBottomSheet',
      child: Center(
        child: Column(
          children: [
            FunDsButton(
              key: const Key('btn_bottom_sheet'),
              text: 'Show BottomSheet',
              type: FunDsButtonType.large,
              variant: FunDsButtonVariant.primary,
              onPressed: () {
                FunDsBottomSheet.showBottomSheet(
                  context: context,
                  title: 'Test Title ',
                  desc: isUsingStringDescription
                      ? '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nisl eget urna. '''
                      : null,
                  textSpan: isUsingStringDescription
                      ? null
                      : const [
                          TextSpan(text: 'Dengan ini saya menyetujui '),
                          TextSpan(
                            text: 'Syarat & Ketentuan',
                            style: TextStyle(
                              color: FunDsColors.colorPrimary500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' yang berlaku dari AmarthaFin'),
                        ],
                  image: 'assets/images/error_ibu_amanah_partial.png',
                  type: option,
                  groupButton: FunDsGroupButton(
                    variant: FunDsGroupButtonVariant.horizontal,
                    listButton: [
                      FunDsButton(
                        key: const Key('btn_bottom_sheet_tutup'),
                        type: FunDsButtonType.medium,
                        text: 'Tutup',
                        variant: FunDsButtonVariant.secondary,
                        onPressed: () {},
                      ),
                      FunDsButton(
                        key: const Key('btn_bottom_sheet_lanjutkan'),
                        type: FunDsButtonType.medium,
                        text: 'Lanjutkan',
                        variant: FunDsButtonVariant.primary,
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            FunDsButton(
              key: const Key('btn_custom_bottom_sheet'),
              text: 'Show Custom BottomSheet',
              type: FunDsButtonType.large,
              variant: FunDsButtonVariant.primary,
              onPressed: () {
                FunDsBottomSheet.showCustomBottomSheet(
                    context: context,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: const Text('Ini bisa diisi widget apapun'),
                          subtitle: Text('data ke ${index + 1}'),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: FunDsColors.colorNeutral500,
                        );
                      },
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
