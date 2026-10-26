import 'dart:math';
import 'package:flutter/material.dart';

void main()
{
  runApp(dice());
}

class dice extends StatelessWidget 
{
  const dice({super.key});

  @override
  Widget build(BuildContext c)
  {
    return MaterialApp
    (
      title: "Dice Game",
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 185, 171, 150), 
      brightness: Brightness.dark)),
      home: diceGame(),
    );
  }
}

class diceGame extends StatefulWidget
{
  const diceGame({super.key});

  @override
  State<diceGame> createState() => diceGameState();
}

class diceGameState extends State<diceGame>
{
  int numberDieFaces = 6;
  int defaultDiceValue = 1;
  late int winningValue;

  late int dice_1 = defaultDiceValue;
  late int dice_2 = defaultDiceValue;
  late int total = dice_1 + dice_2;

  bool _showImage = false;

  @override
  Widget build(BuildContext c)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text("Roll the Dice!"), backgroundColor: Theme.of(c).colorScheme.primary),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Total Is $total", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 150),

            AnimatedOpacity(
              opacity: _showImage ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 30),
              child: Image.asset( 
                'assets/images/hanannah-happie.gif',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            
            SizedBox(height: 100),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$dice_1"),
                SizedBox(width: 20,),
                Text("$dice_2")
              ]
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: ElevatedButton(onPressed: roll, child: Text("Roll"))) ,
                SizedBox(width:20),
                Expanded(child: ElevatedButton(onPressed: reset , child: Text("Reset")))
              ]
            )
          ]
        )
      )
    );
  }

  void reset()
  {
    setState(()
    {
      dice_1 = defaultDiceValue;
      dice_2 = defaultDiceValue;
      total = 2;
      _showImage = false;
    });
  }

  void roll()
  {
    setState(()
    {
      _showImage = false;

      winningValue = Random().nextInt((numberDieFaces - 1) * 2) + 2;
      dice_1 = Random().nextInt(numberDieFaces) + 1;
      dice_2 = Random().nextInt(numberDieFaces) + 1;
      total = dice_1 + dice_2;
      
      if(total == winningValue)
      {
        _showImage = true;
      }
    });
  }
}