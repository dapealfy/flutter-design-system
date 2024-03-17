import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _dummyText = 'Amartha merupakan platform teknologi keuangan mikro '
    'terdepan yang memiliki misi mewujudkan '
    'kesejahteraan bersama lewat pembangunan infrastruktur '
    'keuangan digital bagi ekonomi akar rumput.';

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
          const SizedBox(height: 32),
          Text('Skeleton List', style: FunDsTypography.heading24),
          const SizedBox(height: 16),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.list,
            child: const Text(_dummyText),
          ),
          const SizedBox(height: 32),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.list2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/images/user_3.jpeg',
                    width: 48,
                    height: 48,
                  ),
                ),
                const Expanded(
                    child: Text(
                  _dummyText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Skeleton Card', style: FunDsTypography.heading24),
          const SizedBox(height: 16),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.card,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/images/user_3.jpeg',
                    width: 48,
                    height: 48,
                  ),
                ),
                const Expanded(
                    child: Text(
                  _dummyText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ),
          const SizedBox(height: 32),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.card2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/images/user_3.jpeg',
                    width: 48,
                    height: 48,
                  ),
                ),
                const Expanded(
                    child: Text(
                  _dummyText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ),
          const SizedBox(height: 32),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.card3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/images/user_3.jpeg',
                    width: 48,
                    height: 48,
                  ),
                ),
                const Expanded(
                    child: Text(
                  _dummyText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Skeleton Banner', style: FunDsTypography.heading24),
          const SizedBox(height: 16),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.banner,
            child: Image.asset(
              'assets/images/user_3.jpeg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 32),
          FunDsSkeleton(
            isLoading: isLoading,
            type: FunDsSkeletonType.banner2,
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Image.asset(
                      'assets/images/user_3.jpeg',
                      width: double.infinity,
                      fit: BoxFit.fill,
                      height: 180,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      _dummyText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
