import 'package:flutter_widget_examples/core/utils/responsove.dart';
import 'package:flutter_widget_examples/temp/searchbar.dart';
import 'package:flutter/material.dart';

import 'fluent_icons_data.dart';

class FluentUIShowcaseWidget extends StatefulWidget {
  const FluentUIShowcaseWidget({super.key});
  @override
  State<StatefulWidget> createState() => FluentUIShowcaseWidgetState();
}

class FluentUIShowcaseWidgetState extends State<FluentUIShowcaseWidget> {
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
    /*24 is for notification bar on Android*/
    final filteredIcons = icons
        .where((icon) =>
            _searchTerm.isEmpty || icon.iconName.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    return SafeArea(
      child: Column(
        children: <Widget>[
          // _searchBar(context),
          SearchBarWidget(
              title: 'Search Fluent icons',
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
                  childAspectRatio: _isListMode ? (MediaQuery.of(context).size.height * 0.010) : 1),
              itemBuilder: (context, index) {
                final icon = filteredIcons[index];
                final iconName = icon.iconName.split("_");
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Tooltip(
                        message: "${iconName[0]}_${iconName[1]}",
                        child: SizedBox(
                          width: 30,
                          child: Icon(icon.iconData, size: icon.defaultSize),
                        ),
                      ),
                      const SizedBox(width: 40),
                      if (_isListMode) Text("${iconName[0]}_${iconName[1]}"),
                      if (_isListMode) const SizedBox(height: 400),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
