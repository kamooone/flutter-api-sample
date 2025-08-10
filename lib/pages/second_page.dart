import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  // StatefulWidget を継承するときは、必ず createState() メソッドを オーバーライド（上書き） して実装する必要があります。
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _result = '読み込み中...';

  // 画面が作られるときに、最初に一度だけ呼び出すための準備コード
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // 非同期処理を行うメソッド
  Future<void> fetchData() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _result = 'タイトル: ${data["title"]}';
        });
      } else {
        setState(() {
          _result = 'エラー: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _result = '通信エラー: $e';
      });
    }
  }

  // 画面を描画するときに何度でも呼ばれるメソッド
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2ページ目')),
      body: Center(
        child: Text(_result),
      ),
    );
  }
}
