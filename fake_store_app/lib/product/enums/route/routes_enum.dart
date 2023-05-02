enum RouteEnum {
  products('products'),
  search('search'),
  detail('details');

  const RouteEnum(this.value);
  final String value;

  String get withSlash => '/$value';
  String get withQuestionMark => '?$value=';
  String get withDot => '.$name';
}
