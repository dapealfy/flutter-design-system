import 'package:catalog/catalog/atoms/a_icon_catalog.dart';
import 'package:catalog/catalog/foundation/button_catalog.dart';
import 'package:catalog/catalog/foundation/colors_catalog.dart';
import 'package:catalog/catalog/foundation/group_button_catalog.dart';
import 'package:catalog/catalog/foundation/typography_catalog.dart';
import 'package:catalog/core/catalog_entry.dart';
import 'package:catalog/core/home_catalog.dart';

final entries = [
  Entry(
    name: 'Home',
    builder: (context) => const HomeCatalog(),
  ),

  // Foundation
  Entry(
    name: 'Foundation/Colors',
    builder: (context) => const ColorsCatalog(),
  ),
  Entry(
    name: 'Foundation/Typography',
    builder: (context) => const TypographyCatalog(),
  ),
  Entry(
    name: 'Foundation/Icon',
    builder: (context) => const AIconCatalog(),
  ),
  Entry(
    name: 'Foundation/Button',
    builder: (context) => const ButtonCatalog(),
  ),
  Entry(
    name: 'Foundation/Group Button',
    builder: (context) => const GroupButtonCatalog(),
  ),
];
