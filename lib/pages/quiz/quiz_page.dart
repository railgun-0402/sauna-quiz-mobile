import 'package:flutter/material.dart';
import 'package:quiz_app_sample/model/question.dart';
import 'package:quiz_app_sample/pages/quiz/quiz_page_string.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //出題中の問題の番号
  int questionIndex = 0;
  int questionNumber = 0;

  //クエスチョンオブジェクトの一覧
  List<Question> questionList = [
    Question(q:"これはFlutterを使ったアプリである", a:true),
    Question(q:"このアプリには、Javaというプログラミング言語を使用している", a:false),
    Question(q:"FlutterはGoogleが開発しているフレームワークである", a:true),
    Question(q:"このアプリは嘘つきだ", a:true),
  ];
  //回答があっているかをチェックする
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionList[questionNumber].questionAnswer;

    // 最終問題でなければ次の問題へ
    if (questionIndex <= questionList.length) {
      questionIndex++;
    }

    if (userPickedAnswer == correctAnswer) {
      // 正解した場合
      print(right);
      setState(() {
        //質問番号のインデックスを越えないようにする
        if (questionIndex < questionList.length) {
          questionNumber = questionIndex;
          scoreKeeper.add(
              const Icon(Icons.check, color: Colors.green)
          );
        }
        if (questionIndex == questionList.length) {
          scoreKeeper.add(
            const Icon(Icons.check, color: Colors.green,),
          );
        }
      });
    } else {
      // 間違えた場合
      print(wrong);
      setState(() {
        //質問番号のインデックスを越えないようにする
        if (questionIndex < questionList.length) {
          questionNumber = questionIndex;
          scoreKeeper.add(
              const Icon(Icons.close, color: Colors.red)
          );
        }
        if (questionIndex == questionList.length) {
          scoreKeeper.add(
              const Icon(Icons.close, color: Colors.red)
          );
        }
      });
    }
  }

  //ウィジェットを配列として扱い、childに代入したい場合はList<widget>というデータ型にする
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //質問内容のテキスト
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //出題中の番号に対応するテキストを表示する
                questionList[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // はいボタン
        _AnswerButton(true),
        // いいえボタン
        _AnswerButton(false),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  // 解答ボタン
  // ignore: non_constant_identifier_names
  Widget _AnswerButton(kinds) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
          // 押下時
          checkAnswer(kinds ? true : false);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(kinds ? Colors.green : Colors.red),
        ),
        child: Text(
          kinds ? 'はい' : 'いいえ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    ));
  }
}

