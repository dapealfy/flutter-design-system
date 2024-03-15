import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const _desc = '''
Widget name: FunDsNavBar

Usage

```
FunDsNavBar(
  items: [
    // Add your item
    FunDsNavItem(
      icon: FunDsIcon(
        funDsIconography: FunDsIconography.actionIcCheckCircle,
        size: 24,
      ),
      activeIcon: FunDsIcon(
        funDsIconography: FunDsIconography.actionIcCheckCircle,
        size: 24,
      ),
      label: 'Home',
    ),
  ],
  onTap: (index) {
    // Handle tap
  },
  raisedCenter: true, // Optional
  currentIndex: 1,
)
```
''';

class NavBarCatalog extends StatefulWidget {
  const NavBarCatalog({super.key});

  @override
  State<NavBarCatalog> createState() => _NavBarCatalogState();
}

class _NavBarCatalogState extends State<NavBarCatalog> {
  int selectedIndex = 0;
  int selectedIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Navigation Bar',
      description: _desc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Raised Center',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          FunDsNavBar(
            items: [
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcHomeInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcHomeActive,
                  size: 24,
                ),
                label: 'Home',
              ),
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography:
                      FunDsIconography.navigationIcPinjamanInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcPinjamanActive,
                  size: 24,
                ),
                label: 'Angsuran',
              ),
              FunDsNavItem(
                icon: Container(
                  decoration: BoxDecoration(
                    color: FunDsColors.colorPrimary100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const FunDsIcon(
                    funDsIconography: FunDsIconography.navigationIcScanInactive,
                    size: 24,
                  ),
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: FunDsColors.colorPrimary100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const FunDsIcon(
                    funDsIconography: FunDsIconography.navigationIcScanActive,
                    size: 24,
                  ),
                ),
                label: 'Scan',
              ),
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography:
                      FunDsIconography.navigationIcKeuanganInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcKeuanganActive,
                  size: 24,
                ),
                label: 'Keuangan',
              ),
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography:
                      FunDsIconography.navigationIcProfileInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcProfileActive,
                  size: 24,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            raisedCenter: true,
            currentIndex: selectedIndex,
          ),
          const SizedBox(height: 16),
          Text(
            'Normal',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          FunDsNavBar(
            items: [
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcHomeInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcHomeActive,
                  size: 24,
                ),
                label: 'Home',
              ),
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography:
                      FunDsIconography.navigationIcPinjamanInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcPinjamanActive,
                  size: 24,
                ),
                label: 'Angsuran',
              ),
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography:
                      FunDsIconography.navigationIcKeuanganInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcKeuanganActive,
                  size: 24,
                ),
                label: 'Keuangan',
              ),
              FunDsNavItem(
                icon: const FunDsIcon(
                  funDsIconography:
                      FunDsIconography.navigationIcProfileInactive,
                  size: 24,
                  color: FunDsColors.colorTextCaption,
                ),
                activeIcon: const FunDsIcon(
                  funDsIconography: FunDsIconography.navigationIcProfileActive,
                  size: 24,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex2 = index;
              });
            },
            raisedCenter: false,
            currentIndex: selectedIndex2,
          ),
        ],
      ),
    );
  }
}
