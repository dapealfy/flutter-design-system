class FunDsOverlayController {
  FunDsOverlayInteractor? _interactor;

  void attach(FunDsOverlayInteractor target) {
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

abstract class FunDsOverlayInteractor {
  void onShow();
  void onHide();
  void onToggle();
}
