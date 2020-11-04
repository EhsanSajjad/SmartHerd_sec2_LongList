import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Long List View",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long List View"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
        },
        child: Icon(Icons.multiline_chart),
        tooltip: 'Add one more item',
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("you just tapped $item"),
    action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          debugPrint('Performmaing dummy Undo operatin');
        }),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(50, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        showSnackBar(context, listItems[index]);
      },
    );
  });
  return listView;
}
