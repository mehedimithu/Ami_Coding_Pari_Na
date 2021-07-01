import 'package:ami_coding_pari_na/models/user.dart';

import 'network_util.dart';

class RestData {
  NetworkUtil _netUtil = NetworkUtil();

  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password){
    return null;
  }
}
