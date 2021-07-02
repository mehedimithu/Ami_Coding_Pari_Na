import 'package:ami_coding_pari_na/data/rest_data.dart';
import 'package:ami_coding_pari_na/models/user.dart';

abstract class SignupPageContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class SignupPagePresenter {
  SignupPageContract _view;
  RestData api = new RestData();
  SignupPagePresenter(this._view);

  doSignup(String username, String password) {
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError.toString()));
  }
}
