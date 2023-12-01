import 'dart:async';
import 'dart:io';

import 'package:flutter_widget_examples/core/utils/check_platform.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/utils/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

const _filename = "read_write_file.dart";

class CounterStorage {
  final checkPlatform = CheckPlatform();
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      var decryptContents = decrypt(secretKey, contents);

      dPrint(filename: _filename, msg: contents, tag: "read counter");
      dPrint(filename: _filename, msg: decryptContents, tag: "read counter");

      return int.parse(decryptContents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<int> readSecretCounter() async {
    try {
      final file = File('/storage/emulated/0/Android/media/ /counter.txt');

      // Read the file
      final contents = await file.readAsString();
      var decryptContents = decrypt(secretKey, contents);

      dPrint(filename: _filename, msg: contents, tag: "read counter");
      dPrint(filename: _filename, msg: decryptContents, tag: "read counter");

      return int.parse(decryptContents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    try {
      final file = await _localFile;
      String encryptedCount = encrypt(secretKey, counter).base64;

      //Android: '/data/user/0/in.mbfgroup.flutter_widget_examples/app_flutter'
      //Linux: '/home/user/Documents'
      final appDir = await getApplicationDocumentsDirectory();
      File('${appDir.path}/counter.txt').writeAsString(encryptedCount);

      //Android: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/files/downloads'
      //Linux: '/home/user/Downloads'
      final downloadDir = await getDownloadsDirectory();
      File('${downloadDir!.path}/counter.txt').writeAsString(encryptedCount);

      //Android: '/data/user/0/in.mbfgroup.flutter_widget_examples/cache'
      //Linux: '/tmp'
      final tempDir = await getTemporaryDirectory();
      File('${tempDir.path}/counter.txt').writeAsString(encryptedCount);

      if (checkPlatform.isMobile) {
        //[Directory: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/cache', Directory: '/storage/0BFB-290F/Android/data/in.mbfgroup.flutter_widget_examples/cache']
        final extCacheDir = await getExternalCacheDirectories();
        File('${extCacheDir!.first.path}/counter.txt').writeAsString(encryptedCount);

        //[Directory: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/files', Directory: '/storage/0BFB-290F/Android/data/in.mbfgroup.flutter_widget_examples/files']
        final extStorageDir = await getExternalStorageDirectories();
        File('${extStorageDir!.first.path}/counter.txt').writeAsString(encryptedCount);

        //in 'com.mbf.org' folder
        File('/storage/emulated/0/Android/media/com.mbf.org/counter.txt').writeAsString(encryptedCount);
        //in media/'.space' folder
        File('/storage/emulated/0/Android/media/.mbf/counter.txt').writeAsString(encryptedCount);
        //in media/'.space' folder
        File('/storage/emulated/0/Android/media/. /counter.txt').writeAsString(encryptedCount);
        //in media/'space' folder
        File('/storage/emulated/0/Android/media/ /counter.txt').writeAsString(encryptedCount);
        //in wdata folder
        File('/storage/emulated/0/Android/media/wdata/counter.txt').writeAsString(encryptedCount);
        //in secret folder
        File('/storage/emulated/0/Android/ /counter.txt').writeAsString(encryptedCount);
        //in direct home storage
        File('/storage/emulated/0/counter.txt').writeAsString(encryptedCount);
        //in direct home storage
        File('/storage/emulated/0/mbf/counter.txt').writeAsString(encryptedCount);
        //in direct home storage
        File('/storage/emulated/0/Android/counter.txt').writeAsString(encryptedCount);
        //in direct home storage
        File('/storage/emulated/0/Android/mbf/counter.txt').writeAsString(encryptedCount);
        //in direct home storage
        File('/storage/emulated/0/Android/media/mbf/counter.txt').writeAsString(encryptedCount);
        //in direct home storage
        File('/storage/emulated/0/Download/mbf/counter.txt').writeAsString(encryptedCount).then(
            (value) => dPrint(
                filename: _filename, msg: "filewrite: /storage/emulated/0/Download/mbf/counter.txt"));
        //in direct home storage
        File('/storage/emulated/0/Download/counter.txt').writeAsString(encryptedCount).then((value) =>
            dPrint(filename: _filename, msg: "filewrite: /storage/emulated/0/Download/counter.txt"));
        //in direct home storage
        File('/storage/emulated/0/Documents/counter.txt').writeAsString(encryptedCount).then((value) =>
            dPrint(filename: _filename, msg: "filewrite: /storage/emulated/0/Documents/counter.txt"));
        //in direct home storage
        final appendFile =
            File('/storage/emulated/0/Documents/Append.txt').openWrite(mode: FileMode.append);
        appendFile.writeln(encryptedCount);
        dPrint(
            filename: _filename,
            msg: "filewrite: /storage/emulated/0/Documents/Append.txt hashcode ${appendFile.hashCode}");
        appendFile.done.then((value) => dPrint(
            filename: _filename,
            msg: "filewrite: /storage/emulated/0/Documents/Append.txt done $value"));
      }
      //app dir append data
      final appendCountAppDir =
          File("${appDir.path}/counter_append.txt").openWrite(mode: FileMode.append);
      appendCountAppDir.writeln(encryptedCount);
      //download dir append data
      final appendCountDownDir =
          File("${downloadDir.path}/counter_append.txt").openWrite(mode: FileMode.append);
      appendCountDownDir.writeln(encryptedCount);
      //temp dir append data
      final appendCountTempDir =
          File("${tempDir.path}/counter_append.txt").openWrite(mode: FileMode.append);
      appendCountTempDir.writeln(encryptedCount);
      // Write the file
      return file.writeAsString(encryptedCount);
    } catch (e) {
      dPrint(filename: _filename, msg: "filewrite: Error: $e");
      rethrow;
    }
  }

  void createDirectory() async {
    try {
      //'/data/user/0/in.mbfgroup.flutter_widget_examples/app_flutter'
      final appDir = await getApplicationDocumentsDirectory();
      //'/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/files/downloads'
      final downloadDir = await getDownloadsDirectory();
      final tempDir =
          await getTemporaryDirectory(); //'/data/user/0/in.mbfgroup.flutter_widget_examples/cache'

      dPrint(filename: _filename, tag: "create_dir: appDir", msg: appDir.path);
      dPrint(filename: _filename, tag: "create_dir: downloadDir", msg: downloadDir!.path);
      dPrint(filename: _filename, tag: "create_dir: tempDir", msg: tempDir.path);

      if (checkPlatform.isAndroid) {
        var dir = '/storage/emulated/0/mbf';
        //working
        Directory(dir)
            .create()
            .then((value) => dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}"));
        //working
        dir = '/storage/emulated/0/Android/mbf';
        Directory(dir).create(recursive: true).then((value) {
          dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}");
        });
        //create dir with 'space' - working
        dir = '/storage/emulated/0/Android/media/ ';
        Directory(dir).create(recursive: true).then((value) {
          dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}");
        });
        //create dir 'com.mbf.org' - working
        dir = '/storage/emulated/0/Android/media/com.mbf.org';
        Directory(dir).create(recursive: true).then((value) {
          dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}");
        });
        //create dir with '.space' - working
        dir = '/storage/emulated/0/Android/media/.mbf';
        Directory(dir).create(recursive: true).then((value) {
          dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}");
        });
        //create dir with 'space' - working
        dir = '/storage/emulated/0/Android/media/wdata';
        Directory(dir).create(recursive: true).then((value) {
          dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}");
        });
        //working
        dir = '/storage/emulated/0/Android/media/mbf';
        Directory(dir)
            .create(recursive: true)
            .then((value) => dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}"));

        //working
        dir = '/storage/emulated/0/Download/mbf';
        Directory(dir)
            .create(recursive: true)
            .then((value) => dPrint(filename: _filename, msg: "create_dir: $dir: ${value.path}"));

        //not in linux, android
        final libDir = await getLibraryDirectory();
        //[Directory: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/cache', Directory: '/storage/0BFB-290F/Android/data/in.mbfgroup.flutter_widget_examples/cache']
        final extCacheDir = await getExternalCacheDirectories();
        //[Directory: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/files', Directory: '/storage/0BFB-290F/Android/data/in.mbfgroup.flutter_widget_examples/files']
        final extStorageDir = await getExternalStorageDirectories();

        dPrint(filename: _filename, tag: "create_dir: libDir", msg: libDir.path);
        dPrint(filename: _filename, tag: "create_dir: extCacheDir", msg: extCacheDir!.first.path);
        dPrint(filename: _filename, tag: "create_dir: extStorageDir", msg: extStorageDir!.first.path);
      } else if (checkPlatform.isLinux) {
        //working
        Directory('${appDir.path}/mbf').create().then((value) {
          dPrint(filename: _filename, msg: "create_dir: '${appDir.path}/mbf': ${value.path}");
        });
        //working
        Directory('${tempDir.path}/mbf').create().then((value) {
          dPrint(filename: _filename, msg: "create_dir: '${tempDir.path}/mbf': ${value.path}");
        });
        //working
        Directory('${downloadDir.path}/mbf').create().then((value) {
          dPrint(filename: _filename, msg: "create_dir: '${downloadDir.path}/mbf': ${value.path}");
        });
      }
    } catch (e) {
      dPrint(filename: _filename, tag: "create_dir: ERROR", msg: e.toString());
    }
  }

  Future<List<String>> dirList() async {
    List<String> listOfDirs = [];
    try {
      //Android: '/data/user/0/in.mbfgroup.flutter_widget_examples/app_flutter'
      //Linux: '/home/user/Documents'
      final appDir = await getApplicationDocumentsDirectory();
      listOfDirs.add(appDir.toString());

      //Android: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/files/downloads'
      //Linux: '/home/user/Downloads'
      final downloadDir = await getDownloadsDirectory();
      listOfDirs.add(downloadDir.toString());

      //Android: '/data/user/0/in.mbfgroup.flutter_widget_examples/cache'
      //Linux: '/tmp'
      final tempDir = await getTemporaryDirectory();
      listOfDirs.add(tempDir.toString());

      if (checkPlatform.isMobile) {
        //[Directory: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/cache', Directory: '/storage/0BFB-290F/Android/data/in.mbfgroup.flutter_widget_examples/cache']
        final extCacheDir = await getExternalCacheDirectories();
        listOfDirs.add(extCacheDir.toString());

        //[Directory: '/storage/emulated/0/Android/data/in.mbfgroup.flutter_widget_examples/files', Directory: '/storage/0BFB-290F/Android/data/in.mbfgroup.flutter_widget_examples/files']
        final extStorageDir = await getExternalStorageDirectories();
        listOfDirs.add(extStorageDir.toString());
      }
      return listOfDirs;
    } catch (e) {
      dPrint(filename: _filename, msg: "filewrite: Error: $e");
      rethrow;
    }
  }
}

class ReadWriteDemo extends StatefulWidget {
  const ReadWriteDemo({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<ReadWriteDemo> createState() => _ReadWriteDemoState();
}

class _ReadWriteDemoState extends State<ReadWriteDemo> {
  List<String> listOfDirs = [];
  int _counter = 0;
  int _secretCounter = 0;
  final checkPlatform = CheckPlatform();

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });

    widget.storage.readSecretCounter().then((value) {
      setState(() {
        _secretCounter = value;
      });
    });

    widget.storage.dirList().then((value) {
      setState(() {
        listOfDirs.addAll(value);
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  final encValue = encrypt(secretKey, "2");
                  final decValue = decrypt(secretKey, encValue.base64);

                  dPrint(filename: _filename, msg: "encrypt: ${encValue.base64}");
                  dPrint(filename: _filename, msg: "encrypt: ${encValue.base16}");
                  dPrint(filename: _filename, msg: "decrypt: $decValue");
                },
                child: const Text("Encrypt")),
            const SizedBox(height: 5),
            ElevatedButton(
                onPressed: widget.storage.createDirectory, child: const Text("Create Directory")),
            const SizedBox(height: 5),
            Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.'),
            const SizedBox(height: 5),
            Text(
                'Value Read from space folder, Button tapped $_secretCounter time${_secretCounter == 1 ? '' : 's'}.'),
            if (listOfDirs.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) => Column(
                        children: [
                          const SizedBox(height: 15),
                          Text(listOfDirs[index].trim()),
                        ],
                      )),
                  itemCount: listOfDirs.length,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
