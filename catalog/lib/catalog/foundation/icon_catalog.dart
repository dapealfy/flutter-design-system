import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AIconCatalog extends StatelessWidget {
  const AIconCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    const List<double> iconSizes = [16, 20, 24, 32, 40];

    return CatalogPage(
        title: 'Icon (size: 16,20,24,32,40)',
        child: SizedBox(
          width: 1.sw,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: FunDsIconography.getAllIcons().length,
            itemBuilder: (context, indexAllIcons) {
              return Container(
                width: 1.sw,
                height: 50.h,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FunDsIconography.getAllIcons()[indexAllIcons]
                          .split('/')
                          .last
                          .replaceAll('.svg', ''),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: iconSizes.length,
                      itemBuilder: (context, index) {
                        return FunDsIcon(
                            funDsIconography:
                                FunDsIconography.getAllIcons()[indexAllIcons],
                            size: iconSizes[index]);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
