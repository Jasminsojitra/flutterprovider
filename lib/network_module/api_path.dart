
enum APIPath {
  fetch_album,
  fetch_user,
}

class APIPathHelper{
  static String getValue(APIPath path){
    switch(path){
      case APIPath.fetch_album: 
        return "/albums/1";
      case APIPath.fetch_user:
        return "/users";
      default:
        return "";
    }
  }
}
