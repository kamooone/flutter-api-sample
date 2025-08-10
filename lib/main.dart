import 'package:flutter/material.dart';
import 'pages/second_page.dart';

// エントリーポイント
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // StatelessWidget はその中で「状態を持たない（不変の）」ウィジェット
  // コンストラクタ(MyAppのインスタンスを作成)、{} の中は名前付き引数、super.key は「親クラス（StatelessWidget）の key 引数を受け取る
  const MyApp({super.key});

  //Flutterウィジェットは必ず build メソッドを持ち、このメソッドが 画面に表示するUIツリーを組み立てて返す役割 を持つ
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Flutterでマテリアルデザインを使ったアプリを作るときの基本ウィジェット。アプリ全体の設定やテーマ、ナビゲーションの管理を行う
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // アプリを最初に起動した時に表示する画面
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget { // StatefulWidget は状態を保つウィジェット(画面が変わる)
  final String title;
  const MyHomePage({super.key, required this.title});


  // StatefulWidget を継承するときは、必ず createState() メソッドを オーバーライド（上書き） して実装する必要があります。
  @override
  State<MyHomePage> createState() => _MyHomePageState(); // 「=>」は Dart の 「短縮 return 文」 です。
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 画面を遷移するメソッド
  void _goToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondPage()),
    );
  }

  // build メソッドは、Flutterがこの画面（このStateの部分）を描画するときに呼ぶ関数です。画面が初めて表示されるときはsetState()を呼び出したときなどに自動で呼ばれる
  @override
  Widget build(BuildContext context) {
    // 画面の土台を作るウィジェット
    return Scaffold(
      // 画面の上部のバー（タイトルバー）
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // 画面のメインの中身
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24), // 余白
            ElevatedButton(
              onPressed: _goToNextPage,
              child: const Text('次の画面へ移動'),
            ),
          ],
        ),
      ),
      // 右下に浮かぶボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

