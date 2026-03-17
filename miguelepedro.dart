import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GAMEVAULG',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List jogos = [
    {
      "nome": "GTA V",
      "genero": "Ação",
      "nota": "9.5",
      "imagem": "https://upload.wikimedia.org/wikipedia/en/a/a5/Grand_Theft_Auto_V.png"
    },
    {
      "nome": "FIFA 26",
      "genero": "Esporte",
      "nota": "8.8",
      "imagem": "https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/EA_FC_26_Cover.jpg/250px-EA_FC_26_Cover.jpg"
    },
    {
      "nome": "Minecraft",
      "genero": "Sandbox",
      "nota": "10",
      "imagem": "https://upload.wikimedia.org/wikipedia/pt/9/9c/Minecraft_capa.png"
    },
    {
      "nome": "Call of Duty",
      "genero": "FPS",
      "nota": "9.0",
      "imagem": "https://upload.wikimedia.org/wikipedia/pt/1/18/Call_of_Duty_WWII_Cover_Art.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GAMEVAULG"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: jogos.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[900],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      jogos[index]["imagem"],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.broken_image, size: 40),
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jogos[index]["nome"],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        jogos[index]["genero"],
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                      jogos[index]["nota"],
                        style: TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}