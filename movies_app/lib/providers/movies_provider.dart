import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/helpers/debouncer.dart';
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'adb88a47856c71ed204b153d2cf91c81';
  final String _baseUrl = 'api.themoviedb.org';
  final String _len = 'en-US';
  int _popularPage = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  final debauncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestedController =
      new StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream => this._suggestedController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  void getOnDisplayMovies() async {
    final String jsonData = await _getJsonData('3/movie/now_playing');
    final nowResponse = NowPlayingResponse.fromRawJson(jsonData);
    onDisplayMovies = nowResponse.results;

    notifyListeners();
  }

  void getPopularMovies() async {
    _popularPage++;
    final String jsonData =
        await _getJsonData('3/movie/popular', _popularPage.toString());

    final nowResponse = PopularResponse.fromRawJson(jsonData);
    popularMovies = [...popularMovies, ...nowResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final String jsonData = await _getJsonData('3/movie/${movieId}/credits');
    final creditsResponse = CreditsResponse.fromRawJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    Uri url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _len, 'page': '1', 'query': query});

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromRawJson(response.body);

    return searchResponse.results;
  }

  Future<String> _getJsonData(String endpoint, [String page = '1']) async {
    Uri url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _len, 'page': page});

    final response = await http.get(url);
    return response.body;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debauncer.value = '';
    debauncer.onValue = (value) async {
      final results = await searchMovies(value);
      _suggestedController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debauncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((value) => timer.cancel());
  }
}
