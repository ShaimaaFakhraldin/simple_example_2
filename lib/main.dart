import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      ChangeNotifierProvider<MyCounter>(
        create: (_) => MyCounter(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,  required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("build -------------");
    // final counterModel = context.read<MyCounter>();
    // final counterModel = Provider.of<MyCounter>(context);
    return  Consumer <MyCounter>(
        builder: (_, counterModel, child) {
      return  Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${counterModel.getCounter()}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () =>  counterModel.incrementCounter(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });


  }
}

class MyCounter with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}