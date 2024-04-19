import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiPantalla extends StatelessWidget{

  const MiPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Una demo de darko',
      theme: ThemeData(
        fontFamily: 'Custom',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(204, 255, 0, 0.5)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MiPantalla();
}

class _MiPantalla extends State<MyHomePage> {
  int _counter = 0;
  final String undoIcon = 'assets/icons/redoIcon2.svg';
  final String plusIcon = 'assets/icons/plus.svg';
  final String minusIcon = 'assets/icons/minus.svg';

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
      _counter = 0;
    });

    bool useMaterial3 = true;
  }

  @override
  Widget build(BuildContext context){
    return  const Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            )
          ]
        )
      )
    );
  }

  /*
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Una demo de Darko Muñoz"),
      ),
      body: Center(
        
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has pulsado el botón ésta cantidad de pulsaciones:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          onPressed: _incrementCounter, 
          icon: SvgPicture.asset(plusIcon,
          width: 35,
          height: 35,)),
        const SizedBox(width: 5),
        IconButton(
          onPressed: _decrementCounter, 
          icon: SvgPicture.asset(minusIcon)),
      ],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: SvgPicture.asset(undoIcon,
              height: 35,
              width: 35),
            ),
          ],
        ),
      )
    );
  }*/
}