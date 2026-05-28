import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group 40 Thesis App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ensconce'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.my_app_ensconce/service');
  String _status = 'Ready';

  Future<void> _startCaptureService() async {
    try {
      await platform.invokeMethod('startCaptureService');
      setState(() {
        _status = 'Capture Service Started';
      });
    } on PlatformException catch (e) {
      setState(() {
        _status = "Failed to start service: '${e.message}'.";
      });
    }
  }
  Future<void> _startBubbleService() async {
    try {
      await platform.invokeMethod('startBubbleService');
      setState(() {
        _status = 'Bubble Service Started';
      });
    } on PlatformException catch (e) {
      setState(() {
        _status = "Failed to start service: '${e.message}'.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Service Status:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              _status,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _startCaptureService,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Start Capture Service'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _startBubbleService,
              icon: const Icon(Icons.bubble_chart),
              label: const Text('Start Bubble Service'),
            ),
          ],
        ),
      ),
    );
  }
}
