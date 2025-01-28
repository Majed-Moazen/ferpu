import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('clickable Example')),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Slidable(
            direction: Axis.horizontal,
            key: ValueKey(index),
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  spacing: 10,
                  onPressed: (BuildContext context) {
                    print("Item $index deleted");
                  },
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text('Title $index'),
                subtitle: Text('Subtitle $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}
