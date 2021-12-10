import 'package:flutter/material.dart';
import './memo.dart';

class MemoList extends StatelessWidget {
  final List<Memo> memolist;

  MemoList(this.memolist);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Text(memolist[index].contents),
              ),
          );
        },
        itemCount: memolist.length,
      ),
    );
  }
}
