import 'package:harmony/widgets/state_container.dart';

class HomeViewModel extends LocalViewModel {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    update(() {});
  }
}
