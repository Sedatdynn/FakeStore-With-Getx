enum RouteEnum {
  search('search'),
  detail('details'),
  settings('settings');

  const RouteEnum(this.value);
  final String value;

  String get withSlash => '/$value';
  String get withQuestionMark => '?$value=';
  String get withDot => '.$name';
}
