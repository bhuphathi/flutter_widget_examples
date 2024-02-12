import 'package:flutter/material.dart';

class AutoCompleteSearchList<T extends Object> extends StatelessWidget {
  const AutoCompleteSearchList({
    super.key,
    required this.options,
    required this.displayStringForOption,
  });

  final List<T> options;
  final String Function(T option) displayStringForOption;

//   static const List<User> _options = <User>[
//     User(name: 'Alice', email: 'alice@example.com'),
//     User(name: 'Bob', email: 'bob@example.com'),
//     User(name: 'Charlie', email: 'charlie123@gmail.com'),
//   ];

//   static String _displayStringForOption(T option) => option.name;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return options.where((T option) {
          // Search based on User.toString, which includes both name and
          // email, even though the display string is just the name.
          return option.toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      //   displayStringForOption: displayStringForOption,
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
          FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          //   onFieldSubmitted: (String value) {onFieldSubmitted();},
        );
      },
      optionsViewBuilder:
          (BuildContext context, AutocompleteOnSelected<T> onSelected, Iterable<T> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: options.length * 33,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final T option = options.elementAt(index);
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onSelected(option),
                    child: ListTile(
                      hoverColor: Colors.black12,
                      minVerticalPadding: 0,
                      dense: true,
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      title: Text(displayStringForOption(option)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
