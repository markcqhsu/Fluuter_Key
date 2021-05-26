import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //因為給予Box Widget key值, Flutter才有辦法分辨
            //ValueKey() 裡面不一定是數字, 也可以是字串
            Box(Colors.orange, ValueKey(2)),
            Box(Colors.orange, ValueKey(1)),
            Box(Colors.orange, ValueKey(3)),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//自己建立Box Widget
class Box extends StatefulWidget{
  final Color color; //讓自己做的Widget可以輸入變數

  //為自己的Widget建立Key, 把值傳到父類, 父類都有支援Key
  //用命名參數的方式轉給父類

  Box(this.color, Key key) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: Center(
        child: ElevatedButton(
          onPressed: ()=> setState(() => _count++),
          child: Text(
            "$_count",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}

