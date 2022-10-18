class SearchRecent {
  int id;
  String keyword;
  SearchRecent({
    required this.id,
    required this.keyword,
  });

  factory SearchRecent.fromJson(Map<String, dynamic> json) => SearchRecent(
        id: json["id"] ?? '',
        keyword: json["keyword"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
      };

  SearchRecent copyWith({
    int? id,
    String? keyword,
  }) {
    return SearchRecent(
      id: id ?? this.id,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  String toString() => 'SearchRecent(id: $id, keyword: $keyword)';
}
