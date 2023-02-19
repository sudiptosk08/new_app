class API {
  
  static const base = "http://api.quran.com/api/v3/";

  static search({q = "", size = "20",page = ""}) =>
      'search?q=$q&size=$size&page=$page&language=en';

}
