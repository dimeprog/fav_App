import 'package:fav_app/models/film.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class filmChangeNotifier extends ChangeNotifier {
  List<Film> _films = myFilmList;
  List<Film> get films => _films;

  void update(Film film, bool isFavourite) {
    _films = _films
        .map((thisFilm) =>
            thisFilm.id == film.id ? thisFilm.copy(isFavourite) : thisFilm)
        .toList();
    notifyListeners();
  }
}

final filmChangeNotifierProvider =
    ChangeNotifierProvider<filmChangeNotifier>((ref) => filmChangeNotifier());

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(filmChangeNotifierProvider).films;
    final isMore = ref.watch(displayOptionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('changeNotifier'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: isMore ? films.getRange(0, 4).length : films.length,
              itemBuilder: (context, i) {
                final curFilm = films[i];
                final favIcon = curFilm.isFav
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border);
                return ListTile(
                  title: Text(curFilm.title),
                  subtitle: Text(curFilm.description),
                  trailing: IconButton(
                      onPressed: () {
                        final isFav = !curFilm.isFav;
                        ref
                            .read(filmChangeNotifierProvider.notifier)
                            .update(curFilm, isFav);
                      },
                      icon: favIcon),
                );
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(displayOptionProvider.notifier).state = !isMore;
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70))),
            label: const Text('more'),
            icon: const Icon(Icons.more),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     ref.read(displayOptionProvider.notifier).state = !isMore;
      //   },
      //   label: const Text('more'),
      //   icon: const Icon(Icons.more),
      // ),
    );
  }
}

final displayOptionProvider = StateProvider<bool>((ref) => true);
