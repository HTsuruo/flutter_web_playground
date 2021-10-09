import 'dart:convert';
import 'dart:html';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_playground/csv_downloader/model.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            final header = ['name', 'age', 'blood', 'birth'];
            final rows = dummyUsers.map((u) => u.toCsvFormat()).toList();
            csvDownload(header: header, rows: rows);
          },
          child: const Text('csv download'),
        ),
      ),
    );
  }
}

void csvDownload({
  required List<String> header,
  required List<List<String>> rows,
  bool utf8BOM = false,
}) {
  AnchorElement anchorElement;
  if (utf8BOM) {
    //　Excelで開く用に日本語を含む場合はUTF-8 BOMにする措置
    // ref. https://github.com/close2/csv/issues/41#issuecomment-899038353
    final csv = const ListToCsvConverter(fieldDelimiter: ';').convert(
      [header, ...rows],
    );
    final bomUtf8Csv = [0xEF, 0xBB, 0xBF, ...utf8.encode(csv)];
    final base64CsvBytes = base64Encode(bomUtf8Csv);
    anchorElement = AnchorElement(
      href: 'data:text/plain;charset=utf-8;base64,$base64CsvBytes',
    );
  } else {
    final csv = const ListToCsvConverter().convert(
      [header, ...rows],
    );
    anchorElement = AnchorElement(
      href: 'data:text/plain;charset=utf-8,$csv',
    );
  }
  anchorElement
    ..setAttribute('download', 'users.csv')
    ..click();
}
