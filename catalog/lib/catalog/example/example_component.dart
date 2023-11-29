import 'package:flutter/material.dart';

/// Example demo component
class ExampleComponent extends StatelessWidget {
  const ExampleComponent({
    super.key,
    required this.title,
    required this.number,
    required this.toogle,
    required this.option,
  });

  final String title;
  final int number;
  final bool toogle;
  final OptionEnum option;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: toogle ? Colors.red : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(title),
          subtitle: Text(
            'Number : $number\nOption : ${option.name}',
          ),
        ),
      ),
    );
  }
}

enum OptionEnum {
  option1,
  option2,
  option3,
}
