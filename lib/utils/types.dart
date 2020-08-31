class FirebaseImage {
  String src;
  String title;

  FirebaseImage(dynamic doc) {
    this.src = doc['src'];
    this.title = doc['title'];
  }
}