import 'package:flutter/material.dart';

import '../models/user/user.dart';
import '../models/user/user_services.dart';

class Registro extends StatelessWidget {
  Registro({Key? key}) : super(key: key);

  final UserLocal userLocal = UserLocal();
  final UserServices userServices = UserServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Usuario'),
          backgroundColor: Colors.purple,
          shadowColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Novo Registro",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nome Completo',
                        ),
                        enabled: true,
                        validator: (name) {
                          if (name!.isEmpty) {
                            return 'O campo deve ser preenchido!!';
                          } else if (name.trim().split('').length <= 1) {
                            return 'Preencha com o nome completo!!';
                          }
                          return null;
                        },
                        onSaved: (name) => userLocal.name = name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                        ),
                        enabled: true,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'O campo deve ser preenchido!!';
                          }
                          return null;
                        },
                        onSaved: (email) => userLocal.email = email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                        ),
                        enabled: true,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return 'O campo deve ser preenchido!!';
                          }
                          return null;
                        },
                        onSaved: (password) => userLocal.password = password,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Rede Social',
                        ),
                        enabled: true,
                        validator: (socialmedia) {
                          if (socialmedia!.isEmpty) {
                            return 'O campo deve ser preenchido!!';
                          }
                          return null;
                        },
                        onSaved: (socialmedia) =>
                            userLocal.socialmedia = socialmedia,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                              onPressed: () {}, child: const Text("Cancelar")),
                          OutlinedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  userServices.registro(userLocal);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text("Salvar")),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
