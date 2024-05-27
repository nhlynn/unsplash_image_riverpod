import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkService {
  Future<Response> getImageSearch(String query) async {
    Map<String, dynamic> param = {
      'query': query,
      'per_page': '30',
      'client_id': 'TLri7glOpT7lEDbyuKe-a-3IlZEE-rS70Bo_lxxMe08'
    };
    var url = Uri.http(
      'api.unsplash.com',
      'search/photos',
      param,
    );

    var response = await http.get(url);

    return response;
  }
}
