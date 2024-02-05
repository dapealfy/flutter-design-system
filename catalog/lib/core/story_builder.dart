import 'package:catalog/core/catalog_entry.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

List<Story> buildStory(List<Entry> entries) {
  final sortedEntries = entries.sorted((a, b) {
    final segmentsA = a.name.split('/');
    final segmentsB = b.name.split('/');

    if (segmentsA.length > 1 && segmentsB.length > 1) {
      if (segmentsA[0] == segmentsB[0]) {
        return segmentsA[1].compareTo(segmentsB[1]);
      }
    }

    return 0;
  });

  return sortedEntries.map((entry) {
    return Story(
      name: entry.name,
      description: entry.description,
      builder: entry.builder,
    );
  }).toList();
}
