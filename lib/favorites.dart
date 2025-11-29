import 'package:flutter/material.dart';
import 'package:namer_app/appstate.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesState();
}

class _FavoritesState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(child: Text('You have no favorites'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: 
          Text(
            'You have '
            '${appState.favorites.length} favorites:',
          ),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
    );

    // return Center(
    // child:
    // return ListView(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.all(20),
    //       child: Text('you have ${favorites.length} favorites:'),
    //     ),
    //     for (var pair in favorites)
    //       ListTile(
    //         onTap: () {
    //           // setState(() {
    //             appState.removeFavorite(pair);
    //           // });
    //         },
    //         leading: Icon(Icons.favorite),
    //         title: Text(pair.asLowerCase),
    //       ),
    //     // ListTile(
    //     // onTap: () {
    //     // setState(() {
    //     //   appState.removeFavorite(favorites[index]);
    //     // });
    //     // },
    //     // title: Text('${favorites[index]}'),
    //     // ),
    //     // ),
    //   ],
    // );

    // child: ListView.builder(
    //   itemCount: favorites.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       onTap: () {
    //         setState(() {
    //           appState.removeFavorite(favorites[index]);
    //         });
    //       },
    //       title: Text('${favorites[index]}'),
    //     );
    //   },
    // ),
    // );
  }
}
