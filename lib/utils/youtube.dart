String videoIdFromUrl (String url) {
  final regex = RegExp(r'.*\?v=(.+?)($|[\&])', caseSensitive: false, multiLine: false);
  if (regex.hasMatch(url)) {
    final videoId = regex.firstMatch(url).group(1);
    return videoId;
  } else {
    return null;
  }
}