import 'dart:math';
import 'package:flutter/material.dart';

class Calculate1 extends StatefulWidget {
  const Calculate1({super.key});

  @override
  State<Calculate1> createState() => _Calculate1State();
}

class _Calculate1State extends State<Calculate1> {
  int number1 = 0;
  int number2 = 0;
  List<int> options = [];
  dynamic correctAnswer = 0;
  String message = '';
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 95,
                      width: 155,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          'First = $number1',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 95,
                      width: 155,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          'Second = $number2',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generateRandomNumbers();
                  generateOptions();
                  message = '';
                  selectedAnswer = null;
                });
              },
              child: const Text('Calculate1'),
            ),
            const SizedBox(height: 20),
            if (options.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnswer = options[index];
                        if (options[index] == correctAnswer) {
                          message = 'Correct!';
                        } else {
                          message = 'Try Again!';
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedAnswer == options[index]
                            ? (options[index] == correctAnswer
                                ? Colors.green
                                : Colors.red)
                            : Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          options[index].toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                fontSize: 24,
                color: message == 'Correct!' ? Colors.green : Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  void generateRandomNumbers() {
    Random random = Random();
    number1 = random.nextInt(100);
    number2 = random.nextInt(100);
  }

  void generateOptions() {
    correctAnswer = number1 + number2;

    Random random = Random();
    Set<int> numbers = {};
    numbers.add(correctAnswer);
    while (numbers.length < 9) {
      int randomNumber = random.nextInt(999);
      if (randomNumber != correctAnswer) {
        numbers.add(randomNumber);
      }
    }
    options = numbers.toList();
    options.shuffle();
  }
}
