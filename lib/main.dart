import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> nomyo = [
    {
      'nom': 'Badio',
      'prenom': 'Marcklens',
      'email': 'baddesignhaiti@gmail.com',
      'lekol': ['IPEPH de Musac', 'ESIH'],
    },
    {
      'nom': 'Desannées',
      'prenom': 'Jamesly',
      'email': 'jdesannees3@gmail.com',
      'lekol': ['College Exclesior', 'ESIH'],
    },
    {
      'nom': 'Eustache',
      'prenom': 'Naphtala',
      'email': 'naphtala@example.com',
      'lekol': ['College Canado', 'Ecole N', 'ESIH'],
    },
    {
      'nom': 'Nicolas',
      'prenom': 'Livenson',
      'email': 'nicolaslivenson@gmail.com',
      'lekol': ['IPEPH de Musac', 'ESIH'],
    },
    {
      'nom': 'Omeus',
      'prenom': 'Marc-Donald',
      'email': 'macdonald@example.com',
      'lekol': ['Saint Louis de Gonzage', 'ESIH'],
    },

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devwa jou 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Moun'),
        ),
        body: ListView.builder(
          itemCount: nomyo.length,
          itemBuilder: (context, index) {
            final chakmoun = nomyo[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pajinfomoun(chakmoun: chakmoun),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${chakmoun['nom']} ${chakmoun['prenom']}',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Pajinfomoun extends StatelessWidget {
  final Map<String, dynamic> chakmoun;

  Pajinfomoun({required this.chakmoun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${chakmoun['nom']} ${chakmoun['prenom']}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Infochakmounel(chakmoun: chakmoun),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),

              child: Text(
                'Info Pèsonèl',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormasyonAkademik(chakmoun: chakmoun),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),

              child: Text(
                'Fòmasyon Akademik',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Infochakmounel extends StatelessWidget {
  final Map<String, dynamic> chakmoun;

  Infochakmounel({required this.chakmoun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Pèsonèl'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Enfòmasyon pèsonèl sou ${chakmoun['nom']} ${chakmoun['prenom']}:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              'Nom: ${chakmoun['nom']}',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Text(
              'Prenom: ${chakmoun['prenom']}',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            SizedBox(height: 8.0),

            SizedBox(height: 8.0),
            Text(
              'Email: ${chakmoun['email']}',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class FormasyonAkademik extends StatelessWidget {
  final Map<String, dynamic> chakmoun;

  FormasyonAkademik({required this.chakmoun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fòmasyon Akademik'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fòmasyon Akademik pou ${chakmoun['nom']} ${chakmoun['prenom']}:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8.0),
            ...List.generate(
              chakmoun['lekol'].length,
              (index) => Text(
                '${index + 1}- ${chakmoun['lekol'][index]}',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
