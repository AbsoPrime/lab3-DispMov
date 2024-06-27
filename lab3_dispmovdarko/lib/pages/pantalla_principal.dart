// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

int _counter = 0;
const String undoIcon = 'assets/icons/redoIcon2.svg';
const String plusIcon = 'assets/icons/plus.svg';
const String minusIcon = 'assets/icons/minus.svg';
const String playIcon = 'assets/icons/playIcon.svg';
const String happyIcon = 'assets/icons/happyFace.svg';
const String sadIcon = 'assets/icons/sadFace.svg';
const String neutralIcon = 'assets/icons/neutralFace.svg';
const String detailIcon = 'assets/icons/detailIcon.svg';
const String listDetailIcon = 'assets/icons/listDetIcon.svg';

String statusIcon = 'assets/icons/neutralFace.svg';
String message = "Ingrese un número luego pulse el botón Play";

List textos = ["Este es un programa hecho en Flutter y Dart, con un par de pantallas para navegar.", 
  " Un contador con botones",
  " Un menú con detalles",
  " Otro menú con detalles enlistados"];

String bullet = "\u2022";

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
  

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 15){

      }
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
  }

  void _toPage(int page){
    setState(() {
      switch (page){
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail()));
        break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ListDetail()));
        break;
      }
    });
  }

  void _update(){
    setState(() {
      if (_counter == 10){
        message = "Derrota";
        statusIcon = sadIcon;
      }
      else if (_counter == 15){
        message = "Victoria";
        statusIcon = happyIcon;
      }
      else{
        message = "Ingrese un número luego pulse el botón Play";
        statusIcon = neutralIcon;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    print("Estado Creado");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Una demo de Darko Muñoz", textAlign: TextAlign.start,),
        ), 
        body: LayoutBuilder(
          builder:(context, constraints) => ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(
                  minHeight: 500,
                ),
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //Icono
                        ListTile(
                          title: SvgPicture.asset(statusIcon)
                        ),
                        //Contador
                        ListTile(
                          title: Text('$_counter',
                                style: Theme.of(context).textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                                textScaler: const TextScaler.linear(2)),
                        ),
                        //Mensaje
                        ListTile(
                          title: Text(message, 
                            textAlign: TextAlign.center, 
                            textScaler: const TextScaler.linear(2)),
                        ),
                        //Botones
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: SvgPicture.asset(plusIcon,
                                    width: 35,
                                    height: 35,),
                              onPressed: () {_incrementCounter();},
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: SvgPicture.asset(playIcon,
                                    width: 35,
                                    height: 35,),
                              onPressed: () {_update();
                                              _resetCounter();},
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: SvgPicture.asset(minusIcon,
                                    width: 35,
                                    height: 35,),
                              onPressed: () {_decrementCounter();},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ]
                    )
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(102, 60)
                    ),
                    child: const Text(
                      'Ir a Detalles', 
                      textScaler: TextScaler.linear(1.5),
                      ),
                    onPressed: (){_toPage(1);},
                  ),
                  const SizedBox(width: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(102, 60)
                    ),
                    child: const Text(
                      'Ir a Lista', 
                      textScaler: TextScaler.linear(1.5)
                      ),
                    onPressed: (){_toPage(2);},
                  ),
                ],
              ),
            ],
          ),  
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: const Text('Menú', textDirection: TextDirection.rtl,),
              ),
              Card(
                child: ListTile(
                        title: const Text('Detalles'),
                        onTap: () {_toPage(1);},
                      ),
              ),
              Card(
                child: ListTile(
                      title: const Text('Lista de Detalles'),
                      onTap: () {_toPage(2);},
                    )
              )
            ]
          )
        ),
      )
    );
  }
}

class Detail extends StatelessWidget{
  const Detail({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Detalles"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 200),
            SizedBox(
              width: 300,
              height: 300,
              child: Text(
                textos[0],
                textScaler: const TextScaler.linear(2),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(child: ListView()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 1,
                  minimumSize: const Size(100, 50)
              ),
              onPressed: () {Navigator.pop(context);},
              child: const Text('Volver', textScaler: TextScaler.linear(1.5),),
            ),
            const SizedBox(height: 20)
          ],
        )
      )
    );
  }
}

class ListDetail extends StatelessWidget{
  const ListDetail({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Lista de Detalles"),
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(height: 80),
            UnconstrainedBox(
              child: SizedBox(
                width: 150,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 1,
                  ),
                  onPressed: () {Navigator.pop(context);},
                  child: const Text('Volver', textScaler: TextScaler.linear(1.5),),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              bullet + textos[1], 
              textScaler: const TextScaler.linear(1.5),
              textAlign: TextAlign.center,
            ),
            Text(
              bullet + textos[2], 
              textScaler: const TextScaler.linear(1.5),
              textAlign: TextAlign.center,
            ),
            Text(
              bullet + textos[3], 
              textScaler: const TextScaler.linear(1.5),
              textAlign: TextAlign.center,
            ),
          ],
        )
        
      )
    );
  }
}

/*
Column(
          children: [
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 1,
                  minimumSize: const Size(100, 50)
              ),
              onPressed: () {Navigator.pop(context);},
              child: const Text('Volver', textScaler: TextScaler.linear(1.5),),
            ),
            const SizedBox(height: 50),
          ],
        )
*/
