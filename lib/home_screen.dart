import 'package:fav_app/providers/change_notifier.dart';
import 'package:fav_app/providers/flim_providers.dart';
import 'package:fav_app/widgets/film_selection_dropdown.dart';
import 'package:fav_app/widgets/film_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Films'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              icon: Icon(Icons.next_plan_outlined))
        ],
      ),
      body: Column(children: [
        const FilmDropdownMenu(),
        Consumer(builder: (context, ref, child) {
          final status = ref.watch(FilmStatusProvider);
          switch (status) {
            case FilmStatus.all:
              return FilmWidget(provider: allFilmsProvider);
            case FilmStatus.favourite:
              return FilmWidget(provider: favouriteProvider);
            case FilmStatus.notFavourite:
              return FilmWidget(provider: notfavouriteProvider);
          }
        }),
      ]),
    );
  }
}
