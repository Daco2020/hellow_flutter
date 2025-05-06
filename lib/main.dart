import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Navigator 실습', home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InputScreen()),
                );
              },
              child: const Text('입력 화면으로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const InputScreen()),
                );
              },
              child: const Text('입력 화면으로 교체 이동'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('입력 화면')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final input = _controller.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ListScreen(value: input)),
                );
              },
              child: const Text('리스트 화면으로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                final input = _controller.text;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ListScreen(value: input)),
                );
              },
              child: const Text('리스트 화면으로 교체 이동'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  final String value;

  const ListScreen({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('리스트 화면')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('입력값: $value', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // 한 단계 뒤로
              },
              child: const Text('뒤로가기'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}
