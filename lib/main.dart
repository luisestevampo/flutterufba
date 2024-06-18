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
        backgroundColor: Colors.blue,
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
        backgroundColor: Colors.blue,
      ),


      body: const Center(
        child: Text("Página com as questões")
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
      currentIndex: 0,
      onTap: (index) {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaResultado()),
          );
        }
        
      },
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
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Text("Página de resutado"),
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
        ]
      ),
    );
  }
}