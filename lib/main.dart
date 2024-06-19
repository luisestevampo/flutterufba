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

class Question {
  String text;
  List<String> options;
  int?selectedOption;
  int correctOption;

  Question(this.text, this.options, this.selectedOption, this.correctOption);
}

class FirstPage extends StatefulWidget{
  const FirstPage ({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  List<Question> questions =[
    Question('Descreva aqui a primeira pergunta:', ['a) Alternativa A', 'b) Alternativa B', 'c) Alternativa C'], null, 0),
    Question('Descreva aqui a primeira pergunta:', ['a) Alternativa A', 'b) Alternativa B', 'c) Alternativa C'], null, 0),
    Question('Descreva aqui a primeira pergunta:', ['a) Alternativa A', 'b) Alternativa B', 'c) Alternativa C'], null, 0),
    Question('Descreva aqui a primeira pergunta:', ['a) Alternativa A', 'b) Alternativa B', 'c) Alternativa C'], null, 0),
    Question('Descreva aqui a primeira pergunta:', ['a) Alternativa A', 'b) Alternativa B', 'c) Alternativa C'], null,0),
  ];

  void calculateAndNavigate() {
    int score = 0;
    for (var question in questions) {
      if (question.selectedOption == question.correctOption) {
        score++;
      }
    }
    double grade = (score / questions.length) * 10;

    bool isApproved = grade >= 6; 

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaResultado(
          grade: grade,
          isApproved: isApproved,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("App Gabaritando"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: Center(
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[index].text,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      for (int i = 0; i < questions[index].options.length; i++)
                        RadioListTile<int>(
                          title: Text(questions[index].options[i]),
                          value: i,
                          groupValue: questions[index].selectedOption,
                          onChanged: (value) {
                            setState(() {
                              questions[index].selectedOption = value;
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
       bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: calculateAndNavigate,
            child: Text('Enviar Respostas'),
          ),
        ),
      ),
    );
  }
}


class TelaResultado extends StatelessWidget {
  const TelaResultado({super.key, required this.grade, required this.isApproved});
  final double grade;
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de Resultado"),
        backgroundColor: isApproved ? Colors.green : Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          isApproved
              ? 'Aluno aprovado com nota $grade'
              : 'Aluno reprovado com nota $grade',
          textAlign: TextAlign.center,
      ),
      ),
      
    );
  }
}