import 'package:flutter/material.dart';
import 'package:infinito/models/therapies_manager.dart';
import 'package:infinito/models/therapy.dart';
import 'package:infinito/screens/edit_therapy/components/images_form.dart';
import 'package:provider/provider.dart';

class EditTherapyScreen extends StatelessWidget {
  EditTherapyScreen(Therapy t)
      : editing = t != null,
        therapy = t != null ? t.clone() : Therapy();

  final Therapy therapy;
  final bool editing;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider.value(
      value: therapy,
      child: Scaffold(
        appBar: AppBar(
          title: Text(editing ? 'Editar Terapia' : 'Criar Terapia'),
          centerTitle: true,
          actions: <Widget>[
            if (editing)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<TherapiesManager>().delete(therapy);
                  Navigator.of(context).pop();
                },
              )
          ],
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              ImagesForm(therapy),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      initialValue: therapy.name,
                      decoration: const InputDecoration(
                        hintText: 'Título',
                        border: InputBorder.none,
                      ),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      validator: (name) {
                        if (name.length < 6) return 'Título muito curto';
                        return null;
                      },
                      onSaved: (name) => therapy.name = name,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Descrição',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      initialValue: therapy.description,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                          hintText: 'Descrição', border: InputBorder.none),
                      maxLines: null,
                      validator: (desc) {
                        if (desc.length < 10) return 'Descrição muito curta';
                        return null;
                      },
                      onSaved: (desc) => therapy.description = desc,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Resumo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      initialValue: therapy.description,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                          hintText: 'Resumo', border: InputBorder.none),
                      maxLines: null,
                      validator: (desc) {
                        if (desc.length < 10) return 'Resumo muito curta';
                        return null;
                      },
                      onSaved: (brief) => therapy.brief = brief,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<Therapy>(
                      builder: (_, therapy, __) {
                        return SizedBox(
                          height: 44,
                          child: RaisedButton(
                            onPressed: !therapy.loading
                                ? () async {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();

                                      await therapy.save();

                                      context
                                          .read<TherapiesManager>()
                                          .update(therapy);

                                      Navigator.of(context).pop();
                                    }
                                  }
                                : null,
                            textColor: Colors.white,
                            color: primaryColor,
                            disabledColor: primaryColor.withAlpha(100),
                            child: therapy.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    'Salvar',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
