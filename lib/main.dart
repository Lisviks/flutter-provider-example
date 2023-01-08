import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterState(),
    child: const CounterApp(),
  ));
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class CounterState extends ChangeNotifier {
  int count = 0;

  void add() {
    count++;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CounterState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count.count}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () => count.add(),
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
