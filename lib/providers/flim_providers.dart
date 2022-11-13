import 'package:fav_app/film_controller.dart';
import 'package:fav_app/models/film.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilmStatus { all, favourite, notFavourite }

// film status provider
final FilmStatusProvider = StateProvider<FilmStatus>((ref) => FilmStatus.all);

//  all films provider
final allFilmsProvider =
    StateNotifierProvider<FilmNotifier, List<Film>>((ref) => FilmNotifier());

//  favourite provider watches for changes in the all films provider since the  for where the film isfav value is true
final favouriteProvider = Provider<Iterable<Film>>(
  (ref) => ref.watch(allFilmsProvider).where((film) => film.isFav == true),
);
// not favourite provider watches for changes in the all films provider since the  for where the film isfav value is false
final notfavouriteProvider = Provider<Iterable<Film>>(
  (ref) => ref.watch(allFilmsProvider).where((film) => film.isFav == false),
);
