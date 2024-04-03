import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''
WidgetName: Select

Usage:

Raw Select

funds.Select<Model>(
  selected: selected,
  itemToString: (item) => item.title,
  labelText: label,
  leftIcon: leftIcon,
  hintText: hintText,
  helperText: helperText,
  isError: isError,
  onTap: () {
    // Do something
  },
);


Select with included bottom sheet

funds.Select<Model>.bottomSheet(
  context: context,
  selected: selected,
  itemToString: (item) => item.title,
  labelText: label,
  hintText: hintText,
  leftIcon: leftIcon,
  helperText: helperText,
  isError: isError,
  sheetConfig: funds.SelectionSheetConfig<Model>(
    getItems: (controller) async {
      // Return list of items
    },
    onSelected: (selected) {
      // Do something
    },
    headerBuilder: (context, controller) {
      // Build header of the sheet
    },
    footerBuilder: (context, controller) {
      // Build footer of the sheet
      // Use controller.save() or controller.close() to close the sheet
      // Otherwise, use controller.selected to get selected item
    },
    itemBuilder: (item, selected, controller) {
      // Build item of the sheet
      // Use controller.select() or controller.deselect() to select or deselect the item
      // Use controller.selectSingle() to select only one item
      // Use controller.save() to close the sheet and trigger onSelected
    },
  ),
),


''';

final List<Model> items = List.generate(10, (index) => Model('Item $index'));
final List<NestedModel> nestedItems = List.generate(
  10,
  (parentIndex) => NestedModel(
    'Item $parentIndex',
    List.generate(5, (index) {
      return NestedModel('Child $index of $parentIndex', []);
    }),
  ),
);

class SelectCatalog extends StatefulWidget {
  const SelectCatalog({super.key});

  @override
  State<SelectCatalog> createState() => _SelectCatalogState();
}

class _SelectCatalogState extends State<SelectCatalog> {
  List<Model> selected = [];
  List<NestedModel> nestedSelected = [];

  @override
  Widget build(BuildContext context) {
    final label = context.knobs.text(label: 'labelText', initial: 'Label');
    final hintText =
        context.knobs.text(label: 'hintText', initial: 'Placeholder');
    final helperText = context.knobs.text(label: 'helperText', initial: '');
    final leftIcon = context.knobs.options(
      label: 'leftIcon',
      initial: null,
      options: <Option<Widget?>>[
        const Option(label: 'null', value: null),
        Option(
          label: 'Icon',
          value: funds.FunDsIcon(
            funDsIconography: funds.FunDsIconography.actionIcCloud,
            size: 16.spMin,
          ),
        ),
      ],
    );
    final isError = context.knobs.boolean(label: 'isError', initial: false);
    final size = context.knobs.options(
      label: 'Size',
      initial: funds.FunDsFieldSize.small,
      options: const [
        Option(label: 'Small', value: funds.FunDsFieldSize.small),
        Option(label: 'Medium', value: funds.FunDsFieldSize.medium),
      ],
    );

    return CatalogPage(
      title: 'Select',
      description: _desc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Raw Select - Custom Tap Handling',
            style: funds.FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          funds.FunDsSelect<Model>(
            selected: selected,
            itemToString: (item) => item.title,
            labelText: label,
            leftIcon: leftIcon,
            hintText: hintText,
            helperText: helperText,
            isError: isError,
            size: size,
            onTap: () {
              // Using dedicated widget as a child is recommended to make sure
              // hot reload is working while sheet is showing
              funds.FunDsBottomSheet.showCustomBottomSheet(
                context: context,
                child: const CustomSelectSheet(),
              ).then((value) {
                if (value is List<Model>) {
                  setState(() {
                    selected = value;
                  });
                }
              });
            },
          ),
          const SizedBox(height: 16),

          /// Predefined bottom sheet demo
          Text(
            '[Multi] Select.bottomSheet',
            style: funds.FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          funds.FunDsSelect<Model>.bottomSheet(
            context: context,
            selected: selected,
            itemToString: (item) => item.title,
            labelText: label,
            hintText: hintText,
            leftIcon: leftIcon,
            helperText: helperText,
            isError: isError,
            size: size,
            sheetConfig: funds.SelectionSheetConfig<Model>(
              getItems: (controller) async {
                await Future.delayed(const Duration(seconds: 1));
                return items
                    .where((element) => element.title
                        .contains(controller.params['search'] ?? ''))
                    .toList();
              },
              onSelected: (selected) {
                setState(() {
                  this.selected = selected;
                });
              },
              headerBuilder: (context, controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Pilih Makanan Favorit',
                      style: funds.FunDsTypography.heading20,
                    ),
                    funds.FunDsTextField(
                      showClear: true,
                      hintText: 'Search',
                      onChangedDebounced: (value) {
                        controller.setParam({'search': value});
                      },
                    ),
                  ],
                );
              },
              footerBuilder: (context, controller) {
                return funds.FunDsGroupButton(
                  variant: funds.FunDsGroupButtonVariant.horizontal,
                  listButton: [
                    funds.FunDsButton(
                      text: 'Tutup',
                      variant: funds.FunDsButtonVariant.secondary,
                      onPressed: () {
                        controller.close(context);
                      },
                      type: funds.FunDsButtonType.medium,
                    ),
                    funds.FunDsButton(
                      text: 'Simpan',
                      variant: funds.FunDsButtonVariant.primary,
                      type: funds.FunDsButtonType.medium,
                      onPressed: () {
                        controller.save(context);
                      },
                    ),
                  ],
                );
              },
              itemBuilder: (context, item, selected, controller) {
                return funds.FunDsCheckbox(
                  variant: funds.FunDsCheckboxVariant.primary,
                  title: item.title,
                  checked: selected,
                  onChanged: (value) {
                    if (value == true) {
                      controller.select(item);
                    } else {
                      controller.deselect(item);
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Single Select Demo
          Text(
            '[Single] Select.bottomSheet',
            style: funds.FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          funds.FunDsSelect<Model>.bottomSheet(
            context: context,
            selected: selected,
            itemToString: (item) => item.title,
            labelText: label,
            hintText: hintText,
            leftIcon: leftIcon,
            helperText: helperText,
            isError: isError,
            size: size,
            sheetConfig: funds.SelectionSheetConfig<Model>(
              getItems: (controller) => Future.value(items),
              onSelected: (selected) {
                setState(() {
                  this.selected = selected;
                });
              },
              itemBuilder: (context, item, selected, controller) {
                return ListTile(
                  title: Text(item.title),
                  trailing: selected ? const Icon(Icons.check) : null,
                  onTap: () {
                    controller.selectSingle(item);

                    // Close the sheet
                    controller.save(context);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          /// Nested Demo
          Text(
            '[Multi] Select.bottomSheet - Nested Sheet',
            style: funds.FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          funds.FunDsSelect<NestedModel>.bottomSheet(
            context: context,
            selected: nestedSelected,
            itemToString: (item) => item.title,
            labelText: label,
            hintText: hintText,
            leftIcon: leftIcon,
            helperText: helperText,
            isError: isError,
            size: size,
            sheetConfig: funds.SelectionSheetConfig<NestedModel>(
              getItems: (controller) async {
                return nestedItems;
              },
              onSelected: (selected) {
                setState(() {
                  nestedSelected = selected;
                });
              },
              footerBuilder: (context, controller) {
                return funds.FunDsGroupButton(
                  variant: funds.FunDsGroupButtonVariant.horizontal,
                  listButton: [
                    funds.FunDsButton(
                      text: 'Tutup',
                      variant: funds.FunDsButtonVariant.secondary,
                      onPressed: () {
                        controller.close(context);
                      },
                      type: funds.FunDsButtonType.medium,
                    ),
                    funds.FunDsButton(
                      text: 'Simpan',
                      variant: funds.FunDsButtonVariant.primary,
                      type: funds.FunDsButtonType.medium,
                      onPressed: () {
                        controller.save(context);
                      },
                    ),
                  ],
                );
              },
              itemBuilder: (context, item, selected, controller) {
                final isChildSelected = controller.selected.any((element) {
                  return item.childs.contains(element);
                });

                return ListTile(
                  title: Text(item.title),
                  trailing: selected || isChildSelected
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    if (item.childs.isNotEmpty) {
                      // Show nested sheet, copy config from current
                      funds.SelectionSheet.show(
                        context,
                        selected: controller.selected.toList(),
                        sheetConfig: controller.config.copyWith(
                          onSelected: (selected) {
                            // Setting selected item of the parrent
                            controller.setSelected(selected);
                          },
                          getItems: (controller) async => item.childs,
                        ),
                      );
                      return;
                    }

                    if (selected) {
                      controller.deselect(item);
                    } else {
                      controller.select(item);
                    }
                  },
                );
              },
            ),
          ),

          /// Nested Demo
          Text(
            '[Multi] Select.bottomSheet - Nested Item',
            style: funds.FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          funds.FunDsSelect<NestedModel>.bottomSheet(
            context: context,
            selected: nestedSelected,
            itemToString: (item) => item.title,
            labelText: label,
            hintText: hintText,
            leftIcon: leftIcon,
            helperText: helperText,
            isError: isError,
            size: size,
            sheetConfig: funds.SelectionSheetConfig<NestedModel>(
              getItems: (controller) async {
                return nestedItems;
              },
              onSelected: (selected) {
                setState(() {
                  nestedSelected = selected;
                });
              },
              footerBuilder: (context, controller) {
                return funds.FunDsGroupButton(
                  variant: funds.FunDsGroupButtonVariant.horizontal,
                  listButton: [
                    funds.FunDsButton(
                      text: 'Tutup',
                      variant: funds.FunDsButtonVariant.secondary,
                      onPressed: () {
                        controller.close(context);
                      },
                      type: funds.FunDsButtonType.medium,
                    ),
                    funds.FunDsButton(
                      text: 'Simpan',
                      variant: funds.FunDsButtonVariant.primary,
                      type: funds.FunDsButtonType.medium,
                      onPressed: () {
                        controller.save(context);
                      },
                    ),
                  ],
                );
              },
              itemBuilder: (context, item, selected, controller) {
                final isChildSelected = controller.selected.any((element) {
                  return item.childs.contains(element);
                });

                List<Widget> children = [];
                for (var child in item.childs) {
                  // Check selected manually
                  final childSelected = controller.selected.contains(child);
                  children.add(ListTile(
                    title: Text(child.title),
                    trailing: childSelected ? const Icon(Icons.check) : null,
                    onTap: () {
                      if (childSelected) {
                        controller.deselect(child);
                      } else {
                        controller.select(child);
                      }
                    },
                  ));
                }

                return ExpansionTile(
                  title: Text(item.title),
                  trailing: selected || isChildSelected
                      ? const Icon(Icons.check)
                      : null,
                  children: children,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSelectSheet extends StatelessWidget {
  const CustomSelectSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return funds.FunDsGroupButton(
      variant: funds.FunDsGroupButtonVariant.horizontal,
      listButton: [
        funds.FunDsButton(
          text: 'Clear',
          variant: funds.FunDsButtonVariant.secondary,
          onPressed: () {
            Navigator.of(context).pop(<Model>[]);
          },
          type: funds.FunDsButtonType.medium,
        ),
        funds.FunDsButton(
          text: 'Pilih Satu',
          variant: funds.FunDsButtonVariant.secondary,
          onPressed: () {
            Navigator.of(context).pop([items[0]]);
          },
          type: funds.FunDsButtonType.medium,
        ),
        funds.FunDsButton(
          text: 'Pilih Banyak',
          variant: funds.FunDsButtonVariant.primary,
          type: funds.FunDsButtonType.medium,
          onPressed: () {
            Navigator.of(context).pop([items[0], items[1], items[2]]);
          },
        ),
      ],
    );
  }
}

class Model {
  final String title;
  Model(this.title);
}

class NestedModel {
  final String title;
  final List<NestedModel> childs;
  NestedModel(this.title, this.childs);
}
