import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "hello flutter",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTimeRange? _selectDateTime;
  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
        context: context,
        firstDate: DateTime(
          2022,
          1,
        ),
        lastDate: DateTime(2030, 12, 31),
        currentDate: DateTime.now(),
        saveText: 'Done');
    if (result != null) {
      print(result.start.toString());
      setState(() {
        _selectDateTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Timer"),
      ),
      body: _selectDateTime == null
          ? const Center(
              child: Text('Press the button to show the picker'),
            )
          : Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start date: ${_selectDateTime?.start.toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _show,
        child: const Icon(Icons.date_range),
      ),
    );
  }
}
