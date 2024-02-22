class FunOverlayController {
  FunOverlayInteractor? _interactor;

  void attach(FunOverlayInteractor target) {
    _interactor = target;
  }

  void detach() {
    _interactor = null;
  }

  void show() {
    _interactor?.onShow();
  }

  void hide() {
    _interactor?.onHide();
  }

  void toggle() {
    _interactor?.onHide();
  }
}

abstract class FunOverlayInteractor {
  void onShow();
  void onHide();
  void onToggle();
}
