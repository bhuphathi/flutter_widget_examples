import 'package:flutter_widget_examples/core/utils/check_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/utils/get_widget_size.dart';

const _filename = "mydropdown_menu.dart";

class MyDropdownMenu<T> extends StatefulWidget {
  const MyDropdownMenu({
    super.key,
    this.focusNode,
    this.height,
    this.errorText,
    this.hintText,
    this.inputDecorationTheme,
    this.menuStyle,
    this.label,
    this.siblingKey,
    this.textEditingController,
    this.width,
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.onSave,
  });

  ///set dropdown textfield height and width according to its sibling size from sibling key
  final GlobalKey? siblingKey;
  final FocusNode? focusNode;
  final InputDecorationTheme? inputDecorationTheme;
  final MenuStyle? menuStyle;
  final TextEditingController? textEditingController;
  final List<Map<String, T>> dropdownMenuEntries;
  final String? label;
  final String? errorText;
  final String? hintText;
  final void Function(T?)? onSelected;
  final void Function(T?)? onSave;
  final double? width;
  final double? height;

  @override
  State createState() => _MyDropdownMenuState<T>();
}

class _MyDropdownMenuState<T> extends State<MyDropdownMenu<T>> with WidgetsBindingObserver {
  GlobalKey dropdownKey = GlobalKey();
  double? textFieldHeight;
  double? textFieldWidth;
  double? menuHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // after widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  //when orientation or size changed
  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setDropDownSize();
      setState(() {});
    });
  }

  void setDropDownSize() {
    Size? siblingSize = getSizeOfWidget(widget.siblingKey);    
    if (siblingSize != null) {
      textFieldHeight = (widget.errorText != null ? 15 : 0) +
          (widget.height ?? siblingSize.height - (CheckPlatform().isMobile ? 15 : 23));
      textFieldWidth = widget.width ?? siblingSize.width;
      setState(() {});
    }
  }

  void setMenuHeight() {
    final screenHeight = MediaQuery.of(context).size.height;
    RenderBox? ddRenderBox = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
    Offset? ddPosition = ddRenderBox?.localToGlobal(Offset.zero); //global position
    double? y = ddPosition?.dy;
    double screenDepthFromDDToBottom = screenHeight - (y ?? 0);
    menuHeight = screenDepthFromDDToBottom < 280
        ? screenDepthFromDDToBottom - (CheckPlatform().isMobile ? 35 : 70)
        : 280;
    //set minimum menu height
    menuHeight = menuHeight! < 35 ? 40 : menuHeight;
  }

  void onSelected(T? value) {
    widget.onSelected != null ? widget.onSelected!(value) : null;
    widget.onSave != null ? widget.onSave!(value) : null;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<T>> menuEntries = <DropdownMenuEntry<T>>[];
    for (final element in widget.dropdownMenuEntries) {
      menuEntries.add(DropdownMenuEntry<T>(value: element.values.first, label: element.keys.first));
    }
    setDropDownSize();
    setMenuHeight();

    return Focus(
      focusNode: widget.focusNode,
      child: DropdownMenu<T>(
        width: textFieldWidth,
        key: dropdownKey,
        controller: widget.textEditingController,
        enableFilter: true,
        requestFocusOnTap: true,
        label: Text(widget.label ?? ""),
        dropdownMenuEntries: menuEntries,
        inputDecorationTheme: widget.inputDecorationTheme
            ?.copyWith(constraints: BoxConstraints(maxHeight: textFieldHeight ?? 50)),
        menuHeight: menuHeight,
        menuStyle: widget.menuStyle,
        onSelected: (value) => onSelected(value),
        hintText: widget.hintText,
        errorText: widget.errorText,
      ),
    );
  }
}
