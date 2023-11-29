import 'package:catalog/core/catalog_entry.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> buildStory(List<Entry> entries) {
  return entries.map((entry) {
    return Story(
      name: entry.name,
      description: entry.description,
      builder: entry.builder,
    );
  }).toList();
}
