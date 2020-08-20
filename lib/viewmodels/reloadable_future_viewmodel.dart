import 'package:stacked/stacked.dart';

abstract class ReloadableFutureViewModel<T> extends DynamicSourceViewModel implements Initialisable {
  T _data;
  T get data => _data;

  dynamic _error;

  @override
  dynamic error([Object object]) => _error;

  bool get dataReady => _data != null && !hasError;
  bool get rethrowException => false;

  Future<T> futureToRun();

  Future loadData() async {
    _data = await runBusyFuture(futureToRun(), throwException: true)
      .catchError((error) {
        print(error);
        setError(error);
        _error = error;
        setBusy(false);
        onError(error);
        notifyListeners();
        if (rethrowException) {
          throw error;
        }
      });

    if (_data != null) {
      onData(_data);
    }

    notifyListeners();
  }

  Future initialise() async {
    setError(null);
    _error = null;
    setBusy(true);
    notifyListeners();

    loadData();

    changeSource = false;
  }

  void onError(error) {}

  void onData(T data) {}
}
