import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class VolumeApp extends StatefulWidget {
  const VolumeApp({super.key});

  final String title = 'Flutter TTS';

  @override
  State createState() => _VolumeAppState();
}

enum TtsState { playing, stopped, paused, continued }

class _VolumeAppState extends State<VolumeApp> {
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;

  @override
  void initState() {
    super.initState();
    // Listen to system volume change
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text('Current volume: $_volumeListenerValue'),
            Row(
              children: [
                const Text('Set Volume:'),
                Flexible(
                  child: Slider(
                    min: 0,
                    max: 1,
                    onChanged: (double value) {
                      setState(() {
                        _setVolumeValue = value;
                        VolumeController().setVolume(_setVolumeValue);
                      });
                    },
                    value: _setVolumeValue,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Volume is: $_getVolume'),
                TextButton(
                  onPressed: () async {
                    _getVolume = await VolumeController().getVolume();
                    setState(() {
                      _setVolumeValue = _getVolume;
                    });
                  },
                  child: const Text('Get Volume'),
                ),
              ],
            ),
            TextButton(
              onPressed: () => VolumeController().muteVolume(),
              child: const Text('Mute Volume'),
            ),
            TextButton(
              onPressed: () => VolumeController().maxVolume(),
              child: const Text('Max Volume'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show system UI:${VolumeController().showSystemUI}'),
                TextButton(
                  onPressed: () =>
                      setState(() => VolumeController().showSystemUI = !VolumeController().showSystemUI),
                  child: const Text('Show/Hide UI'),
                )
              ],
            ),
          ],
        );
  }
}
