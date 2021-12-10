import 'package:flutter/material.dart';
import './add_memo.dart';
import './memo.dart';
import './memo_list.dart';

void main() => runApp(MyMemoApp());

class MyMemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: MemoListPage(),
    );
  }
}

class MemoListPage extends StatefulWidget {
  @override
  State<MemoListPage> createState() => _MemoListPageState();
}

class _MemoListPageState extends State<MemoListPage> {
  List<Memo> usermemoList = [];

  void addNewMemo(String txContents) {
    final newTx = Memo(contents: txContents);

    setState(() {
      usermemoList.add(newTx);
    });
  }

  void startAddNewMemo(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddMemoPage(addNewMemo),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
        actions: [
          IconButton(
            onPressed: () => startAddNewMemo(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: MemoList(usermemoList),
      ),
    );
  }
}
