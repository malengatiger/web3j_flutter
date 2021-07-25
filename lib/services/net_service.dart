import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot;
import 'package:web3j_flutter/util/generic_functions.dart';

final NetService netService = NetService.instance;
class NetService {
  static final NetService instance = NetService._privateConstructor();
  static const mm = '🕖 🕗 🔵 NetService: 🔵 ';
  NetService._privateConstructor() {
    pp('$mm ... NetService._privateConstructor has been initialized :  🌺 '
        '${DateTime.now().toIso8601String()} 🌺');
  }
  var client = http.Client();

  String getBaseURL()  {
    var status = dot.dotenv.env['status'];
    String? url;
    if (status == 'dev') {
      url =  dot.dotenv.env['devURL'];
    } else {
      url =  dot.dotenv.env['prodURL'];
    }
    return url!;
  }

  Future<http.Response> post({required String suffix, required Map<String, dynamic> body}) async {
    var base = getBaseURL();
    var url = '$base$suffix';
    try {
      var uriResponse = await client.post(Uri.parse(url),
          body: body);
     if (uriResponse.statusCode == 200) {
        print(' 😎  😎  😎  POST call is A-OK! statusCode: ${uriResponse.statusCode}');
     }
     return uriResponse;
    } catch(e) {
      throw 'POST failed: $e';
    }
  }
  Future<http.Response> get({required String suffix}) async {
    var base = getBaseURL();
    var url = '$base$suffix';
    try {
      var uriResponse = await client.get(Uri.parse(url));
      if (uriResponse.statusCode == 200) {
        print(' 😎  😎  😎  GET call is A-OK! statusCode: ${uriResponse.statusCode}');
        print(' 😎  😎  😎  body: ${uriResponse.body.toString()}');
      } else {
        print('👺 👺 👺 👺  statusCode: ${uriResponse.statusCode} ERROR: ${uriResponse.body.toString()}');
      }
      return uriResponse;
    } catch(e) {
      throw 'POST failed: $e';
    }
  }
}