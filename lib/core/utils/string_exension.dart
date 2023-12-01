extension StringCasingExtension on String {
  ///capitalize first character of this string: 'capitalize' => 'Capitalize'
  String toCapitalize() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  ///capitalize first character of all words in this sentence: 'This is a title' => 'This Is A Title'
  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalize()).join(' ');
}
