// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:async';

// class QuizProvider with ChangeNotifier {
//   int number1 = 0;
//   int number2 = 0;
//   List<int> options = [];
//   dynamic correctAnswer = 0;
//   String message = '';
//   int? selectedAnswer;
//   int questionNumber = 1;
//   int maxQuestions;
//   String operator = '';

//   QuizProvider({this.maxQuestions = 10}) {
//     generateQuestion();
//   }
//   void generateQuestion() {
//     Random random = Random();
//     number1 = random.nextInt(100);
//     number2 = random.nextInt(100);
//     int operatorIndex = random.nextInt(4);

//     switch (operatorIndex) {
//       case 0:
//         operator = '+';
//         correctAnswer = number1 + number2;
//         break;
//       case 1:
//         operator = '-';
//         correctAnswer = number1 - number2;
//         break;
//       case 2:
//         operator = '*';
//         correctAnswer = number1 * number2;
//         break;
//       case 3:
//         operator = '/';
//         if (number2 == 0) number2 = 1;
//         correctAnswer = number1 ~/ number2;
//         break;
//     }
//     Set<int> numbers = {};
//     numbers.add(correctAnswer);
//     while (numbers.length < 9) {
//       int randomNumber = random.nextInt(199);
//       if (randomNumber != correctAnswer) {
//         numbers.add(randomNumber);
//       }
//     }
//     options = numbers.toList();
//     options.shuffle();
//     message = '';
//     selectedAnswer = null;
//     notifyListeners();
//   }

//   void selectAnswer(int answer) {
//     selectedAnswer = answer;

//     if (answer == correctAnswer) {
//       message = 'Correct!';
//       notifyListeners();
//       Future.delayed(const Duration(seconds: 2), () {
//         nextQuestion();
//       });
//     } else {
//       message = 'Try Again!';
//       notifyListeners();
//     }
//   }

//   void nextQuestion() {
//     if (questionNumber < maxQuestions) {
//       questionNumber++;
//       generateQuestion();
//     } else {
//       message = 'Quiz Completed!  Thank You';
//     }
//     selectedAnswer = null;
//     notifyListeners();
//   }
// }

// class CalculateQuiz extends StatelessWidget {
//   const CalculateQuiz({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => QuizProvider(maxQuestions: 20),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Math Quiz'),
//         ),
//         body: Consumer<QuizProvider>(
//           builder: (context, quizProvider, child) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Question ${quizProvider.questionNumber} of ${quizProvider.maxQuestions}',
//                         style: const TextStyle(fontSize: 22),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'What is ${quizProvider.number1} ${quizProvider.operator} ${quizProvider.number2}?',
//                         style: const TextStyle(fontSize: 24),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     GridView.builder(
//                       shrinkWrap: true,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                       ),
//                       itemCount: quizProvider.options.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             quizProvider
//                                 .selectAnswer(quizProvider.options[index]);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: quizProvider.selectedAnswer ==
//                                       quizProvider.options[index]
//                                   ? (quizProvider.options[index] ==
//                                           quizProvider.correctAnswer
//                                       ? Colors.green
//                                       : Colors.red)
//                                   : Colors.blueAccent,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 quizProvider.options[index].toString(),
//                                 style: const TextStyle(
//                                   fontSize: 24,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       quizProvider.message,
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: quizProvider.message == 'Correct!'
//                             ? Colors.green
//                             : Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
