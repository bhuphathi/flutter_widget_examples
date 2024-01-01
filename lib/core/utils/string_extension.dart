extension StringCasingExtension on String {
  ///capitalize first character of this string: 'capitalize' => 'Capitalize'
  String toCapitalize() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  ///capitalize first character of all words in this sentence: 'This is a title' => 'This Is A Title'
  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalize()).join(' ');

  ///remove all special characters in the list
  String removeSpecialCharaters(List<String> charsToRemove) {
    //add escape to all special characters
    var specialCharacters = charsToRemove.map((e) => "\\$e").toList();
    var regexPattern = specialCharacters.join("|");
    return replaceAll(RegExp(regexPattern), '');
  }

  ///split at capitial letters
  ///'thisIsACamelCaseString' => 'This Is A Camel Case String'
  String splitCamelCase() {
    return split(RegExp(r'(?=[A-Z])')).map((e) => e.toCapitalize()).join(' ');
  }

  String toCamelCase() {
    var string = length > 0 ? '${this[0].toLowerCase()}${substring(1)}' : '';
    return string.replaceAll(RegExp(r"\s+"), "");
  }
}
