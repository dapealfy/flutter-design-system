import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
    required this.title,
    this.description,
    this.disableScrollview = false,
    required this.child,
  });

  final String title;
  final String? description;
  final bool disableScrollview;
  final Widget child;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool _isSeeMoreDesc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            if (widget.description != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.description!,
                      maxLines: _isSeeMoreDesc ? null : 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
              ),
            const SizedBox(height: 32),
            Expanded(
              child: widget.disableScrollview
                  ? widget.child
                  : SingleChildScrollView(child: widget.child),
            ),
          ],
        ),
      ),
    );
  }
}
