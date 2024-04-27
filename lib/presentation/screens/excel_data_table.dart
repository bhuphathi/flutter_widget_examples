import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/providers/theme_notifier.dart';
import 'package:flutter_widget_examples/core/utils/check_platform.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/utils/get_widget_size.dart';
import 'package:flutter_widget_examples/temp/searchbar.dart';

const _filename = "excel_data_table.dart";

class ExcelDatatableView extends ConsumerStatefulWidget {
  const ExcelDatatableView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExcelDatatableViewState();
}

class _ExcelDatatableViewState extends ConsumerState<ExcelDatatableView> {
  final rowKey = GlobalKey();
  FilePickerResult? pickedFile;
  var loadingState = Future.value(ConnectionState.done);
  final ScrollController _scrollController = ScrollController();
  var _searchTerm = "";
  var _isListMode = true;
  String? _filePath;
  List<List<Data?>>? _excelData;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final scrollPosition = _scrollController.offset;
      dPrint(filename: _filename, msg: scrollPosition, tag: "scroll controller");
    });
  }

  Future<void> _pickAndReadFile() async {
    setState(() {
      _loading = true;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        if (CheckPlatform().isMobile) {
          _filePath = result.files.first.path;
          _excelData = await _readExcel(filePath: _filePath);
        } else {
          var fileBytes = result.files.first.bytes!;
          _excelData = await _readExcel(fileBytes: fileBytes);
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<List<List<Data?>>> _readExcel({String? filePath, Uint8List? fileBytes}) async {
    // var bytes = await File(path!).readAsBytes();
    var bytes = filePath != null ? await File(filePath).readAsBytes() : fileBytes;
    var excel = Excel.decodeBytes(bytes!);

    // Assuming the first sheet is of interest
    var sheet = excel.tables.keys.first;
    return excel.tables[sheet]?.rows ?? [];
  }

  void listMode(bool value) {
    setState(() {
      _isListMode = value;
    });
  }

  void searchText(String value) {
    setState(() {
      _searchTerm = value;
    });
  }

  Stream<List<CellValue?>> readXlsxFile(String? filepath) async* {
    try {
      if (filepath == null) yield [null];
      final file = File(filepath!);
      // Open the file as a byte stream
      final bytes = await file.readAsBytes();

      // Decode the XLSX file
      final excel = Excel.decodeBytes(bytes);

      // Get the first sheet in the workbook
      final sheet = excel.tables.values.first;

      // Iterate through each row in the sheet
      for (final row in sheet.rows) {
        // Extract cell values as a list of strings
        final rowData = row.map((cell) => cell?.value).toList();

        // Yield to the stream with the current row data
        yield rowData;
      }
    } catch (error) {
      // Handle any errors
      print('Error reading XLSX file: $error');
    }
  }

  Future<List<List<Data?>>?> getExcelTables() async {
    try {
      if (pickedFile == null) return throw "Select a file to display data, unmerge cells!...";

      Map<String, Sheet>? tables;
      dPrint(filename: _filename, msg: pickedFile, tag: "picked file");
      if (pickedFile != null) {
        var bytes = File(pickedFile!.files.first.path!).readAsBytesSync();

        var excel = Excel.decodeBytes(bytes);
        tables = excel.tables;
      }
      return await getRowsData(tables);
    } catch (e) {
      dPrint(filename: _filename, msg: e, tag: "getExcelTables error");
      rethrow;
    }
  }

  Future<List<List<Data?>>> getRowsData(Map<String, Sheet>? tables) async {
    try {
      List<List<Data?>> rows = [[]];
      if (tables != null) {
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
      }
      return rows;
    } catch (e) {
      dPrint(filename: _filename, msg: e, tag: "getRowsData error");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(radixThemeProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            //topBar(),
            ElevatedButton(
              onPressed: _loading ? null : _pickAndReadFile,
              child: const Text('Pick and Read XLSX File'),
            ),
            const SizedBox(height: 20),
            if (_loading)
              const CircularProgressIndicator()
            else if (_excelData != null)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: DataTable(
                      columns: _excelData![0]
                          .map((cell) => DataColumn(label: Text("${cell?.value}")))
                          .toList(),
                      rows: _excelData!.sublist(1, 20).map((row) {
                        return DataRow(
                            cells: row.map((cell) => DataCell(Text("${cell?.value}"))).toList());
                      }).toList(),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Row topBar() {
    return Row(
      key: rowKey,
      children: [
        Expanded(
          child: SearchBarWidget(
            title: "Excel datatable view",
            setSearchKeyword: searchText,
            setListMode: listMode,
          ),
        ),
        const SizedBox(width: 2),
        uploadBtn(),
      ],
    );
  }

  SizedBox uploadBtn() {
    return SizedBox(
      height: getSizeOfWidget(rowKey)?.height,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            pickedFile = null;
          });
          pickFile() async {
            pickedFile = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['xlsx'],
              allowMultiple: false,
            );
          }

          pickFile().then((value) => setState(
                () {},
              ));
        },
        style: const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
        child: const Icon(Icons.upload),
      ),
    );
  }


}
