import 'package:flutter/material.dart';
import 'package:gameoflife/Models/cell.dart';
import 'package:gameoflife/Models/CellContainer.dart';
import 'package:gameoflife/Models/BoardModels.dart';

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
  final int ROWS = 10;
  final int COLS = 10;

  CellContainer board;
  bool isPaused = false;
  //bool isGameOver = false;
  int delay = 1;

  // init board
  _MyHomePageState() {
    board = configBoardTestGlider(ROWS, COLS);

    runGame();
  }

  void runGame() async {
    while (!isGameOver()) {
      await Future.delayed(Duration(seconds: delay));

      if (!isPaused) {
        tick(); // update the board 
      }
    }
  }

  // do a lazy scan of the entire board
  bool isGameOver() {
    return false;
  }

  //the method which drives the game
  void tick() {
    Cell currCell;
    Cell newCell;
    CellContainer newBoard = new CellContainer(ROWS, COLS);

    for (int r = 0; r < board.maxRowIdx; r++){
      for (int c = 0; c < board.maxColIdx; c++){
        currCell = board.cellAt(c,r);
        newCell  = newBoard.cellAt(c,r);
        newCell.alive = 
          cellState(currCell, board.countNeighbors(currCell));
      }
    }

    setState(() {
      board = newBoard;
    });
  }

  /*returns a cell state based on the number of neighbors,
  and whether or not the cell is currently alive*/
  bool cellState(Cell cell, int neighbors){
    //underpopulation
    if (neighbors < 2 || neighbors > 3){
      return false;
    }
    if (neighbors == 2){
      return cell.isAlive;
    }
    if (neighbors == 3){
      return true;
    }
    return false; //catchall, should never logically hit
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int x, y = 0;

    x = (index / ROWS).floor();
    y = (index % ROWS);

    return GestureDetector(
      //onTap: () => _gridItemTapped(x, y),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            color: board.cellAt(y, x).toString() == 'X' ? Colors.amber[600] : Colors.red
          ),
        ),
      ),
    );
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
            border: Border.all(color: Colors.blue, width: 2.0)
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemBuilder: _buildGridItems,
            itemCount: gridSize * gridSize,
          ),
        )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [appFooter()]),
        /*TextField(

        ),*/
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Slider(
            min: 0,
            max: 2,
            value: delay.toDouble(),
            onChanged: (value) {
              setState(() {
                delay = value.floor();
              });
            },
          ),
        ]),
        Text("Delay")
    ]);
  }

  Widget appFooter() {
    return Container(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        child: Wrap( 
          direction: Axis.horizontal,                    
          children: <Widget>[
            FlatButton(
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                isPaused = false;
              },
              child: Icon(Icons.play_arrow, color: Colors.green, size: 24.0),
            ),
            FlatButton(
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                isPaused = true;
              },
              child: Icon(Icons.pause, color: Colors.green, size: 24.0),
            ),
            FlatButton(
              textColor: Colors.black,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  board = randomBoard(COLS, ROWS);
                });
                //runGame();
              },
              child: Text(
                "Random",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
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
