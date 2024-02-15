import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

const description = '''
Widget name: Tips

How to use:

final FunOverlayController _controller = FunOverlayController();

Tips.tipsOverlay(
  context,
  controller: _controller,
  title: 'Akses bantuan lebih mudah 👌🏻',
  description:
      'Martha care siap membantu kapanpun dibutuhkan. Cukup klik tombol bantuan ini ya.',
  child: const Text('Your Widget To Focus'),
),

// Showing Tips
_controller.show();

// Hiding Tips
_controller.hide();

''';

class TipsCatalog extends StatefulWidget {
  const TipsCatalog({super.key});

  @override
  State<TipsCatalog> createState() => _TipsCatalogState();
}

class _TipsCatalogState extends State<TipsCatalog> {
  final FunOverlayController _controller1 = FunOverlayController();
  final FunOverlayController _controller2 = FunOverlayController();
  final FunOverlayController _controller3 = FunOverlayController();
  final FunOverlayController _controller4 = FunOverlayController();

  /// In Practice, when you want to create tips chain,
  /// You can put this code on ViewModel so it can be accessed by any child widget

  int _currentTipsIdx = -1;
  List<FunOverlayController> _controllerChains = [];

  void showTipsChain(List<FunOverlayController> controlles) {
    _currentTipsIdx = 0;
    _controllerChains = controlles;

    _controllerChains[_currentTipsIdx].show();
  }

  void nextTips() {
    _controllerChains[_currentTipsIdx].hide();
    if (_currentTipsIdx < _controllerChains.length - 1) {
      _currentTipsIdx += 1;
      _controllerChains[_currentTipsIdx].show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Tips',
      description: description,
      child: Column(
        children: [
          FunDsButton(
            type: FunDsButtonType.xSmall,
            variant: FunDsButtonVariant.primary,
            text: 'Show Tips',
            onPressed: () {
              showTipsChain([
                _controller1,
                _controller2,
                _controller3,
                _controller4,
              ]);
            },
          ),
          Row(
            children: [
              Tips.tipsOverlay(
                context,
                controller: _controller1,
                title: 'Akses bantuan lebih mudah 👌🏻',
                description:
                    'Martha care siap membantu kapanpun dibutuhkan. Cukup klik tombol bantuan ini ya.',
                onClose: () {
                  nextTips();
                },
                child: const FunDsChip(
                  type: FunDsChipType.small,
                  text: 'Kiri',
                  leading: FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 20,
                  ),
                ),
              ),
              const Spacer(),
              Tips.tipsOverlay(
                context,
                controller: _controller2,
                title: 'Halaman Tanggung Renteng',
                description:
                    'Kini kamu bisa melihat semua detail tanggung renteng pada halaman ini.',
                onClose: () {
                  nextTips();
                },
                child: const FunDsChip(
                  type: FunDsChipType.small,
                  text: 'Kanan',
                  trailing: FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 200),
          Tips.tipsOverlay(
            context,
            controller: _controller3,
            title: 'Musang',
            description: 'Musang adalah kelompok mamalia kecil, ramping, dan '
                'kebanyakan nokturnal yang berasal dari Asia tropis dan '
                'Afrika, terutama hutan tropis. ',
            onClose: () {
              nextTips();
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/4/4e/Civet.JPG',
                      width: 84,
                      height: 84,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                          'Musang adalah kelompok mamalia kecil, ramping, dan '
                          'kebanyakan nokturnal yang berasal dari Asia tropis dan '
                          'Afrika, terutama hutan tropis. '),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 700,
          ),
          Tips.tipsOverlay(
            context,
            title: 'Very Long Title That Long Long Very Long Title Long Title',
            description:
                'Martha care siap membantu kapanpun dibutuhkan. Cukup klik tombol bantuan ini ya.',
            controller: _controller4,
            child: const Text('Di bawah ada apa nih?'),
          ),
        ],
      ),
    );
  }
}
