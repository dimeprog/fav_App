import 'package:fav_app/models/film.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilmNotifier extends StateNotifier<List<Film>> {
  FilmNotifier() : super(myFilmList);

  void upDate(Film film, bool isFav) {
    state = state
        .map((thisFilm) =>
            thisFilm.id == film.id ? thisFilm.copy(isFav) : thisFilm)
        .toList();
  }
}
