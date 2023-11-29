# FunDS Catalog

## Getting Started

This project contain the catalog for Amartha FunDS Design System

This project can be run on

- Android
- iOS
- Web
- MacOS
- Linux
- Windows

Simply run `lib/main.dart` like running other Flutter apps.

The Web version also deployed on [https://amartha-flutter-funds.web.app/](https://amartha-flutter-funds.web.app/)

## Adding new component to the catalog

1. Create a new Dart file in the catalog directory. The file name should follow the convention `component_name_catalog.dart`.
2. In this file, create a new widget that returns a `CatalogPage`. You can refer to `ExampleCatalog` for a detailed example.
3. Register your new catalog widget in the `catalog_entries.dart` file. This will make your component available in the catalog.

## Knobs

Knobs are a feature provided by the [storybook_flutter](https://pub.dev/packages/storybook_flutter) package, which is used in this project to create the catalog. Knobs allow you to modify the widget at runtime, providing a way to test different configurations of your component.

To use knobs, refer to the `ExampleCatalog` file. This file contains examples of how to use knobs to modify the widget at runtime.

Remember to always test your component in different environments (Android, iOS, Web, MacOS, Linux, Windows) to ensure compatibility.
