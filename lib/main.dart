import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

/*

写真をスライドショーにしたい。
「神奈川県横浜市」のところを右側に入れたい。
星のアイコンをチェンジできるようにした。
３つのアイコンをクラス化？して自由に変更できるようにする。
背景を少し変えてみる。


 */

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

double _star = 0.0;



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
    //scaffodは、
    return Scaffold(
      appBar: AppBar(title: Text("Lay out　編"), actions: <Widget>[
        Icon(Icons.add),
        Icon(Icons.add),
        Text("1"),
        Icon(Icons.add),
        Text("2"),
        Icon(Icons.add),
        Icon(Icons.add),
      ]),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset("images/i.jpg"),
            //ランドマーク
            firstSection,
            //アイコンとテキスト
            buttonTextRow,
            //長文
            longText,

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
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


//星と場所
Widget firstSection = Container(
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlaceSectionRow,
        star,
      ],
    ),
  ),
);
}


//縦　地名
Widget PlaceSectionRow = Container(
  padding: EdgeInsets.all(5),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text(
        "横浜ランドマークタワー",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      const Text(
        "神奈川県横浜市",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

//星と数字

Widget star = Container(
  padding: EdgeInsets.all(5),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.star, color: Colors.red, size: 40),
        tooltip: "Increase start by 1",
        onPressed: () {
            _star += 10;
          }),
      Text(
        'Volume : $_star',
        style: TextStyle(fontSize: 20),
      ),
    ],
  ),
);

//これをメソットみたいにして、変数みたいなもの？　＝＝＞＞３つ違うものを入れたい。
Widget buttonText = Container(
  padding: EdgeInsets.all(10),
  child: Column(
    children: [
      Icon(
        Icons.call,
        color: Colors.blue,
        size: 40,
      ),
      Text(
        "電話",
        style: TextStyle(color: Colors.blue, fontSize: 30),
      ),
    ],
  ),
);

Widget buttonTextRow = Container(
  padding: EdgeInsets.all(10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buttonText,
      buttonText,
      buttonText,
    ],
  ),
);

Widget longText = Container(
  padding: EdgeInsets.all(22),
  child: Text(
    "横浜ランドマークタワーは、横浜みなとみらい21の中核を担っている超高層ビルで、オフィスのほかホ"
    "テルやショッピングモールなどからなる複合施設。三菱地所が保有している。1990年3月20日に着工され"
    "、1993年7月16日に開業した。 70階建て、高さ296.33m。",
    style: TextStyle(fontSize: 16),
    softWrap: true,
  ),
);

/*記録よう
//横
Widget textSection = Container(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("10"),
        const Text("20"),
        const Text("30"),
      ],
    ),
  ),
);
 */
