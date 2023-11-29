import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/typography/typography.dart';

class TypographyCatalog extends StatelessWidget {
  const TypographyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Typography',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('~~~~Heading~~~~', style: FunDsTypography.heading24),
            Text('Heading 24', style: FunDsTypography.heading24),
            Text('Heading 20', style: FunDsTypography.heading20),
            Text('Heading 16', style: FunDsTypography.heading16),
            Text('Heading 14', style: FunDsTypography.heading14),
            const SizedBox(
              height: 40,
            ),
            Text('~~~~Body~~~~', style: FunDsTypography.body18B),
            Text('Body 18', style: FunDsTypography.body18),
            Text('Body 18 Underline', style: FunDsTypography.body18U),
            Text('Body 18 Bold', style: FunDsTypography.body18B),
            Text('Body 16', style: FunDsTypography.body16),
            Text('Body 16 Underline', style: FunDsTypography.body16U),
            Text('Body 16 Bold', style: FunDsTypography.body16B),
            Text('Body 14', style: FunDsTypography.body14),
            Text('Body 14 Underline', style: FunDsTypography.body14U),
            Text('Body 14 Bold', style: FunDsTypography.body14B),
            Text('Body 12', style: FunDsTypography.body12),
            Text('Body 12 Underline', style: FunDsTypography.body12U),
            Text('Body 12 Bold', style: FunDsTypography.body12B),
            Text('Body 10', style: FunDsTypography.body10),
            Text('Body 10 Underline', style: FunDsTypography.body10U),
            Text('Body 10 Bold', style: FunDsTypography.body10B),
          ],
        ),
      ),
    );
  }
}
