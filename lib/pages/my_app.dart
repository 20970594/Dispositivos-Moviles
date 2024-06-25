// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Custom',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Juego de botones'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() {
    print("create state");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {
    print('initState(), mounted: $mounted');
    _counter = 10;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies()');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  @override
  void reassemble() {
    print('reassemble()');
    super.reassemble();
  }

  int _counter = 10;
  double _alphaResetButton = 0;
  double _alphaMessage = 0;
  double _alphaIcon = 0;
  String _iconPath = '/icons/loser.svg';
  String _message = 'Derrota';
  
  void _incrementCounter() {
    setState(() {
      print('setState +');
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      print('setState -');
      _counter--;
    });
  }
  void _resetCounter() {
    setState(() {
      print('setState R');
      _counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {

  print("build() called");

  if(_counter>=10){_alphaResetButton = 1; _alphaMessage=1;}
  else{_alphaResetButton = 0; _alphaMessage=0;}

  if(_counter>=10&&_counter<15){_alphaIcon = 1; _iconPath = '/icons/loser.svg'; _message='Derrota';}
  else if(_counter>=15){_iconPath = '/icons/winner.svg'; _message='Victoria';}
  else{_alphaIcon = 0;}

    return Scaffold(
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Detail()));
            },
          child: const Text("Detalles"),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListDetail()));
            },
          child: const Text("Lista"),
        ),
      ],
      appBar: AppBar(
        
        backgroundColor: Colors.amber,
        
        title: Text(widget.title,),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 500,
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                    width: 50,
                    height: 100,
                      child: 
                      Opacity(opacity: _alphaIcon,
                        child: SvgPicture.asset(_iconPath,width: 50,)
                      )
                    )
                  ],
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                
                SizedBox(
                  width: 85,
                  height: 35,
                  child: 
                  Opacity(
                    opacity: _alphaMessage,
                    child: Text(_message, style: Theme.of(context).textTheme.headlineLarge,),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          _incrementCounter();
                          },
                        child: const Icon(Icons.add)
                      ),
                      Opacity(opacity: _alphaResetButton,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_counter>=10){
                              _resetCounter();
                            }
                          },
                          child: SvgPicture.asset('/icons/restart.svg',width: 20,)
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          _decrementCounter();
                        },
                        child: const Icon(Icons.remove)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 80,
              height: 150,
              child: Text("Detalles",textScaler: TextScaler.linear(2),),
            ),
            SizedBox(
              width: 120,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Atras',textScaler: TextScaler.linear(1.5)),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class ListDetail extends StatelessWidget {
  const ListDetail({super.key});

  
  @override
  Widget build(BuildContext context) {
    final ItemList = List<ListTile>.filled(3, ListTile(leading: Icon(Icons.map)));
    ItemList[0] = ListTile(leading: Icon(Icons.map),title: Text('Map'),);
    ItemList[1] = ListTile(leading: Icon(Icons.photo_album),title: Text('Album'),);
    ItemList[2] = ListTile(leading: Icon(Icons.phone),title: Text('Phone'),);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Details'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Atras',textScaler: TextScaler.linear(1.5)),
            ),
            ItemList[0],
            ItemList[1],
            ItemList[2]
          ],
        )
      )
    );
  }
}