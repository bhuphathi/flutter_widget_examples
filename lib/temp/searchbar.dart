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
    required this.searchTextController,
    required this.setSearchKeyword,
    this.setListMode,
  });
  final String title;
  final void Function(String value) setSearchKeyword;
  final void Function(bool value)? setListMode;
  final TextEditingController searchTextController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  bool _isListMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.setListMode != null ? widget.setListMode!(_isListMode) : "";
    });
    dPrint(filename: _filename, msg: "initState", tag: "searchbar");
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    dPrint(filename: _filename, msg: "build mounted: $mounted", tag: "searchbar");

    return Material(
      elevation: 1.0,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FluentIcons.search_24_regular, color: theme.secondary),
            onPressed: () => widget.setSearchKeyword(""),
          ),
          Expanded(
            child: TextField(
              controller: widget.searchTextController,
              onChanged: (text) => widget.setSearchKeyword(text),
              style: TextStyle(fontSize: 18.0, color: theme.secondary.step12),
              decoration: InputDecoration(border: InputBorder.none, hintText: widget.title),
            ),
          ),
          IconButton(
            icon: Icon(FluentIcons.dismiss_24_filled, color: theme.secondary),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              widget.setSearchKeyword("");
              widget.searchTextController.text = "";
            },
          ),
          if (widget.setListMode != null)
            IconButton(
              icon: Icon(_isListMode ? FluentIcons.grid_24_regular : FluentIcons.list_24_regular,
                  color: theme.secondary),
              onPressed: () {
                setState(() => _isListMode = !_isListMode);
                widget.setListMode!(_isListMode);
              },
            ),
        ],
      ),
    );
  }
}
