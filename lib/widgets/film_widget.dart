import 'package:fav_app/models/film.dart';
import 'package:fav_app/providers/flim_providers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilmWidget extends StatelessWidget {
  AlwaysAliveProviderBase<Iterable<Film>> provider;
  FilmWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final films = ref.watch(provider);
        return Expanded(
          child: ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              final currentFilm = films.elementAt(index);
              final favIcon = currentFilm.isFav
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border);
        
              return ListTile(
                title: Text(currentFilm.title),
                subtitle: Text(currentFilm.description),
                trailing: IconButton(
                    onPressed: () {
                      final isFavourite = !currentFilm.isFav;
                      ref
                          .read(allFilmsProvider.notifier)
                          .upDate(currentFilm, isFavourite);
                    },
                    icon: favIcon),
              );
            },
          ),
        );
      },
    );
  }
}
