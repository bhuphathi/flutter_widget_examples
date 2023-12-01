import 'package:flutter_widget_examples/core/utils/responsove.dart';
import 'package:flutter_widget_examples/temp/searchbar.dart';
import 'package:flutter/material.dart';

import 'font_awesome_icons.dart';

class FontAwesomeGallery extends StatefulWidget {
  const FontAwesomeGallery({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FontAwesomeGalleryState();
}

class FontAwesomeGalleryState extends State<FontAwesomeGallery> {
//   var _isSearching = false;
  var _searchTerm = "";
  var _isListMode = true;
  TextEditingController searchText = TextEditingController();

  void listMode(bool value) {
    setState(() {
      _isListMode = value;
    });
  }

  void searchTerm(String value) {
    setState(() {
      _searchTerm = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredIcons = icons
        .where((icon) =>
            _searchTerm.isEmpty || icon.title.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    return SafeArea(
      child: Expanded(
        child: Column(
          children: [
            SearchBarWidget(
                title: 'Search FontAwesome icons',
                searchText: searchText,
                listMode: listMode,
                searchTerm: searchTerm),
            Expanded(
              child: GridView.builder(
                itemCount: filteredIcons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _isListMode
                        ? responsive(
                            context,
                            smallScreen: 1,
                            mobilePortrait: 2,
                            mobileLandscape: 3,
                            tabletLandscape: 4,
                            desktop: 4,
                            desktopLarge: 6,
                          )
                        : responsive(
                            context,
                            smallScreen: 2,
                            mobilePortrait: 4,
                            mobileLandscape: 8,
                            tabletLandscape: 10,
                            desktop: 12,
                            desktopLarge: 14,
                          ),
                    childAspectRatio:
                        _isListMode ? (MediaQuery.of(context).size.height * 0.0070) : 1.65),
                itemBuilder: (context, index) {
                  final icon = filteredIcons[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 10),
                        Tooltip(
                          message: icon.title,
                          child: Icon(icon.iconData),
                        ),
                        const SizedBox(width: 10),
                        if (_isListMode)
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(icon.title),
                            ),
                          ),
                        const SizedBox(width: 10),
                        //   if (_isListMode) const SizedBox(height: 400),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
