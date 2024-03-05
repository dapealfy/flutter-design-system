part of 'select.dart';

typedef GetItems<T> = Future<List<T>> Function(SelectController<T> controller);
typedef ItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  bool selected,
  SelectController<T> controller,
);
typedef OnSelected<T> = void Function(List<T> selected);
typedef SelectionWidgetBuilder<T> = Widget Function(
    BuildContext context, SelectController<T> controller);

typedef ErrorWidgetBuilder<T> = Widget Function(
    BuildContext context, dynamic error, SelectController<T> controller);

class SelectionSheetConfig<T> {
  /// The function to get the items
  /// You can use controller.params to pass the parameters
  final GetItems<T> getItems;

  /// The function to build the item
  final ItemBuilder<T> itemBuilder;

  final void Function(List<T> selected)? onSelected;

  final WidgetBuilder? separatorBuilder;

  final SelectionWidgetBuilder<T>? headerBuilder;

  final SelectionWidgetBuilder<T>? footerBuilder;

  final SelectionWidgetBuilder<T>? loadingBuilder;

  final SelectionWidgetBuilder<T>? emptyBuilder;

  final ErrorWidgetBuilder<T>? errorBuilder;

  SelectionSheetConfig({
    required this.getItems,
    required this.itemBuilder,
    this.onSelected,
    this.separatorBuilder,
    this.headerBuilder,
    this.footerBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
  });

  SelectionSheetConfig<T> copyWith({
    GetItems<T>? getItems,
    ItemBuilder<T>? itemBuilder,
    WidgetBuilder? separatorBuilder,
    Function(List<T> selected)? onSelected,
    SelectionWidgetBuilder<T>? headerBuilder,
    SelectionWidgetBuilder<T>? footerBuilder,
    SelectionWidgetBuilder<T>? loadingBuilder,
    SelectionWidgetBuilder<T>? emptyBuilder,
    ErrorWidgetBuilder<T>? errorBuilder,
  }) {
    return SelectionSheetConfig<T>(
      getItems: getItems ?? this.getItems,
      itemBuilder: itemBuilder ?? this.itemBuilder,
      onSelected: onSelected ?? this.onSelected,
      separatorBuilder: separatorBuilder ?? this.separatorBuilder,
      headerBuilder: headerBuilder ?? this.headerBuilder,
      footerBuilder: footerBuilder ?? this.footerBuilder,
      loadingBuilder: loadingBuilder ?? this.loadingBuilder,
      emptyBuilder: emptyBuilder ?? this.emptyBuilder,
      errorBuilder: errorBuilder ?? this.errorBuilder,
    );
  }
}
