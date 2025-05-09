import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  // 1초마다 숫자를 증가시키는 Stream 생성
  Stream<int> numberStream() {
    return Stream.periodic(Duration(seconds: 1), (count) => count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder 예제')),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberStream(), // 여기서 스트림을 구독
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("스트림 연결 중...");
            } else if (snapshot.hasError) {
              return Text("에러 발생: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Text('숫자: ${snapshot.data}', style: TextStyle(fontSize: 30));
            } else {
              return Text("데이터 없음");
            }
          },
        ),
      ),
    );
  }
}