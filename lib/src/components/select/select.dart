import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_design_system/src/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'selection_sheet.dart';
part 'selection_sheet_config.dart';

class FunDsSelect<T> extends StatefulWidget {
  const FunDsSelect({
    super.key,
    required this.selected,
    this.itemToString,
    this.labelText,
    this.descriptionText,
    this.hintText,
    this.leftIcon,
    this.helperText,
    this.isError = false,
    this.size = FunDsFieldSize.small,
    this.onTap,
  });

  /// The selected item
  final List<T> selected;

  /// The function to convert the selected item to string
  final String Function(T)? itemToString;

  /// The function to be called when the select is tapped
  final VoidCallback? onTap;

  final String? labelText;

  final String? descriptionText;

  final String? helperText;

  final Widget? leftIcon;

  final String? hintText;

  final bool isError;

  final FunDsFieldSize size;

  /// Build select with predefined bottom sheet
  factory FunDsSelect.bottomSheet({
    required BuildContext context,
    required List<T> selected,
    Key? key,
    String? labelText,
    String Function(T)? itemToString,
    String? descriptionText,
    String? hintText,
    Widget? leftIcon,
    String? helperText,
    bool isError = false,
    funds.FunDsFieldSize size = funds.FunDsFieldSize.small,
    required SelectionSheetConfig<T> sheetConfig,
  }) {
    return FunDsSelect<T>(
      key: key,
      selected: selected,
      itemToString: itemToString,
      labelText: labelText,
      descriptionText: descriptionText,
      hintText: hintText,
      leftIcon: leftIcon,
      helperText: helperText,
      isError: isError,
      size: size,
      onTap: () {
        SelectionSheet.show(
          context,
          selected: selected,
          sheetConfig: sheetConfig,
        );
      },
    );
  }

  @override
  State<FunDsSelect<T>> createState() => FunDsSelectState<T>();
}

class FunDsSelectState<T> extends State<FunDsSelect<T>> {
  final _controller = funds.FunDsTextController();

  bool get isEmpty => widget.selected.isEmpty;

  @override
  void initState() {
    super.initState();
    _updateSelected();
  }

  @override
  void didUpdateWidget(covariant FunDsSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selected != widget.selected) {
      _updateSelected();
    }
  }

  void _updateSelected() {
    final selectedCount = widget.selected.length;
    if (selectedCount == 1) {
      _controller.text = widget.itemToString?.call(widget.selected.first) ??
          widget.selected.first.toString();
    } else if (selectedCount > 1) {
      _controller.text = '$selectedCount terpilih';
    } else {
      _controller.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return funds.FunDsTextField(
      readOnly: true,
      labelText: widget.labelText,
      descriptionText: widget.descriptionText,
      helperText: widget.helperText,
      hintText: widget.hintText,
      readOnlyTextOverflow: TextOverflow.ellipsis,
      controller: _controller,
      onTap: widget.onTap,
      leftIcon: widget.leftIcon,
      isError: widget.isError,
      showClear: false,
      size: widget.size,
      suffix1: funds.FunDsIcon(
        funDsIconography: funds.FunDsIconography.basicIcChevronDown,
        size: 20.w,
      ),
    );
  }
}
