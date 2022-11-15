import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu_10_moviedb_1/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '0fc5740199faa752da813c8c97f659e8';
  String baseUrl = 'https://aou.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
