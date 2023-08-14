import 'package:first_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  bool isNullOrEmpty(String? value){
    return value == null || value.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
          toolbarHeight: screenSize.height / 15,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenSize.height - screenSize.height / 10,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (isNullOrEmpty(value)) {
                        return 'Nome da tarefa não pode ser vazio';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                        fillColor: Colors.white38,
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (isNullOrEmpty(value) ||
                          int.parse(value!) > 5 ||
                          int.parse(value) < 1) {
                        return "Adicione um numero inteiro de 1 a 5";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: difficultController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white38,
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (isNullOrEmpty(value)) {
                        return 'Coloque uma cara na sua tarefa!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    controller: imageController,
                    onChanged: (text) {
                      setState(() {});
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Image',
                        fillColor: Colors.white38,
                        filled: true),
                  ),
                ),
                Container(
                  width: 92,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageController.text, fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                      return Container(
                        color: Colors.white38,
                      );
                    }),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        TaskInherited.of(widget.taskContext).newTask(nameController.text, imageController.text, int.parse(difficultController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Printando tudo"),)
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Adicionar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
