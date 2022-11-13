import 'package:flutter_riverpod/flutter_riverpod.dart';

class Film {
  final String title;
  final String id;
  final String description;
  late final bool isFav;
  Film({
    required this.description,
    required this.id,
    this.isFav = false,
    required this.title,
  });
  Film copy(bool isFavorite) =>
      Film(description: description, id: id, title: title, isFav: isFavorite);
  @override
  String toString() {
    return '$id,$title,$description, $isFav ';
  }

  @override
  bool operator ==(covariant Film other) =>
      id == other.id && isFav == other.isFav;
  @override
  int get hashCode => Object.hashAll([id, isFav]);
}

List<Film> myFilmList = [
  Film(
    title: 'Holy Ghost',
    id: '1',
    description: 'Gospel movie recorded in Ibadan',
  ),
  Film(
    title: 'Mafia',
    id: '2',
    description: 'gang movie',
  ),
  Film(
    title: 'messi lionel',
    id: '3',
    description: 'story of the greatest footballer',
  ),
  Film(
    title: 'barca vs Liverpool',
    id: '4',
    description: 'story of comebacks',
  ),
  Film(
    title: 'mighty',
    id: '5',
    description: 'war season story',
  ),
  Film(
    title: 'mogoses',
    id: '6',
    description: 'The Mongolian story of war',
  ),
  Film(
    title: 'Legend of witch',
    id: '7',
    description: 'fictional story of witches',
  ),
];
