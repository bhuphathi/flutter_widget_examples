import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';

const _filename = "searchbar.dart";

class SearchBarWidget extends ConsumerStatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.title,
    required this.setSearchKeyword,
    this.height = 40.0,
    this.setListMode,
  });
  final String title;
  final double height;
  final void Function(String value) setSearchKeyword;
  final void Function(bool value)? setListMode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  final TextEditingController searchTextController = TextEditingController();
  final debouncer = Debouncer();
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
    dPrint(filename: _filename, msg: "searchbar mounted");

    return Material(
      elevation: 1.0,
      child: SizedBox(
        height: widget.height,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(FluentIcons.search_24_regular, color: theme.secondary),
              onPressed: () => widget.setSearchKeyword(""),
            ),
            Expanded(
              child: TextField(
                controller: searchTextController,
                onChanged: (text) {
                  debouncer.debounce(
                      duration: const Duration(milliseconds: 250),
                      onDebounce: () {
                        widget.setSearchKeyword(text);
                      });
                },
                style: TextStyle(fontSize: 18.0, color: theme.secondary.step12),
                decoration: InputDecoration(border: InputBorder.none, hintText: widget.title),
              ),
            ),
            IconButton(
              icon: Icon(FluentIcons.dismiss_24_filled, color: theme.secondary),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                widget.setSearchKeyword("");
                searchTextController.text = "";
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
      ),
    );
  }
}
