import 'dart:convert';
import 'package:ami_coding_pari_na/models/chobi_response.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final getUri = Uri.https('jsonplaceholder.typicode.com', '/photos');

  Future<List<Chobi>> getChobi() async {
    http.Response res = await http.get(getUri);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Chobi> chobi =
          body.map((dynamic item) => Chobi.fromJson(item)).toList();
      return chobi;
    } else {
      throw "Can not get the chobi.";
    }
  }
}
