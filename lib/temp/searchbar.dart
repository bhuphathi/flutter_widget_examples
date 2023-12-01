import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _filename = "searchbar.dart";

class SearchBarWidget extends ConsumerStatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.title,
    required this.searchText,
    required this.listMode,
    required this.searchTerm,
  });
  final String title;
  final void Function(String value) searchTerm;
  final void Function(bool value) listMode;
  final TextEditingController searchText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  bool _isListMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.listMode(_isListMode));
    dPrint(filename: _filename, msg: "initState", tag: "searchbar");
  }

  @override
  Widget build(BuildContext context) {
    dPrint(filename: _filename, msg: "build mounted: $mounted", tag: "searchbar");
    return Column(
      children: [_searchBar(context)],
    );
  }

  Widget _searchBar(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    dPrint(filename: _filename, msg: "_searchbar mounted: $mounted", tag: "searchbar");
    return Material(
      elevation: 1.0,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              FluentIcons.search_24_regular,
              color: Colors.grey,
            ),
            onPressed: () => widget.searchTerm(""),
          ),
          Expanded(
            child: TextField(
              controller: widget.searchText,
              onChanged: (text) => widget.searchTerm(text),
              style: TextStyle(fontSize: 18.0, color: theme.secondary.step12),
              decoration: InputDecoration(border: InputBorder.none, hintText: widget.title),
            ),
          ),
          IconButton(
            icon: const Icon(
              FluentIcons.dismiss_24_filled,
              color: Colors.grey,
            ),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              widget.searchTerm("");
              widget.searchText.text = "";
            },
          ),
          IconButton(
            icon: Icon(
              _isListMode ? FluentIcons.grid_24_regular : FluentIcons.list_24_regular,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() => _isListMode = !_isListMode);
              widget.listMode(_isListMode);
            },
          ),
        ],
      ),
    );
  }
}
