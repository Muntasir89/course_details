String getFirst200Chars(String text) {
  text = "${text.substring(0, 200).trim()}...";
  return text;
}
