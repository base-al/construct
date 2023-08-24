import '../views/view.dart';

abstract class Controller {
  View view;

  Controller(this.view);

  String index() {
    return view.render('index.html');
  }
}
