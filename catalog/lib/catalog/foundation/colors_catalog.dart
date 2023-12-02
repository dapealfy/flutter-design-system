import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class ColorsCatalog extends StatelessWidget {
  const ColorsCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Colors',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Main Color', style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _primaryColor.entries) _buildColorWidget(i)
            ],
          ),

          /// NEUTRAL
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Neutral Color', style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _neutralColor.entries) _buildColorWidget(i)
            ],
          ),

          /// SATURATED BLUE
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text('Saturated Blue Color', style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _saturatedBlueColor.entries) _buildColorWidget(i)
            ],
          ),

          /// SATURATED GREEN
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text('Saturated Green Color', style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _saturatedGreenColor.entries) _buildColorWidget(i)
            ],
          ),

          /// SATURATED YELLOW
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Saturated Yellow Color',
                style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _saturatedYellowColor.entries) _buildColorWidget(i)
            ],
          ),

          /// SATURATED ORANGE
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Saturated Orange Color',
                style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _saturatedOrangeColor.entries) _buildColorWidget(i)
            ],
          ),

          /// SATURATED RED
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Text('Saturated Red Color', style: FunDsTypography.heading20),
          ),
          Column(
            children: [
              for (var i in _saturatedRedColor.entries) _buildColorWidget(i)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorWidget(MapEntry<String, Color> map) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      color: map.value,
      child: Center(
        child: Text(
          map.key,
          style: FunDsTypography.body16B.copyWith(
              color: (map.value.computeLuminance() > 0.179)
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }

  static const _primaryColor = {
    "colorPrimary100": FunDsColors.colorPrimary100,
    "colorPrimary200": FunDsColors.colorPrimary200,
    "colorPrimary300": FunDsColors.colorPrimary300,
    "colorPrimary400": FunDsColors.colorPrimary400,
    "colorPrimary500": FunDsColors.colorPrimary500,
    "colorPrimary600": FunDsColors.colorPrimary600,
    "colorPrimary700": FunDsColors.colorPrimary700,
    "colorPrimary900": FunDsColors.colorPrimary900
  };

  static const _neutralColor = {
    "colorWhite": FunDsColors.colorWhite,
    "colorNeutral50": FunDsColors.colorNeutral50,
    "colorNeutral200": FunDsColors.colorNeutral200,
    "colorNeutral400": FunDsColors.colorNeutral400,
    "colorNeutral500": FunDsColors.colorNeutral500,
    "colorNeutral600": FunDsColors.colorNeutral600,
    "colorNeutral700": FunDsColors.colorNeutral700,
    "colorNeutral900": FunDsColors.colorNeutral900,
    "colorBlack": FunDsColors.colorBlack,
    "colorOverlay": FunDsColors.colorOverlay
  };

  static const _saturatedBlueColor = {
    "colorBlue50": FunDsColors.colorBlue50,
    "colorBlue200": FunDsColors.colorBlue200,
    "colorBlue400": FunDsColors.colorBlue400,
    "colorBlue500": FunDsColors.colorBlue500,
    "colorBlue600": FunDsColors.colorBlue600,
    "colorBlue700": FunDsColors.colorBlue700,
    "colorBlue800": FunDsColors.colorBlue800,
  };

  static const _saturatedGreenColor = {
    "colorGreen50": FunDsColors.colorGreen50,
    "colorGreen200": FunDsColors.colorGreen200,
    "colorGreen400": FunDsColors.colorGreen400,
    "colorGreen500": FunDsColors.colorGreen500,
    "colorGreen600": FunDsColors.colorGreen600,
    "colorGreen700": FunDsColors.colorGreen700,
    "colorGreen800": FunDsColors.colorGreen800,
  };

  static const _saturatedYellowColor = {
    "colorYellow50": FunDsColors.colorYellow50,
    "colorYellow200": FunDsColors.colorYellow200,
    "colorYellow400": FunDsColors.colorYellow400,
    "colorYellow500": FunDsColors.colorYellow500,
    "colorYellow600": FunDsColors.colorYellow600,
    "colorYellow700": FunDsColors.colorYellow700,
    "colorYellow800": FunDsColors.colorYellow800,
  };

  static const _saturatedOrangeColor = {
    "colorOrange50": FunDsColors.colorOrange50,
    "colorOrange200": FunDsColors.colorOrange200,
    "colorOrange400": FunDsColors.colorOrange400,
    "colorOrange500": FunDsColors.colorOrange500,
    "colorOrange600": FunDsColors.colorOrange600,
    "colorOrange700": FunDsColors.colorOrange700,
    "colorOrange800": FunDsColors.colorOrange800,
  };

  static const _saturatedRedColor = {
    "colorRed50": FunDsColors.colorRed50,
    "colorRed200": FunDsColors.colorRed200,
    "colorRed400": FunDsColors.colorRed400,
    "colorRed500": FunDsColors.colorRed500,
    "colorRed600": FunDsColors.colorRed600,
    "colorRed700": FunDsColors.colorRed700,
    "colorRed800": FunDsColors.colorRed800,
  };
}
