import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutDemoApp());
}

class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '레이아웃 위젯 실습',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LayoutListPage(),
    );
  }
}

class LayoutListPage extends StatelessWidget {
  const LayoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Column', 'widget': const ColumnExample()},
      {'title': 'Row', 'widget': const RowExample()},
      {'title': 'Container', 'widget': const ContainerExample()},
      {'title': 'Stack', 'widget': const StackExample()},
      {'title': 'Expanded', 'widget': const ExpandedExample()},
      {'title': 'Padding', 'widget': const PaddingExample()},
      {'title': 'SizedBox', 'widget': const SizedBoxExample()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('레이아웃 위젯 실습')),
      body: ListView(
        children:
            items.map((item) {
              return Card(
                child: ListTile(
                  title: Text(item['title'] as String),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => Scaffold(
                              appBar: AppBar(
                                title: Text(item['title'] as String),
                              ),
                              body: item['widget'] as Widget,
                            ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
      ),
    );
  }
}

// 1. Column
class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // 화면 전체 너비 사용
      height: double.infinity, // 화면 전체 높이 사용
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [Text('첫 번째'), Text('두 번째'), Text('세 번째')],
      ),
    );
  }
}

// 2. Row
class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // 화면 전체 너비 사용
      height: double.infinity, // 화면 전체 높이 사용
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.star),
          Icon(Icons.favorite),
          Icon(Icons.access_alarm),
        ],
      ),
    );
  }
}

// 3. Container
class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: 200, // 화면 전체 너비 사용
      height: 100, // 화면 전체 높이 사용
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: const Text('Container 안에 있는 텍스트'),
    );
  }
}

// 4. Stack
class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: 200, height: 200, color: Colors.blue),
        Container(width: 150, height: 150, color: Colors.red),
        Positioned(
          top: 100,
          left: 100,
          child: Container(width: 100, height: 100, color: Colors.green),
        ),
      ],
    );
  }
}

// 5. Expanded
class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(color: Colors.blue, height: 100)),
        Expanded(child: Container(color: Colors.red, height: 100)),
        Expanded(child: Container(color: Colors.green, height: 100)),
      ],
    );
  }
}

// 6. Padding
class PaddingExample extends StatelessWidget {
  const PaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(64.0),
      child: Container(
        padding: EdgeInsets.all(32.0),
        color: Colors.amber,
        child: Text('패딩으로 둘러싸인 텍스트'),
      ),
    );
  }
}

// 7. SizedBox
class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('위 텍스트'),
        SizedBox(height: 30),
        Text('아래 텍스트'),
        SizedBox(height: 60),
        SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(onPressed: () {}, child: Text('고정 크기')),
        ),
      ],
    );
  }
}
