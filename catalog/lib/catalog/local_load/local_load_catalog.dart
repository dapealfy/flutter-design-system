import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''
Widget name: FunDsLocalLoad

Usage

FunDsLocalLoad(
  onRefreshTap: () {
    ScaffoldMessenger.of(context).showSnackBar(
     // Do something
  },
);


Customization

FunDsLocalLoad(
  titleText: titleText,
  descriptionText: descriptionText,
  refreshText: refreshText,
  illustration: FunDsIcon(
    funDsIconography: FunDsIconography.actionIcCloud,
    size: 24.w,
  ),
  onRefreshTap: () {
   // Do something
  },
),
''';

class LocalLoadCatalog extends StatelessWidget {
  const LocalLoadCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final titleText = context.knobs.text(
      label: 'Title Text',
      initial: 'Loh kok gagal',
    );

    final descriptionText = context.knobs.text(
      label: 'Description Text',
      initial:
          'Terjadi kesalahan sistem, coba berdoa dan beli kuota untuk mencoba lagi.',
    );

    final refreshText = context.knobs.text(
      label: 'Refresh Text',
      initial: 'Coba lagi',
    );

    return CatalogPage(
      title: 'Local Load',
      description: _desc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Example dafault',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          FunDsLocalLoad(
            onRefreshTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refresh'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Example custom text',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          FunDsLocalLoad(
            titleText: titleText,
            descriptionText: descriptionText,
            refreshText: refreshText,
            onRefreshTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refresh'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Example No Button Custom Illustration',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          FunDsLocalLoad(
            titleText: titleText,
            descriptionText: descriptionText,
            refreshText: refreshText,
            illustration: FunDsIcon(
              funDsIconography: FunDsIconography.actionIcCloud,
              size: 24.w,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Interactive Example',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const LocalLoadExample(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class LocalLoadExample extends StatefulWidget {
  const LocalLoadExample({super.key});

  @override
  State<LocalLoadExample> createState() => _LocalLoadExampleState();
}

class _LocalLoadExampleState extends State<LocalLoadExample> {
  Result<String> _result = const Result.initial();

  bool _switch = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      _result = const Result.loading();
    });

    await Future.delayed(const Duration(seconds: 2));

    if (_switch) {
      setState(() {
        _result = const Result.error('Error');
      });
    } else {
      setState(() {
        _result = const Result.success('You got the data');
      });
    }
    _switch = !_switch;
  }

  @override
  Widget build(BuildContext context) {
    if (_result is Loading || _result is Initial) {
      return const FunDsLoader(
        width: 24,
        height: 24,
        variant: FunDsLoaderVariant.dot,
        position: FunDsLoaderPosition.top,
        desc: 'Loading',
      );
    }

    if (_result is ResultError) {
      // Show local load
      return FunDsLocalLoad(
        onRefreshTap: fetchData,
      );
    }

    if (_result is Success) {
      return Card(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text('Success'),
            Text((_result as Success).data),
            FunDsButton(
              type: FunDsButtonType.xSmall,
              variant: FunDsButtonVariant.primary,
              text: 'Refresh',
              onPressed: fetchData,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    }

    return const SizedBox();
  }
}

// Result Class
sealed class Result<T> {
  const Result._();

  const factory Result.initial() = Initial<T>;

  const factory Result.loading() = Loading<T>;

  const factory Result.success(T value) = Success<T>;

  const factory Result.error(dynamic error, [StackTrace? stackTrace]) =
      ResultError<T>;
}

class Initial<T> extends Result<T> {
  const Initial() : super._();
}

class Loading<T> extends Result<T> {
  const Loading() : super._();
}

class ResultError<T> extends Result<T> {
  const ResultError(
    this.error, [
    this.stackTrace,
  ]) : super._();

  final dynamic error;
  final StackTrace? stackTrace;

  void rethrowError() {
    if (error is Error) {
      Error.throwWithStackTrace(error, stackTrace ?? StackTrace.current);
    } else {
      throw error;
    }
  }
}

class Success<T> extends Result<T> {
  const Success(this.data) : super._();

  final T data;
}
