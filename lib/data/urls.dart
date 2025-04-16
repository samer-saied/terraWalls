class AppUrls {
  static const String unsplash = 'https://api.unsplash.com/';
  static const String photos = "photos/";
  static const String secretApi = 'i7l5-MODTxszHsekaXp0co7eY9vTGIpakfsxLg2pvWY';

  static getFullUrl({ String? query, required int pageNo}) {
    // return '${unsplash}search/$photos?query=$query&page=$pageNo&client_id=$secretApi';
    return query == null
        ? 'https://terrawalls-ten.vercel.app/images'
        : '${unsplash}search/$photos?query=$query&page=$pageNo&client_id=$secretApi';
  }
}
