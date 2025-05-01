import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('StatefulWidget Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('count: $count', style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  count++;
                  setState(() {
                    count++;
                    print('count: $count');
                  });
                },
                child: const Text('증가 버튼'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int count = 0;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('StatelessWidget Example')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('count: $count', style: const TextStyle(fontSize: 24)),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   count++;
//                   print('count: $count');
//                 },
//                 child: const Text('증가 버튼'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
