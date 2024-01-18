import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccordionCatalog extends StatefulWidget {
  const AccordionCatalog({super.key});

  @override
  State<AccordionCatalog> createState() => _AccordionCatalogState();
}

class _AccordionCatalogState extends State<AccordionCatalog> {
  final _veryLongDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      'Nunc nec erat ex. Mauris ullamcorper lectus sed est '
      'consectetur, vitae condimentum elit efficitur. '
      'Praesent ultricies fringilla felis, et tempor ex '
      'sagittis sed. Etiam dignissim arcu justo, et iaculis'
      'nisi dapibus non. Maecenas cursus sapien et libero'
      'varius viverra. Sed maximus felis id malesuada ';

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
        title: 'Accordion',
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildDefaultAccordion(),
              ..._buildDefaultAccordion(
                  heading: 'Accordion 2 lines title',
                  title: 'The title max lines\nis 2 lines',
                  description: _veryLongDescription),
              ..._buildDefaultAccordion(
                  heading: 'Comes along with loading state',
                  title: 'Loading state',
                  description: _veryLongDescription,
                  isLoading: true),
              ..._buildDefaultAccordion(
                  heading: 'Can be expanded initially',
                  title: 'Expanded',
                  description: _veryLongDescription,
                  isExpanded: true),
            ],
          ),
        ));
  }

  List<Widget> _buildDefaultAccordion(
      {String heading = 'Default Accordion',
      String title = 'title',
      String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing',
      bool isLoading = false,
      bool isExpanded = false}) {
    return [
      Text(
        heading,
        style: FunDsTypography.heading16
            .copyWith(color: FunDsColors.colorNeutral900),
      ),
      SizedBox(height: 4.h),
      Accordion(
        title: title,
        description: description,
        isInitiallyExpanded: isExpanded,
      ),
      const SizedBox(height: 40),
    ];
  }
}
