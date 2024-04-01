import 'package:flutter/material.dart';
import 'package:todo_app/taskRow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int counter = 0;
  List<Widget> taskWidgetList = [];
  TextEditingController taskController = TextEditingController();
  void addWidgetintoList(String taskName) {
    final key = UniqueKey(); // i dont understand this
    taskWidgetList.add(CustomRowTask(
      key: key,
      taskName: taskName,
      deleteWidgetCallback: () {
        setState(() {
          taskWidgetList.removeWhere((element) => element.key == key);
          // taskWidgetList.removeAt(0);
        });
      },
    ));
  }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text('Todoey'),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Todoey',
                    style: TextStyle(color: Colors.white, fontSize: 58),
                  ),
                  Text(
                    ' ${taskWidgetList.length} Task',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: taskWidgetList.isEmpty
                      ? const Center(
                          child: Text(
                            'There is no task...\nTap on the + Icon to add on task',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.builder(
                          itemCount: taskWidgetList.length,
                          itemBuilder: (context, index) {
                            return taskWidgetList[index];
                          },
                        ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    controller: taskController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        if (taskController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title:
                                        const Text('You have not entered any task'),
                                    content: const Text(
                                        'Type something and then press enter'),
                                    actions: [
                                      IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: const Icon(Icons.close))
                                    ],
                                  ));
                        } else {
                          Navigator.pop(context);
                          setState(() {
                            addWidgetintoList(taskController.text);
                            taskController.clear();
                          });
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Colors.lightBlueAccent)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Add Task',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                )
              ],
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
