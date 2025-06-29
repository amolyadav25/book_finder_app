
class ApiPath {
  ApiPath._();
  static const String baseUrl = "https://openlibrary.org/";
  static String searchUrl(String query) => "search.json?$query";
}