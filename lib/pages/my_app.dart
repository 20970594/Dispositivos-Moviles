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
  String _iconPath = 'assets/icons/loser.svg';
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

  void nextPage(){

  }

  
  @override
  Widget build(BuildContext context) {

  print("build() called");

  if(_counter>=10){_alphaResetButton = 1; _alphaMessage=1;}
  else{_alphaResetButton = 0; _alphaMessage=0;}

  if(_counter>=10&&_counter<15){_alphaIcon = 1; _iconPath = 'assets/icons/loser.svg'; _message='Derrota';}
  else if(_counter>=15){_iconPath = 'assets/icons/winner.svg'; _message='Victoria';}
  else{_alphaIcon = 0;}

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.amber,
        
        title: Text(widget.title,),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
              decoration: BoxDecoration(color: Colors.amber)
            ),
            ListTile(
              title: const Text('Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Detail()));
              },
            ),
            ListTile(
              title: const Text('List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListDetail()));
              },
            ),
            ListTile(
              title: const Text('Sensors'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sensors()));
              },
            ),
            ListTile(
              title: const Text('Gestures'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gestures()));
              },
            )
          ],
        ),
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
                          child: SvgPicture.asset('assets/icons/restart.svg',width: 20,)
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
              decoration: BoxDecoration(color: Colors.amber)
            ),
            ListTile(
              title: const Text('Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const MyApp())));
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListDetail()));
              },
            ),
            ListTile(
              title: const Text('Sensors'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sensors()));
              },
            ),
            ListTile(
              title: const Text('Gestures'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gestures()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
    final ItemList = List<ListTile>.filled(3, const ListTile(leading: Icon(Icons.map)));
    ItemList[0] = const ListTile(leading: Icon(Icons.map),title: Text('Map'),);
    ItemList[1] = const ListTile(leading: Icon(Icons.photo_album),title: Text('Album'),);
    ItemList[2] = const ListTile(leading: Icon(Icons.phone),title: Text('Phone'),);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Details'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
              decoration: BoxDecoration(color: Colors.amber)
            ),
            ListTile(
              title: const Text('Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const Detail())));
              },
            ),
            ListTile(
              title: const Text('List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
            ListTile(
              title: const Text('Sensors'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sensors()));
              },
            ),
            ListTile(
              title: const Text('Gestures'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gestures()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ItemList[0],
            ItemList[1],
            ItemList[2]
          ],
        )
      )
    );
  }
}

class Sensors extends StatelessWidget {
  const Sensors({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
              decoration: BoxDecoration(color: Colors.amber)
            ),
            ListTile(
              title: const Text('Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const Detail())));
              },
            ),
            ListTile(
              title: const Text('List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListDetail()));
              },
            ),
            ListTile(
              title: const Text('Sensors'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
            ListTile(
              title: const Text('Gestures'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gestures()));
              },
            )
          ],
        ),
      ),
      body: const Center(
        
      )
    );
  }
}

class Gestures extends StatelessWidget {
  const Gestures({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            ),
              decoration: BoxDecoration(color: Colors.amber)
            ),
            ListTile(
              title: const Text('Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const Detail())));
              },
            ),
            ListTile(
              title: const Text('List'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListDetail()));
              },
            ),
            ListTile(
              title: const Text('Sensors'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sensors()));
              },
            ),
            ListTile(
              title: const Text('Gestures'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyApp()));
              },
            )
          ],
        ),
      ),
      body: const Center(
        
      )
    );
  }
}