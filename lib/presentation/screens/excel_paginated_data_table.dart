import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_examples/core/utils/check_platform.dart';
import 'package:flutter_widget_examples/core/utils/debug_print.dart';
import 'package:flutter_widget_examples/core/utils/get_widget_size.dart';
import 'package:flutter_widget_examples/temp/searchbar.dart';

const _filename = "excel_paginated_data_table.dart";

class ExcelPaginatedDatatableView extends ConsumerStatefulWidget {
  const ExcelPaginatedDatatableView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExcelPaginatedDatatableViewState();
}

class _ExcelPaginatedDatatableViewState extends ConsumerState<ExcelPaginatedDatatableView> {
  final rowKey = GlobalKey();
  final btnKey = GlobalKey();
  final pgDataTableKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  var _searchTerm = "";
  var _isListMode = true;
  FilePickerResult? pickedFile;
  String? _filePath;
  List<List<Data?>> _excelData = [[]];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final scrollPosition = _scrollController.offset;
      dPrint(filename: _filename, msg: scrollPosition, tag: "scroll controller");
    });
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
    var bytes = filePath != null ? await File(filePath).readAsBytes() : fileBytes;
    var excel = Excel.decodeBytes(bytes!);

    // first sheet only
    var sheet = excel.tables.keys.first;
    return excel.tables[sheet]?.rows ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 4.0, top: 4.0, right: 4.0),
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Row(
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
                SizedBox(
                  height: getSizeOfWidget(rowKey)?.height,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _pickAndReadFile,
                    style: const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
                    child: const Icon(Icons.upload),
                  ),
                ),
              ],
            ),
            if (_loading)
              const CircularProgressIndicator()
            else if (_excelData[0].isNotEmpty)
              SingleChildScrollView(
                child: PaginatedDataTable(
                  key: pgDataTableKey,
                  //header height 56, footer height 56, top row 48, padding 20 total = 180 + 5 extra to show keyboard
                  rowsPerPage: ((constraints.maxHeight - 185) / 48.667).ceil(),
                  source: ExcelDataSource(_excelData.sublist(5)),
                  columns:
                      _excelData[4].map((cell) => DataColumn(label: Text("${cell?.value} "))).toList(),
                ),
              ),
          ],
        );
      }),
    ));
  }
}

class ExcelDataSource extends DataTableSource {
  final List<List<Data?>> data;

  ExcelDataSource(this.data);

  @override
  DataRow? getRow(int index) {
    final item = data[index];
    return DataRow.byIndex(
      index: index,
      cells: item.map((cell) => DataCell(Text("${cell?.value}"))).toList(),
    );
  }

  @override
  int get rowCount => data.length;

  // Optional methods for advanced features
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;
}
