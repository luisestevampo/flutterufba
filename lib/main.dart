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
              
            child: const Text("Iniciar teste"))
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
        ],
         currentIndex: 0,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FirstPage()),
          ); 
        } 
        },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Questão 1"),
            Text("Questão 2"),
            Text("Questão 3"),
            Text("Questão 4"),
            Text("Questão 5"),
          ],
          
        )
        
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
        } else if (index == 0 ) {
            Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const inicio()),
            );
        } else {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const inicio())
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
        title: const Text("Página de Resultado"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: const Center(
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
        ],
        currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const FirstPage()),
          ); 
        } else if (index == 1 ) {
            Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const inicio()),
            );
        }
      },
      ),
    );
  }
}