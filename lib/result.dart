import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalAmount;
  final int resultScore;
  final VoidCallback resetHandler;
  final VoidCallback resetOptional;
  final VoidCallback resetAll;

  Result(this.totalAmount, this.resultScore,
      this.resetHandler, this.resetOptional, this.resetAll);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if ((resultScore / totalAmount) >= .90) {
      resultText = 'You are awesome!';
    } else if ((resultScore / totalAmount) >= .80) {
      resultText = 'Pretty likeable!';
    } else if ((resultScore / totalAmount) >= .70) {
      resultText = 'You need to work more!';
    } else if ((resultScore / totalAmount) >= .60) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'You can try again!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
              'Score ' '$resultScore' '/' '$totalAmount',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text('Easy Mode!',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: resetHandler,
          ),
          ElevatedButton(
            child: Text('Hard Mode!',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            onPressed: resetOptional,
          ),
          ElevatedButton(
            child: Text('Reset All Questions!',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            onPressed: resetAll,
          ),//FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
