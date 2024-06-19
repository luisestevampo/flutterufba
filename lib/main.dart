import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

class Questoes {
  String text;
  List<String> opcoes;
  int?OpcaoSelecionada;

  Questoes(this.text, this.opcoes, this.OpcaoSelecionada);
}

class FirstPage extends StatefulWidget{
  const FirstPage ({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
            MaterialPageRoute(builder: (context) => const TelaResultado()),
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
  const TelaResultado({super.key});

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

class Applogic {
  /* 
    criar 5 questões com botão radio (Leonardo)
    setar que a alternativa correta é sempre a letra A


    Cada acerto conta pontuação ++
    if numero de acertos for =>3 exibe tela verde com a mennsagem de aprovado  e pontuação
    else exibe tela ver melha com a mensagem de reprovado ee pontuação
  
  
   */
}

