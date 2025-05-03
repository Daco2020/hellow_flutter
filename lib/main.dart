// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Widget Tree 실습')),
//         body: Container(
//           color: Colors.grey[200],
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   color: Colors.amber,
//                   padding: const EdgeInsets.all(16),
//                   child: const Text(
//                     '나는 Text 위젯이야',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text('나는 Button 위젯'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ✅ 상위 위젯: 전체 앱 구조
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

// ✅ 상태 관리 포함된 StatefulWidget
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('위젯 분리 예제')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('count: $count', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            IncreaseButton(onPressed: increase),
          ],
        ),
      ),
    );
  }
}

// ✅ 버튼만 분리된 위젯
class IncreaseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IncreaseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('증가 버튼'));
  }
}
