abstract class CoinManagerDelegate {
  void didUpdate(CoinManager coinManager, double rate);
  void didFail(Error error);
}

class CoinManager {
  final CoinManagerDelegate delegate;

  CoinManager(this.delegate);

  void doAction(bool value) =>
      value ? delegate.didUpdate(this, 10.10) : delegate.didFail(Error());
}

abstract class RateManagerDelegate {
  void updateRate(RateManager rateManager, double rate);
}

class RateManager {
  final RateManagerDelegate delegate;
  RateManager(this.delegate);

  void checkForUpdates() {
    const newRate = 230.0;
    delegate.updateRate(this, newRate);
  }
}

class ViewController with CoinManagerDelegate, RateManagerDelegate {
  CoinManager coinManager;
  RateManager rateManager;

  ViewController() {
    coinManager = CoinManager(this);
    rateManager = RateManager(this);
  }

  void doDelegatedAction(int number) =>
      number < 10 ? coinManager.doAction(true) : coinManager.doAction(false);

  void checkTheRate() => rateManager.checkForUpdates();

  @override
  void didUpdate(CoinManager manager, double rate) {
    print('rate calculated from the delegate is: $rate');
  }

  @override
  void didFail(Error error) {
    print('the error that occurred in delegate was: ${error.toString()}');
  }

  @override
  void updateRate(RateManager manager, double rate) {
    print('I do my thing with the retrieved rate upon change $rate');
  }
}

void main() {
  final worker = ViewController();
  worker.doDelegatedAction(10);
  worker.doDelegatedAction(25);
}
