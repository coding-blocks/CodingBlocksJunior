class FirebaseImage {
  final String src;
  final String title;

  FirebaseImage({
    this.src = 'http://minio-i.codingblocks.com/img/default-anon.jpg',
    this.title = ''
  });

  static fromDynamicData (dynamic doc) {
    return doc == null ? FirebaseImage() : FirebaseImage(src: doc['src'], title: doc['title']);
  }
}