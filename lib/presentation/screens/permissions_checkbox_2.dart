import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/models/ie_actions.dart';

class PermissionsBorderCheckBox extends StatefulWidget {
  final void Function(List<MapEntry<String, IEActions>>) onActionsChanged;
  final List<MapEntry<String, IEActions>>? initialData;

  const PermissionsBorderCheckBox({
    Key? key,
    required this.onActionsChanged,
    this.initialData,
  }) : super(key: key);

  @override
  State createState() => _PermissionsBorderCheckBoxState();
}

class _PermissionsBorderCheckBoxState extends State<PermissionsBorderCheckBox> {
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          ..._actions.asMap().entries.map((entry) => _buildActionRow(entry.key, entry.value)).toList(),
          _buildInputRow(),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          _buildCell('Collection', flex: 3, isHeader: true),
          _buildCell('C', isHeader: true),
          _buildCell('R', isHeader: true),
          _buildCell('U', isHeader: true),
          _buildCell('D', isHeader: true),
          _buildCell('DL', isHeader: true),
          const SizedBox(width: 48), // Space for delete button
        ],
      ),
    );
  }

  Widget _buildActionRow(int index, MapEntry<String, IEActions> action) {
    bool isEditing = _editingIndex == index;
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
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
            flex: 3,
          ),
          _buildCheckboxCell(action.value.create, (value) => _updateAction(index, create: value)),
          _buildCheckboxCell(action.value.read, (value) => _updateAction(index, read: value)),
          _buildCheckboxCell(action.value.update, (value) => _updateAction(index, update: value)),
          _buildCheckboxCell(action.value.delete, (value) => _updateAction(index, delete: value)),
          _buildCheckboxCell(action.value.download, (value) => _updateAction(index, download: value)),
          Container(
            width: 48,
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () => _removeAction(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          _buildCell(
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter collection name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            flex: 3,
          ),
          _buildCheckboxCell(_currentActions.create, (value) => _updateCurrentAction(create: value)),
          _buildCheckboxCell(_currentActions.read, (value) => _updateCurrentAction(read: value)),
          _buildCheckboxCell(_currentActions.update, (value) => _updateCurrentAction(update: value)),
          _buildCheckboxCell(_currentActions.delete, (value) => _updateCurrentAction(delete: value)),
          _buildCheckboxCell(_currentActions.download, (value) => _updateCurrentAction(download: value)),
          Container(
            width: 48,
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.add, size: 20),
              onPressed: _addAction,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(dynamic content, {int flex = 1, bool isHeader = false}) {
    Widget child;
    if (content is Widget) {
      child = content;
    } else {
      child = Text(content.toString());
    }

    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        alignment: Alignment.center,
        child: isHeader
            ? DefaultTextStyle(
                style: const TextStyle(fontWeight: FontWeight.bold),
                child: child,
              )
            : child,
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
class PermissionsBorderCheckBoxExample extends StatelessWidget {
  const PermissionsBorderCheckBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IEActions Input Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PermissionsBorderCheckBox(
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
