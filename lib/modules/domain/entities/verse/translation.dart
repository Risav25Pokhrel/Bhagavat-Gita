class Translation {
  final String description;
  final String authorName;
  final String language;
  Translation(
      {required this.language,
      required this.description,
      required this.authorName});

  @override
  bool operator ==(covariant Translation other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.authorName == authorName &&
      other.language == language;
  }

  @override
  int get hashCode => description.hashCode ^ authorName.hashCode ^ language.hashCode;
}
