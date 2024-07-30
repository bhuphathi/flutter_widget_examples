import 'package:flutter/material.dart';
import 'package:flutter_widget_examples/core/models/ie_actions.dart';

class PermissionsCheckBox extends StatefulWidget {
  final void Function(List<MapEntry<String, IEActions>>) onActionsChanged;

  const PermissionsCheckBox({super.key, required this.onActionsChanged});

  @override
  State createState() => _PermissionsCheckBoxState();
}

class _PermissionsCheckBoxState extends State<PermissionsCheckBox> {
  final TextEditingController _textController = TextEditingController();
  final List<MapEntry<String, IEActions>> _actions = [];
  IEActions _currentActions =
      IEActions(create: false, read: false, update: false, delete: false, download: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._actions.map(_buildActionRow).toList(),
        _buildInputRow(),
      ],
    );
  }

  Widget _buildActionRow(MapEntry<String, IEActions> action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(action.key)),
          _buildCheckbox('C', action.value.create),
          _buildCheckbox('R', action.value.read),
          _buildCheckbox('U', action.value.update),
          _buildCheckbox('D', action.value.delete),
          _buildCheckbox('DL', action.value.download),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removeAction(action.key),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Enter collection name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        _buildCheckbox('C', _currentActions.create, (value) => _updateCurrentAction(create: value)),
        _buildCheckbox('R', _currentActions.read, (value) => _updateCurrentAction(read: value)),
        _buildCheckbox('U', _currentActions.update, (value) => _updateCurrentAction(update: value)),
        _buildCheckbox('D', _currentActions.delete, (value) => _updateCurrentAction(delete: value)),
        _buildCheckbox('DL', _currentActions.download, (value) => _updateCurrentAction(download: value)),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _addAction,
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value, [Function(bool?)? onChanged]) {
    return Column(
      children: [
        Text(label),
        Checkbox(
          value: value,
          onChanged: onChanged ?? (_) {},
        ),
      ],
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

  void _removeAction(String key) {
    setState(() {
      _actions.removeWhere((action) => action.key == key);
    });
    widget.onActionsChanged(_actions);
  }
}

// Example usage:
class PermissionsCheckBoxExample extends StatelessWidget {
  const PermissionsCheckBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IEActions Input Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PermissionsCheckBox(
          onActionsChanged: (actions) {
            // Handle the updated list of actions here
            print(actions.map((a) => '${a.key}: ${a.value.toMap()}').join(', '));
          },
        ),
      ),
    );
  }
}
