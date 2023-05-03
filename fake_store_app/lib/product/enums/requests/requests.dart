enum RequestPath {
  products('products');

  final String value;
  const RequestPath(this.value);

  String get withSlash => '/$value';
  String get withQuestionMark => '?$value=';
  String get withDot => '.$name';
  String get rawValue => "$name/";
}
