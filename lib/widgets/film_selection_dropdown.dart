import 'package:fav_app/providers/flim_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilmDropdownMenu extends ConsumerWidget {
  const FilmDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return DropdownButton<FilmStatus>(
          value: ref.watch(FilmStatusProvider),
          items: FilmStatus.values.map((status) {
            return DropdownMenuItem<FilmStatus>(
              value: status,
              child: Text(
                status.toString().split('.').last,
              ),
            );
          }).toList(),
          onChanged: (FilmStatus? val) {
            ref.read(FilmStatusProvider.notifier).state = val!;
          },
        );
      },
    );
  }
}
