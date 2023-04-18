import 'package:flutter/material.dart';

class FavIconProviderClass with ChangeNotifier {
  Icon _favIcon = const Icon(Icons.favorite_border);

  Icon get favIcon => _favIcon;

  void setFavIcon(bool isFav) {
    if (isFav) {
      _favIcon = const Icon(Icons.favorite);
    } else {
      _favIcon = const Icon(Icons.favorite_border);
    }
    notifyListeners();
  }
}
