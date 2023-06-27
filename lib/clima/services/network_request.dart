import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkRequest {
  final String url;

  NetworkRequest(this.url);

  Future execute() async {
    http.Response? response;

    try {
      response = await http.get(Uri.parse(url));
    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Problem communicating with server 😱");
    } on FormatException {
      print("Bad response format 👎");
    } catch (e) {
      print('Some error happened 🤷');
    }

    if (response?.statusCode == 200) {
      return jsonDecode(response!.body);
    } else {
      print(response?.statusCode);
      return null;
    }
  }
}
