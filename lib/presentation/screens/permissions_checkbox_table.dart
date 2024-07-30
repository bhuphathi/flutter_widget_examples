import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/models/ie_actions.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/themes/radix_theme.dart';

class PermissionsTableCheckBox extends ConsumerStatefulWidget {
  final void Function(List<MapEntry<String, IEActions>>) onActionsChanged;
  final List<MapEntry<String, IEActions>>? initialData;

  const PermissionsTableCheckBox({
    Key? key,
    required this.onActionsChanged,
    this.initialData,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PermissionsTableCheckBoxState();
}

class _PermissionsTableCheckBoxState extends ConsumerState<PermissionsTableCheckBox> {
  final TextEditingController _textController = TextEditingController();
  late List<MapEntry<String, IEActions>> _actions;
  IEActions _currentActions =
      IEActions(create: false, read: false, update: false, delete: false, download: false);
  int? _editingIndex;

  @override
  void initState() {
    super.initState();
    _actions = widget.initialData?.toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              _buildTableHeader(),
              ..._actions
                  .asMap()
                  .entries
                  .map((entry) => _buildActionRow(entry.key, entry.value))
                  .toList(),
              _buildInputRow(),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    final theme = ref.read(radixThemeProvider);
    return TableRow(
      decoration: BoxDecoration(color: theme.surfaceTint),
      children: [
        _buildHeaderCell('Collection', theme),
        _buildHeaderCell('C', theme),
        _buildHeaderCell('R', theme),
        _buildHeaderCell('U', theme),
        _buildHeaderCell('D', theme),
        _buildHeaderCell('DL', theme),
        _buildHeaderCell('Actions', theme),
      ],
    );
  }

  TableRow _buildActionRow(int index, MapEntry<String, IEActions> action) {
    bool isEditing = _editingIndex == index;
    return TableRow(
      children: [
        _buildCell(
          isEditing
              ? TextField(
                  controller: TextEditingController(text: action.key),
                  onSubmitted: (newValue) => _updateActionKey(index, newValue),
                  autofocus: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                )
              : GestureDetector(
                  onDoubleTap: () => _startEditing(index),
                  child: Text(action.key),
                ),
        ),
        _buildCheckboxCell(action.value.create, (value) => _updateAction(index, create: value)),
        _buildCheckboxCell(action.value.read, (value) => _updateAction(index, read: value)),
        _buildCheckboxCell(action.value.update, (value) => _updateAction(index, update: value)),
        _buildCheckboxCell(action.value.delete, (value) => _updateAction(index, delete: value)),
        _buildCheckboxCell(action.value.download, (value) => _updateAction(index, download: value)),
        _buildCell(
          IconButton(
            icon: const Icon(Icons.delete, size: 20),
            onPressed: () => _removeAction(index),
          ),
        ),
      ],
    );
  }

  TableRow _buildInputRow() {
    return TableRow(
      children: [
        _buildCell(
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Collection name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 2),
            ),
          ),
        ),
        _buildCheckboxCell(_currentActions.create, (value) => _updateCurrentAction(create: value)),
        _buildCheckboxCell(_currentActions.read, (value) => _updateCurrentAction(read: value)),
        _buildCheckboxCell(_currentActions.update, (value) => _updateCurrentAction(update: value)),
        _buildCheckboxCell(_currentActions.delete, (value) => _updateCurrentAction(delete: value)),
        _buildCheckboxCell(_currentActions.download, (value) => _updateCurrentAction(download: value)),
        _buildCell(
          IconButton(
            icon: const Icon(Icons.add, size: 20),
            onPressed: _addAction,
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCell(String text, RadixTheme theme) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: theme.onSurface),
        ),
      ),
    );
  }

  Widget _buildCell(Widget child) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  Widget _buildCheckboxCell(bool value, Function(bool?) onChanged) {
    return _buildCell(
      Checkbox(
        value: value,
        onChanged: onChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  void _updateCurrentAction({
    bool? create,
    bool? read,
    bool? update,
    bool? delete,
    bool? download,
  }) {
    setState(() {
      _currentActions = _currentActions.copyWith(
        create: create,
        read: read,
        update: update,
        delete: delete,
        download: download,
      );
    });
  }

  void _addAction() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _actions.add(MapEntry(_textController.text, _currentActions));
        _textController.clear();
        _currentActions =
            IEActions(create: false, read: false, update: false, delete: false, download: false);
      });
      widget.onActionsChanged(_actions);
    }
  }

  void _removeAction(int index) {
    setState(() {
      _actions.removeAt(index);
      _editingIndex = null;
    });
    widget.onActionsChanged(_actions);
  }

  void _startEditing(int index) {
    setState(() {
      _editingIndex = index;
    });
  }

  void _updateActionKey(int index, String newKey) {
    if (newKey.isNotEmpty) {
      setState(() {
        final oldValue = _actions[index].value;
        _actions[index] = MapEntry(newKey, oldValue);
        _editingIndex = null;
      });
      widget.onActionsChanged(_actions);
    }
  }

  void _updateAction(
    int index, {
    bool? create,
    bool? read,
    bool? update,
    bool? delete,
    bool? download,
  }) {
    setState(() {
      final oldKey = _actions[index].key;
      final oldValue = _actions[index].value;
      _actions[index] = MapEntry(
        oldKey,
        oldValue.copyWith(
          create: create,
          read: read,
          update: update,
          delete: delete,
          download: download,
        ),
      );
    });
    widget.onActionsChanged(_actions);
  }
}

// Example usage:
class PermissionsTableCheckBoxExample extends StatelessWidget {
  const PermissionsTableCheckBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IEActions Input Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PermissionsTableCheckBox(
          initialData: [
            MapEntry('users',
                IEActions(create: true, read: true, update: false, delete: false, download: true)),
            MapEntry('posts',
                IEActions(create: true, read: true, update: true, delete: true, download: false)),
          ],
          onActionsChanged: (actions) {
            // Handle the updated list of actions here
            print(actions.map((a) => '${a.key}: ${a.value.toMap()}').join(', '));
          },
        ),
      ),
    );
  }
}
