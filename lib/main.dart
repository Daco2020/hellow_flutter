import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Future/Await 실습', home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resultText = '아직 데이터가 없습니다';
  bool isLoading = false;

  // Future 사용 (await 없이)
  Future<void> getDataWithoutAwait() async {
    print('1. Future 함수 시작!');

    setState(() {
      resultText = '요청 보냄 (Future)';
      isLoading = true;
    });
    print('2. Future: setState 완료 (로딩 시작)');

    Future.delayed(const Duration(seconds: 2), () {
      print('4. Future: 2초 지남! 이제 데이터가 도착했어요');
      setState(() {
        resultText = '데이터 도착! (Future)';
        isLoading = false;
      });
      print('5. Future: setState 완료 (로딩 종료)');
    });

    print('3. Future: 함수 종료 (하지만 데이터는 아직 오는 중...)');
  }

  // await 사용
  Future<void> getDataWithAwait() async {
    print('1. await 함수 시작!');

    setState(() {
      resultText = '요청 보냄 (await)';
      isLoading = true;
    });
    print('2. await: setState 완료 (로딩 시작)');

    await Future.delayed(const Duration(seconds: 2), () {
      print('4. await: 2초 지남! 이제 데이터가 도착했어요');
      setState(() {
        resultText = '데이터 도착! (await)';
        isLoading = false;
      });
      print('5. await: setState 완료 (로딩 종료)');
    });

    print('6. await: 함수 종료 (모든 처리가 완료됨)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future/Await 실습')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else
              Text(resultText, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getDataWithoutAwait,
              child: const Text('Future로 데이터 가져오기'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: getDataWithAwait,
              child: const Text('await로 데이터 가져오기'),
            ),
          ],
        ),
      ),
    );
  }
}
