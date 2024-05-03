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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _alphaResetButton = 0;
  double _alphaMessage = 0;
  double _alphaIcon = 0;
  String _iconPath = '/icons/loser.svg';
  String _message = 'Derrota';
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _resetCounter() {
    setState(() {
      _counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {
  if(_counter>=10){_alphaResetButton = 1; _alphaMessage=1;}
  else{_alphaResetButton = 0; _alphaMessage=0;}

  if(_counter>=10&&_counter<15){_alphaIcon = 1; _iconPath = '/icons/loser.svg'; _message='Derrota';}
  else if(_counter>=15){_iconPath = '/icons/winner.svg'; _message='Victoria';}
  else{_alphaIcon = 0;}

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.amber,
        
        title: Text(widget.title,),
      ),
      body: Center(
        child:Container(
          margin: const EdgeInsets.fromLTRB(30, 100, 30, 30),
          height: 600,
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  height: 100,
                  child: 
                  Opacity(
                    opacity: _alphaMessage,
                    child: Text(_message, style: Theme.of(context).textTheme.headlineLarge,),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 200,
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
