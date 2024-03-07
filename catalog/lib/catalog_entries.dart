import 'package:catalog/catalog/accordion/accordion_catalog.dart';
import 'package:catalog/catalog/accordion/group_accordion_catalog.dart';
import 'package:catalog/catalog/alert/alert_catalog.dart';
import 'package:catalog/catalog/avatar/avatar_catalog.dart';
import 'package:catalog/catalog/avatar/avatar_group_catalog.dart';
import 'package:catalog/catalog/badge/badge_catalog.dart';
import 'package:catalog/catalog/banner/banner_catalog.dart';
import 'package:catalog/catalog/bottom_sheet/bottom_sheet_catalog.dart';
import 'package:catalog/catalog/button/button_catalog.dart';
import 'package:catalog/catalog/button/group_button_catalog.dart';
import 'package:catalog/catalog/button/radio_button_catalog.dart';
import 'package:catalog/catalog/calendar/calendar_catalog.dart';
import 'package:catalog/catalog/checkbox/checkbox_catalog.dart';
import 'package:catalog/catalog/chip/chip_catalog.dart';
import 'package:catalog/catalog/coachmark/coachmark_catalog.dart';
import 'package:catalog/catalog/control/slider_catalog.dart';
import 'package:catalog/catalog/control/toggle_catalog.dart';
import 'package:catalog/catalog/counter/counter_catalog.dart';
import 'package:catalog/catalog/divider/divider_catalog.dart';
import 'package:catalog/catalog/foundation/colors_catalog.dart';
import 'package:catalog/catalog/foundation/icon_catalog.dart';
import 'package:catalog/catalog/foundation/typography_catalog.dart';
import 'package:catalog/catalog/header/header_catalog.dart';
import 'package:catalog/catalog/input_field/text_area_catalog.dart';
import 'package:catalog/catalog/input_field/text_field_catalog.dart';
import 'package:catalog/catalog/label/label_catalog.dart';
import 'package:catalog/catalog/list/list_tile_catalog.dart';
import 'package:catalog/catalog/loader/loader_catalog.dart';
import 'package:catalog/catalog/modal/modal_catalog.dart';
import 'package:catalog/catalog/page_control/page_control_catalog.dart';
import 'package:catalog/catalog/progress_bar/progress_bar_catalog.dart';
import 'package:catalog/catalog/select/select_catalog.dart';
import 'package:catalog/catalog/ticker/ticker_catalog.dart';
import 'package:catalog/catalog/tips/tips_catalog.dart';
import 'package:catalog/catalog/toaster/toaster_catalog.dart';
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

  // Components
  Entry(
    name: 'Component/Alert/Alert',
    builder: (context) => const AlertCatalog(),
  ),

  Entry(
    name: 'Component/Avatar/Single Avatar',
    builder: (context) => const SingleAvatarCatalog(),
  ),

  Entry(
    name: 'Component/Avatar/Group Avatar',
    builder: (context) => const GroupAvatarCatalog(),
  ),

  Entry(
    name: 'Component/Accordion/Accordion',
    builder: (context) => const AccordionCatalog(),
  ),

  Entry(
    name: 'Component/Accordion/Group Accordion',
    builder: (context) => const GroupAccordionCatalog(),
  ),

  Entry(
    name: 'Component/Input Field/Text Field',
    builder: (context) => const TextFieldCatalog(),
  ),

  Entry(
    name: 'Component/Input Field/Text Area',
    builder: (context) => const TextAreaCatalog(),
  ),

  Entry(
    name: 'Component/Button/Button',
    builder: (context) => const ButtonCatalog(),
  ),

  Entry(
    name: 'Component/Banner/Banner',
    builder: (context) => const BannerCatalog(),
  ),
  Entry(
    name: 'Component/Button/Group Button',
    builder: (context) => const GroupButtonCatalog(),
  ),
  Entry(
    name: 'Component/Button/Radio Button',
    builder: (context) => const RadioButtonCatalog(),
  ),

  Entry(
    name: 'Component/Calendar/Calendar',
    builder: (context) => const CalendarCatalog(),
  ),

  Entry(
    name: 'Component/CoachMark/CoachMark',
    builder: (context) => const CoachMarkCatalog(),
  ),

  Entry(
    name: 'Component/Control/Slider',
    builder: (context) => const SliderCatalog(),
  ),

  Entry(
    name: 'Component/Control/Toggle',
    builder: (context) => const ToggleCatalog(),
  ),

  Entry(
    name: 'Component/Counter/Counter',
    builder: (context) => const CounterCatalog(),
  ),

  Entry(
    name: 'Component/Bottom Sheet & Dialog/Bottom Sheet',
    builder: (context) => const BottomSheetCatalog(),
  ),

  Entry(
    name: 'Component/Page Control/Page Control',
    builder: (context) => const PageControlCatalog(),
  ),

  Entry(
    name: 'Component/Badge/Badge',
    builder: (context) => const BadgeCatalog(),
  ),

  Entry(
    name: 'Component/CheckBox/Checkbox',
    builder: (context) => const CheckboxCatalog(),
  ),

  Entry(
    name: 'Component/Loader/Spinner Loader',
    builder: (context) => const LoaderCatalog(),
  ),

  Entry(
    name: 'Component/Label/Label',
    builder: (context) => const LabelCatalog(),
  ),
  Entry(
    name: 'Component/List/List Tile',
    builder: (context) => const ListTileCatalog(),
  ),

  Entry(
    name: 'Component/Modal/Modal',
    builder: (context) => const ModalCatalog(),
  ),

  Entry(
    name: 'Component/Toaster/Toaster',
    builder: (context) => const ToasterCatalog(),
  ),

  Entry(
    name: 'Component/Ticker/Ticker',
    builder: (context) => const TickerCatalog(),
  ),

  Entry(
    name: 'Component/Tips/Tips',
    builder: (context) => const TipsCatalog(),
  ),

  Entry(
    name: 'Component/Chip/Chip',
    builder: (context) => const ChipCatalog(),
  ),

  Entry(
    name: 'Component/ProgressBar/ProgressBar',
    builder: (context) => const ProgressBarCatalog(),
  ),

  Entry(
    name: 'Component/Select/Select',
    builder: (context) => const SelectCatalog(),
  ),

  Entry(
    name: 'Component/Header/Header',
    builder: (context) => const HeaderCatalog(),
  ),
  Entry(
    name: 'Component/Divider/Divider',
    builder: (context) => const DividerCatalog(),
  ),
];
