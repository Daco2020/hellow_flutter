import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Future/Await 실습', home: MyHomePage());
  }
}

Future<String> fetchMessage() async {
  await Future.delayed(Duration(seconds: 2));
  return "데이터 도착! 👏";
}

Future<String> deleteMessage() async {
  await Future.delayed(Duration(seconds: 2));
  return "데이터 삭제! 👏";
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String>? _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FutureBuilder 예제')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _future = fetchMessage();
                    });
                  },
                  child: Text('외부 API 데이터 조회'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _future = deleteMessage();
                    });
                  },
                  child: Text('로컬 파일 데이터 삭제'),
                ),
              ],
            ),
            SizedBox(height: 20),
            FutureBuilder<String>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // 로딩 중
                } else if (snapshot.hasError) {
                  return Text('에러 발생: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text('결과: ${snapshot.data}'); // 데이터 도착
                } else {
                  return Text('버튼을 눌러서 데이터를 가져오세요');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
