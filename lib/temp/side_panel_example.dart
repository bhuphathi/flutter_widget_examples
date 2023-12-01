import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';

const _filename = "side_panel_example.dart";

class SidePanelExample extends StatefulWidget {
  const SidePanelExample({Key? key}) : super(key: key);
  final String title = "Side Sheet";

  @override
  State createState() => _SidePanelExampleState();
}

class _SidePanelExampleState extends State<SidePanelExample> {
  String text = 'no data';

  @override
  Widget build(BuildContext context) {
    dPrint(filename: _filename, msg: "Widget build...");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// Open Right side sheet
              ElevatedButton(
                  onPressed: () => SideSheet.right(body: const Text("Body"), context: context),
                  child: const Text('OPEN RIGHT SIDE SHEET')),
              const SizedBox(height: 10),

              /// Open Left side sheet
              ElevatedButton(
                  onPressed: () => SideSheet.left(body: const Text("Body"), context: context),
                  child: const Text('OPEN LEFT SIDE SHEET')),
              const SizedBox(height: 20),

              /// Open Right side sheet with custom width
              ElevatedButton(
                  onPressed: () => SideSheet.right(
                      body: const Text("Width is set to 0.3 of device Screen With"),
                      width: MediaQuery.of(context).size.width * 0.3,
                      context: context),
                  child: const Text('OPEN SHEET WITH CUSTOM WIDTH')),
              const SizedBox(height: 20),

              /// Open Left side sheet with returns args when click close icon
              ElevatedButton(
                  onPressed: () async {
                    final data =
                        await SideSheet.left(body: bodyWithReturnArgs(context), context: context);

                    setState(() {
                      text = data;
                    });
                  },
                  child: const Text('OPEN LEFT SIDE SHEET WITH RETURN DATA')),
              const SizedBox(height: 10),

              /// Open Right side sheet with returns args when click close icon
              ElevatedButton(
                  onPressed: () async {
                    final data = await SideSheet.right(
                        body: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () =>
                                Navigator.pop(context, 'Data returns from right side sheet')),
                        context: context);

                    setState(() {
                      text = data;
                    });
                  },
                  child: const Text('OPEN RIGHT SIDE SHEET WITH RETURN DATA')),
              const SizedBox(height: 10),
              Text('Arguments: $text')
            ],
          ),
        ),
      ),
    );
  }
}

Widget bodyWithReturnArgs(context) {
  return Ink(
    child: Column(
      children: [
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context, 'Data returns from left side sheet')),
        const Text('Body')
      ],
    ),
  );
}
