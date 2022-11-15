import 'package:my_country/models/app_model.dart';
import 'package:http/http.dart' as http;

class WebCall {
  Future<List<Explore>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return exploreFromJson(json);
    }
    return throw Exception(response
        .statusCode); //Checks if there's an error in getting json data from API
  }
}
