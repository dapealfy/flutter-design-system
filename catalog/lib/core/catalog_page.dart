import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
    required this.title,
    this.description,
    required this.child,
  });

  final String title;
  final String? description;
  final Widget child;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool _isSeeMoreDesc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: kIsWeb
          ? null
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  context.read<StoryNotifier>().currentStoryName = 'Home';
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
            ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (kIsWeb) const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.description != null)
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // Show / Hide See More
                          final tp = TextPainter(
                            text: TextSpan(
                              text: widget.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            textDirection: TextDirection.ltr,
                          )..layout(maxWidth: constraints.maxWidth - 32);

                          final numLines = tp.computeLineMetrics().length;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  widget.description!,
                                  maxLines: _isSeeMoreDesc ? null : 3,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              if (numLines > 3)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isSeeMoreDesc = !_isSeeMoreDesc;
                                      });
                                    },
                                    child: Text(
                                      _isSeeMoreDesc ? 'See Less' : 'See More',
                                      style: FunDsTypography.body12.copyWith(
                                        color: FunDsColors.colorBlue600,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: widget.child,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
