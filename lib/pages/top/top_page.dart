import 'package:flutter/material.dart';
import 'package:quiz_app_sample/pages/quiz/quiz_page.dart';
import 'package:quiz_app_sample/pages/top/top_page_string.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _TopPageState()
    );
  }
}

class _TopPageState extends StatelessWidget {
  const _TopPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(appTitle),
            ElevatedButton(
              child: const Text(startBtn),
              onPressed: () {
                // 押下時処理
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Quiz(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
