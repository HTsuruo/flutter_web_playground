import 'package:flutter/material.dart';
import 'package:flutter_web_playground/csv_downloader/download_page.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting('ja_JP');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ブラウザ`title`となる（タブに表示される）
      title: 'Flutter Web Playground',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ),
      home: const DownloadPage(),
    );
  }
}
