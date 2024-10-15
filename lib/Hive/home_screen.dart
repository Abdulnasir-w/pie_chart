import 'package:example/Hive/Model/person_model.dart';
import 'package:example/Hive/Services/hive_services.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHomeScreen extends StatefulWidget {
  const HiveHomeScreen({super.key});

  @override
  State<HiveHomeScreen> createState() => _HiveHomeScreenState();
}

class _HiveHomeScreenState extends State<HiveHomeScreen> {
  final HiveServices services = HiveServices();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  bool isBoxOpen = false;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    await Hive.openBox<PersonModel>("dumyBox");
    setState(() {
      isBoxOpen = true;
    });
  }

  void save() {
    String name = nameController.text.trim();
    int? id = int.tryParse(idController.text.trim());

    if (name.isNotEmpty && id != null) {
      var person = PersonModel(name: name, id: id);
      services.addNew(person);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Saved Successfully")),
      );
      nameController.clear();
      idController.clear();
    }
  }

  Future<void> editPerson(int index) async {
    var person = Hive.box<PersonModel>("dumyBox").getAt(index);
    nameController.text = person!.name;
    idController.text = person.id.toString();

    setState(() {
      services.update(index, person);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Hive Example",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: isBoxOpen
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: idController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Id",
                      labelText: "Id",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: save, child: const Text("Save")),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable:
                          Hive.box<PersonModel>("dumyBox").listenable(),
                      builder: (context, Box<PersonModel> box, _) {
                        if (box.isEmpty) {
                          return const Center(
                            child: Text("No person available."),
                          );
                        }
                        return ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            final person = box.getAt(index);
                            return Dismissible(
                              key: Key(person!.id.toString()),
                              background: slideRightBackground(),
                              secondaryBackground: slideLeftBackground(),
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.startToEnd) {
                                  editPerson(index);
                                  return false; // Prevent dismiss to keep the item in the list
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  return await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirm"),
                                        content: const Text(
                                            "Are you sure you want to delete this item?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pop(false),
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                                return false;
                              },
                              onDismissed: (direction) {
                                services.delete(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Item deleted"),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(person.name),
                                subtitle: Text('ID: ${person.id}'),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Icon(Icons.edit, color: Colors.white),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
