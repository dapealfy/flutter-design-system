import 'package:catalog/catalog/atoms/a_icon_catalog.dart';
import 'package:catalog/catalog/button/button_catalog.dart';
import 'package:catalog/catalog/button/group_button_catalog.dart';
import 'package:catalog/catalog/example/example_catalog.dart';
import 'package:catalog/catalog/foundation/colors_catalog.dart';
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
  // Example
  Entry(
    name: 'Example/Example',
    description: 'See the example here',
    builder: (context) => const ExampleCatalog(),
  ),

  Entry(
    name: 'Button/Button',
    builder: (context) => const ButtonCatalog(),
  ),
  Entry(
    name: 'Button/Group Button',
    builder: (context) => const GroupButtonCatalog(),
  ),
];
