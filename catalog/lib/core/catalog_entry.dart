import 'package:flutter/material.dart';

/// Abstraction for storybook entry.
class Entry {
  /// The name of the story.
  final String name;

  /// The description of the story.
  final String? description;

  /// The builder for the story.
  final WidgetBuilder builder;

  Entry({
    required this.name,
    this.description,
    required this.builder,
  });
}
