import 'package:flutter/material.dart';
import './memo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import './add_memo.dart';

class MemoList extends StatefulWidget {
  final List<Memo> memolist;

  MemoList(this.memolist);

  @override
  State<MemoList> createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {

  void onDismissed(int index) {
    setState(() {
      widget.memolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Slidable(
            key: ValueKey(0),
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => onDismissed(index),
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                )
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.memolist[index].contents,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(formatter.format(mydate)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: widget.memolist.length,
      ),
    );
  }
}
