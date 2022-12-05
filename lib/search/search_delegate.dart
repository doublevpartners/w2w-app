import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class CitySearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "Buscar Ciudad";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = '',
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(
      'BuildResults',
      style: TextStyle(color: Colors.blue),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: const Center(
            child: Icon(
          Icons.map_outlined,
          color: Colors.black45,
          size: 130,
        )),
      );
    }
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          fillColor: AppTheme.primary,
          filled: true),
    );
  }
}
