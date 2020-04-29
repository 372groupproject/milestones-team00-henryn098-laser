import 'package:flutter/material.dart';
import 'package:gameoflife/CellContainer.dart';
import 'package:gameoflife/ConfigBoards.dart';

//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:splashscreen/splashscreen.dart';
import 'dart:io' show Platform;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // named positional parameters
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "Conway's Game of Life"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int gridSize = 10;
  CellContainer board;

  // init board
  _MyHomePageState() {
    board = configBoardTestGlider(gridSize, gridSize);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int x, y = 0;

    x = (index / gridSize).floor();
    y = (index % gridSize);

    return GestureDetector(
      //onTap: () => _gridItemTapped(x, y),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    return Center(child: Text(board.cellAt(y, x).toString()));
  }

  Widget _buildGameBody() {
    double height;

    try {
      if (Platform.isAndroid) {
        height = 345;
      }
    }
    catch (Exception) { // stupid 😐
      height = 500;
    }

    int gridSize = board.rows;
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(child: Container(
          height: height,
          width: 500,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2.0)
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //childAspectRatio: 0.5,
              crossAxisCount: gridSize,
            ),
            itemBuilder: _buildGridItems,
            itemCount: gridSize * gridSize,
          ),
        ))
    ]);
  }

  @override
  Widget build(BuildContext context) { // equivalent to render in React
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _buildGameBody(),
    );
  }
}
