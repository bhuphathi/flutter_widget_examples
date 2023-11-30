import 'package:flutter/material.dart';

/// Flutter code sample for [OverlayPortal].

class OverlayPortalDemo extends StatefulWidget {
  const OverlayPortalDemo({super.key});

  @override
  State<OverlayPortalDemo> createState() => _OverlayPortalDemoState();
}

class _OverlayPortalDemoState extends State<OverlayPortalDemo> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverlayPortal Example'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: TextButton(
        onPressed: _tooltipController.toggle,
        child: DefaultTextStyle(
          style: DefaultTextStyle.of(context).style.copyWith(fontSize: 50),
          child: OverlayPortal(
            controller: _tooltipController,
            overlayChildBuilder: (BuildContext context) {
              return const Positioned(
                right: 0,
                top: 50,
                child: ColoredBox(
                  color: Colors.amberAccent,
                  child: Text('tooltip'),
                ),
              );
            },
            child: const Text('Press to show/hide tooltip'),
          ),
        ),
      )),
    );
  }
}
