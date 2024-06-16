import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      title: ("App Gabaritando"),
      home: inicio(),
      );
  }
}

class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("App Gabaritando"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage()));
              }, 
              
            child: Text("Iniciar teste"))
          
          ],
        ),
    ),
    bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'

            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Próxima'
            )
        ]
    ),
    );
  }
}

class FirstPage extends StatelessWidget{
  const FirstPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("App Gabaritando"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),


      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Página com as 5 questões"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaResultado()),
                );
              },
              child: Text('Ir para o resultado'),
            ),
          ],
        ), 
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Voltar'
            ),
            
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'

            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Próxima'
            )
      ],
      ),
    );
  }
}


class TelaResultado extends StatefulWidget {
  @override
  _TelaResultadoState createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Resultado"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Text("Você conseguiu chegar nessa página"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Voltar'
            ),
            
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'

            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Próxima'
            )
        ]
      ),
    );
  }
}