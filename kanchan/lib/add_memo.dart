import 'package:flutter/material.dart';

class AddMemoPage extends StatefulWidget {
  final Function addTx;

  AddMemoPage(this.addTx);

  @override
  _AddMemoPageState createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {

  final memoController = TextEditingController();

  void submitData () {
    final enteredMemo = memoController.text;

    if (enteredMemo.isEmpty) {
      return;
    }

    widget.addTx(enteredMemo);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: memoController,
            ),
            FlatButton(
              child: Text('Add Memo'),
              textColor: Colors.blue,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
