class AppApiPaths {
  static const getUsers = "getUsers";
  static const passengers = "/photos";
  static const upcoming = "/movie/upcoming";
  static String movieDetail(String id) => "/movie/$id";
  static String movieImages(String id) => "/movie/$id/images";
  static String movieVideos(String id) => "/movie/$id/videos";
}
