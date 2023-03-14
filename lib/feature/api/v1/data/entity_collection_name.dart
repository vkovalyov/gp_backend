enum EntityCollectionName {
  categories,

}

extension EntityCollectionNameExtension on EntityCollectionName {
  String get name {
    switch (this) {
      case EntityCollectionName.categories:
        return 'categories';
    }
  }
}
