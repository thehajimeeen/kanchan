import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';

class AddMemoPage extends StatefulWidget {
  final Function addTx;

  AddMemoPage(this.addTx);

  @override
  _AddMemoPageState createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {
  
  final memoController = TextEditingController();

  void submitData() {
    final enteredMemo = memoController.text;

    if (enteredMemo.isEmpty) {
      return;
    }

    widget.addTx(enteredMemo);

    Navigator.of(context).pop();
  }

  var mydate = new DateTime.now();
  var formatter = new DateFormat.Md().add_Hm();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: memoController,
              decoration: const InputDecoration(
                labelText: 'メモの内容を書け',
              ),
            ),
            TextField(
              onTap: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) {},
                  onConfirm: (date) {
                    setState(() {
                      mydate = date;
                    });
                  },
                  currentTime: DateTime.now(),
                );
              },
              decoration: const InputDecoration(labelText: '日時を指定しろ'),
            ),
            FlatButton(
              child: const Text('メモを追加しろ'),
              textColor: Colors.blue,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
