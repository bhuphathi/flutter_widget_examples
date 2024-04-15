import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppleScrollDropdown extends StatefulWidget {
  @override
  _AppleScrollDropdownState createState() =>
      _AppleScrollDropdownState();
}

class _AppleScrollDropdownState extends State<AppleScrollDropdown> {
  int _selectedItemIndex = 0;
  List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apple-like Scroll Dropdown'),
      ),
      body: Center(
        child: CupertinoPicker(
          itemExtent: 40, // Height of each item
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedItemIndex = index;
            });
          },
          children: _dropdownItems
              .map((item) => Center(child: Text(item)))
              .toList(),
          looping: true, // Whether the list should loop
          diameterRatio: 1.2, // A larger value makes items smaller
          squeeze: 1.2, // A larger value makes items wider
          useMagnifier: true, // Magnifies the selected item
          magnification: 1.2, // Magnification factor
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Selected item: ${_dropdownItems[_selectedItemIndex]}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
