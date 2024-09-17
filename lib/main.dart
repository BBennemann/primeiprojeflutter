import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado!' : 'Pode entrar!',
              style: TextStyle(
                  fontSize: 30,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w500
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 60,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      //Corzinha quando clica
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.4) : Colors.white,
                      //padding: const EdgeInsets.fromLTRB(32, 32, 32, 32), //padding do botao em relação ao texto
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: Colors.green, width: 5) // Coloca uma borda colorida e com epessura
                          borderRadius: BorderRadius.circular(
                              20) //Faz o botao arrendondar
                      )
                  ),
                  child: const Text('Saiu',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black)
                  ),
                ),
                const SizedBox(width: 32,),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: isFull ? Colors.white.withOpacity(0.4) : Colors.white,
                      //padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: Colors.green, width: 5)
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  child: const Text('Entrou',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black)
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
