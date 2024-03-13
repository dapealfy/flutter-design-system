import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class SkeletonCatalog extends StatefulWidget {
  const SkeletonCatalog({super.key});

  @override
  State<SkeletonCatalog> createState() => _SkeletonCatalogState();
}

class _SkeletonCatalogState extends State<SkeletonCatalog> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
        title: 'Skeleton',
        child: Column(
          children: [
            FunDsButton(
              text: 'isLoading : $isLoading',
              type: FunDsButtonType.small,
              variant: FunDsButtonVariant.primary,
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
              },
            ),
            SizedBox(height: 32),
            FunDsSkeleton(
                isLoading: isLoading,
                type: FunDsSkeletonType.list,
                child: const FunDsButton(
                    text: 'adad',
                    type: FunDsButtonType.small,
                    variant: FunDsButtonVariant.primary)),
            SizedBox(height: 32),
            FunDsSkeleton(
                isLoading: isLoading,
                type: FunDsSkeletonType.list2,
                child: const FunDsButton(
                    text: 'adad',
                    type: FunDsButtonType.small,
                    variant: FunDsButtonVariant.primary))
          ],
        ));
  }
}
