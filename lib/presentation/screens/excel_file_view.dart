import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/utils/get_widget_size.dart';
import 'package:flutter_widget_examples/core/utils/responsive.dart';
import 'package:flutter_widget_examples/temp/searchbar.dart';

const _filename = "excel_file_view.dart";

class ExcelFileDemo extends ConsumerStatefulWidget {
  const ExcelFileDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExcelFileDemoState();
}

class _ExcelFileDemoState extends ConsumerState<ExcelFileDemo> {
  final rowKey = GlobalKey();
  bool getFile = false;
  var _searchTerm = "";
  var _isListMode = true;

  void setListMode(bool value) {
    setState(() {
      _isListMode = value;
    });
  }

  void setSearchKeyword(String value) {
    setState(() {
      _searchTerm = value;
    });
  }

  Future<List<List<Data?>>> getExcelTables() async {
    FilePickerResult? pickedFile = getFile
        ? await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['xlsx'],
            allowMultiple: false,
          )
        : throw "Select a file to display data...";
    Map<String, Sheet> tables;
    dPrint(filename: _filename, msg: pickedFile, tag: "picked file");
    if (pickedFile != null) {
      var bytes = File(pickedFile.files.first.path!).readAsBytesSync();

      var excel = Excel.decodeBytes(bytes);
      tables = excel.tables;
      return await getRowsData(tables);
    }
    return [];
  }

  Future<List<List<Data?>>> getRowsData(Map<String, Sheet> tables) async {
    List<List<Data?>> rows = [[]];

    for (var table in tables.keys) {
      dPrint(filename: _filename, msg: table, tag: "table sheet name");
      dPrint(filename: _filename, msg: tables[table]?.maxColumns, tag: "table maxColumns");
      dPrint(filename: _filename, msg: tables[table]?.maxRows, tag: "table maxRows");

      if (tables[table] != null) {
        rows = [
          ...tables[table]!.rows.map((row) => [...row.map((cell) => cell).toList()]).toList()
        ];
      }
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    // final adminController = ref.watch(adminControllerProvider);
    final theme = ref.watch(radixThemeProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              key: rowKey,
              children: [
                Expanded(
                  child: SearchBarWidget(
                    title: "Filter xlsx file data",
                    setSearchKeyword: setSearchKeyword,
                    setListMode: setListMode,
                  ),
                ),
                const SizedBox(width: 2),
                SizedBox(
                  height: getSizeOfWidget(rowKey)?.height,
                  child: ElevatedButton(
                    onPressed: () => setState(() => getFile = !getFile),
                    style: const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
                    child: const Icon(Icons.upload),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              //get data from server or offline cache
              future: getExcelTables(),
              builder: (context, snapshot) {
                var sheet = snapshot.data;
                dPrint(filename: _filename, msg: snapshot.toString(), tag: "snapshot");
                dPrint(filename: _filename, msg: snapshot.hasData, tag: "snapshot");
                // dPrint(
                //     filename: _filename,
                //     msg: "maxColumns: ${sheet?.maxColumns} maxRows: ${sheet?.maxRows}",
                //     tag: "snapshot");
                if (snapshot.hasData) {
                  // var rows = getRowsData(snapshot.data!);
                  // dPrint(filename: _filename, msg: rows.length, tag: "noofrows");

                  var data = snapshot.data!
                      .where((user) =>
                          _searchTerm.isEmpty ||
                          user
                              .toString()
                              .toLowerCase()
                              .contains(RegExp(_searchTerm.toLowerCase(), caseSensitive: false)))
                      .toList();

                  //list of users card
                  return Expanded(
                    //   child: Text("data"),
                    child: GridView.builder(
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _isListMode
                              ? responsive(
                                  context: context,
                                  smallScreen: 1,
                                  mobilePortrait: 1,
                                  mobileLandscape: 3,
                                  tabletLandscape: 4,
                                  desktop: 4,
                                  desktopLarge: 6,
                                )
                              : responsive(
                                  context: context,
                                  smallScreen: 1,
                                  mobilePortrait: 1,
                                  mobileLandscape: 4,
                                  tabletLandscape: 10,
                                  desktop: 12,
                                  desktopLarge: 14,
                                ),
                          childAspectRatio:
                              _isListMode ? (MediaQuery.of(context).size.height * 0.0075) : 4.25),
                      itemBuilder: (context, index) {
                        final row = data[index];
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var cell in row)
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: theme.secondary.step3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(cell?.value != null
                                        ? "value: ${cell!.value!}\ncIdx: ${cell.cellIndex}"
                                        : ""),
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  //on error
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.error_outline, color: theme.hlError, size: 60),
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('Error: ${snapshot.error}')),
                      ],
                    ),
                  );
                } else {
                  //loading
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 60, height: 60, child: CircularProgressIndicator()),
                        Padding(padding: EdgeInsets.only(top: 16), child: Text('Awaiting result...')),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
