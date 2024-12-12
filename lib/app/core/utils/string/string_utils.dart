String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}


String extractId(String filePath) {
  final regex = RegExp(r'id=([a-zA-Z0-9_-]+)');
  final match = regex.firstMatch(filePath);
  return match != null ? match.group(1)! : '';
}
