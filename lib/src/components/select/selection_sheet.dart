part of 'select.dart';

class SelectionSheet<T> extends StatefulWidget {
  const SelectionSheet({
    super.key,
    required this.sheetConfig,
    required this.initialSelected,
  });

  final List<T> initialSelected;
  final SelectionSheetConfig<T> sheetConfig;

  static Future<void> show<T>(
    BuildContext context, {
    required List<T> selected,
    required SelectionSheetConfig<T> sheetConfig,
  }) {
    return funds.FunDsBottomSheet.showCustomBottomSheet(
      context: context,
      child: SelectionSheet<T>(
        sheetConfig: sheetConfig,
        initialSelected: selected,
      ),
    );
  }

  @override
  State<SelectionSheet<T>> createState() => _SelectionSheetState<T>();
}

class _SelectionSheetState<T> extends State<SelectionSheet<T>> {
  late SelectController<T> controller;
  Future<List<T>>? shownItems;
  Map<String, dynamic> params = {};

  @override
  void initState() {
    super.initState();
    controller = SelectController<T>(
      config: widget.sheetConfig,
      initialSelection: widget.initialSelected,
    );

    controller.addListener(controllerListener);
    refreshItems();
  }

  @override
  void dispose() {
    controller.removeListener(controllerListener);
    super.dispose();
  }

  void controllerListener() {
    if (controller.params != params) {
      refreshItems();
    }
  }

  void refreshItems() {
    setState(() {
      params = controller.params;
      shownItems = widget.sheetConfig.getItems(controller);
    });
  }

  Widget _buildList(List<T> items) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (BuildContext context, SelectionState<T> value, Widget? child) {
        if (items.isEmpty) {
          return widget.sheetConfig.emptyBuilder?.call(context, controller) ??
              const Center(
                child: Text('No items'),
              );
        }

        return ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final selected = controller.value.selected.contains(item);
            return widget.sheetConfig
                .itemBuilder(context, item, selected, controller);
          },
          separatorBuilder: (context, index) =>
              widget.sheetConfig.separatorBuilder?.call(context) ??
              const SizedBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (widget.sheetConfig.headerBuilder != null)
            widget.sheetConfig.headerBuilder!(context, controller),
          Expanded(
            child: FutureBuilder(
              future: shownItems,
              builder: (context, AsyncSnapshot<List<T>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return widget.sheetConfig.loadingBuilder
                          ?.call(context, controller) ??
                      const Center(
                        child: funds.FunDsLoader(
                          width: 48,
                          height: 48,
                          variant: funds.FunDsLoaderVariant.spinner,
                          position: funds.FunDsLoaderPosition.top,
                        ),
                      );
                }
                if (snapshot.hasError) {
                  return widget.sheetConfig.errorBuilder
                          ?.call(context, snapshot.error, controller) ??
                      Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                }
                if (snapshot.hasData) {
                  return _buildList(snapshot.data!);
                }
                return const SizedBox();
              },
            ),
          ),
          if (widget.sheetConfig.footerBuilder != null)
            widget.sheetConfig.footerBuilder!(context, controller),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

/// Used to control the sheet
class SelectController<T> extends ValueNotifier<SelectionState<T>> {
  SelectController({
    required SelectionSheetConfig<T> config,
    required List<T> initialSelection,
  }) : super(SelectionState<T>(
            selected: initialSelection.toSet(), config: config));

  Map<String, dynamic> get params => value.params;
  Set<T> get selected => value.selected;
  SelectionSheetConfig<T> get config => value.config;

  /// The the whole selected items
  void setSelected(List<T> selected) {
    final newValue = value.copyWith(
      selected: selected.toSet(),
    );
    value = newValue;
  }

  /// Select a single item, clear the previous selection
  void selectSingle(T item) {
    final newValue = value.copyWith(
      selected: {item},
    );
    value = newValue;
  }

  /// Add an item to the selection
  void select(T item) {
    final newValue = value.copyWith(
      selected: value.selected.union({item}),
    );
    value = newValue;
  }

  /// Remove an item from the selection
  void deselect(T item) {
    final newValue = value.copyWith(
      selected: value.selected.difference({item}),
    );
    value = newValue;
  }

  /// Clear the selection
  void clear() {
    final newValue = value.copyWith(
      selected: {},
    );
    value = newValue;
  }

  /// Set the params, will trigger the getItems function
  void setParam(Map<String, dynamic> params) {
    final newValue = value.copyWith(
      params: params,
    );
    value = newValue;
  }

  /// Close the sheet
  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Save the selection
  void save(BuildContext context) {
    config.onSelected?.call(value.selected.toList());
    Navigator.of(context).pop();
  }
}

/// The value of the controller
class SelectionState<T> extends Equatable {
  final Set<T> selected;
  final Map<String, dynamic> params;
  final SelectionSheetConfig<T> config;

  const SelectionState({
    required this.config,
    required this.selected,
    this.params = const {},
  });

  SelectionState<T> copyWith({
    Set<T>? selected,
    Map<String, dynamic>? params,
  }) {
    return SelectionState(
      selected: selected ?? this.selected,
      params: params ?? this.params,
      config: config,
    );
  }

  @override
  List<Object?> get props => [selected, params, config];
}
