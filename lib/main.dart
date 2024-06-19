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
    Question('1. O que é Flutter?:', ['a) Flutter é um framework de código aberto desenvolvido pelo Google para criar interfaces de usuário nativas de alta qualidade em plataformas móveis (iOS e Android) e web a partir de uma única base de código.', 'b) Flutter utiliza a linguagem java e Dotnet para escrever aplicativos, não ferecendo um ambiente de desenvolvimento rápido e eficiente.', 'c) É conhecido por sua performance lenta e por proporcionar uma experiência visual pouco atrativa através de seus widgets.'], null, 0),
    Question('2. Quais são as vantagens de usar Flutter?:', ['a)Desenvolvimento rápido de aplicativos para múltiplas plataformas a partir de um único código-fonte.', 'b) Widgets personalizáveis e de baixo desempenho que oferecem uma experiência para poucos programadores.', 'c) Pouca comunidade de desenvolvedores e sem suporte do Google.'], null, 0),
    Question('3. Quais são os principais componentes do Flutter?:', ['a) Widgets: São os blocos de construção básicos da interface do usuário no Flutter, que juntos formam a estrutura visual dos aplicativos.', 'b) java basico e c#: São as diretrizes de design do Flutter para criar aplicativos.', 'c) Clipper: A linguagem de programação utilizada pelo Flutter, conhecida por sua sintaxe Complexa para aplicativos móveis.'], null, 0),
    Question('4. Como o Flutter se compara a outras tecnologias de desenvolvimento móvel?:', ['a) Ao contrário de abordagens baseadas em WebView, como o Cordova, Flutter produz aplicativos nativos que não dependem de navegadores para renderização.', 'b)  Em comparação com frameworks como React Native, Flutter geralmente oferece menos performance e pouca experiência de usuário mais consistente. .', 'c) A curva de aprendizado pode ser mais complexo devido a uma linguagem sem suporte .'], null, 0),
    Question('5. Quais são os casos de uso ideais para Flutter?:', ['a) Desenvolvimento de aplicativos que precisam ser lançados rapidamente em várias plataformas sem comprometer a performance.', 'b)Projetos que exigem interfaces pouco personalizáveis e visualmente .', 'c) Aplicativos que necessitam de suporte contínuo e atualizações demoradas e recursos pouco eficiente.'], null,0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        questions[index].text,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          if (index == 0) {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const inicio()),
          ); 
        } else if(index==1) {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const inicio()),
          );
        } else {
           calculateAndNavigate();
          }
        },
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
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const inicio()),
          );
        }
        },
    ),
    );
  }
}