class SearchModel {
  Search? search;

  SearchModel({this.search});

  SearchModel.fromJson(Map<String, dynamic> json) {
    search =
        json['search'] != null ? new Search.fromJson(json['search']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['search'] = this.search!.toJson();
    }
    return data;
  }
}

class Search {
  String? query;
  int? totalResults;
  int? currentPage;
  int? totalPages;
  List<Results>? results;

  Search(
      {this.query,
      this.totalResults,
      this.currentPage,
      this.totalPages,
      this.results});

  Search.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    totalResults = json['total_results'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    data['total_results'] = this.totalResults;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? verseKey;
  int? verseId;
  String? text;
  Null? highlighted;
  List<Words>? words;
  List<Translations>? translations;

  Results(
      {this.verseKey,
      this.verseId,
      this.text,
      this.highlighted,
      this.words,
      this.translations});

  Results.fromJson(Map<String, dynamic> json) {
    verseKey = json['verse_key'];
    verseId = json['verse_id'];
    text = json['text'];
    highlighted = json['highlighted'];
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words!.add(new Words.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verse_key'] = this.verseKey;
    data['verse_id'] = this.verseId;
    data['text'] = this.text;
    data['highlighted'] = this.highlighted;
    if (this.words != null) {
      data['words'] = this.words!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
  String? charType;
  String? text;

  Words({this.charType, this.text});

  Words.fromJson(Map<String, dynamic> json) {
    charType = json['char_type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['char_type'] = this.charType;
    data['text'] = this.text;
    return data;
  }
}

class Translations {
  String? text;
  int? resourceId;
  String? name;
  String? languageName;

  Translations({this.text, this.resourceId, this.name, this.languageName});

  Translations.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    resourceId = json['resource_id'];
    name = json['name'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['resource_id'] = this.resourceId;
    data['name'] = this.name;
    data['language_name'] = this.languageName;
    return data;
  }
}
