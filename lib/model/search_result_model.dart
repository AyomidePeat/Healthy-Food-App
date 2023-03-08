class SearchResult {
  final String name;
 //
 // final String images;
  
  SearchResult({this.name,  });
//this.images,
  factory SearchResult.fromJson(dynamic json) {
    return SearchResult(
      name: json['name'] as String,
     // images: json['images'][0]['hostedLargeUrl'] as String,
     
    );
  }
  static List<SearchResult> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return SearchResult.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'SearchResult{name:$name,  }'; //image:$images,
  }
}
