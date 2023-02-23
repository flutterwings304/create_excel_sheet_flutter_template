import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

import 'constant.dart';

void main() {
 dynamic a = 4;
  if (a > 3) {
    
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Excel sheet from list of data',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Excel sheet from list of data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final xcel.Workbook workbook = xcel.Workbook();

          final xcel.Worksheet sheet = workbook.worksheets[0];

          sheet.getRangeByIndex(1, 1).setText("Title");
          sheet.getRangeByIndex(1, 2).setText("Link");
          for (var i = 0; i < myList.length; i++) {
            final item = myList[i];

            sheet.getRangeByIndex(i + 2, 1).setText(item["title"].toString());
            sheet.getRangeByIndex(i + 2, 2).setText(item["link"].toString());
          }
          // final List<int> bytes = workbook.saveAsStream();
          // workbook.saveAsCSV("mylist.csv");
          workbook.dispose();
        },
        label: const Text("Create Excel sheet"),
      ),
    );
  }
}
