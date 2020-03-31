import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mobx/mobx.dart';

part 'contact_controller.g.dart';

class ContactController = _ContactControllerBase with _$ContactController;

abstract class _ContactControllerBase with Store {
  @observable
  String nome = "";
  @observable
  String email = "";
  @observable
  String message = "";
  @observable
  String errorText = "";
  @observable
  bool loading = false;

  void _clean() {
    changeEmail("");
    changeEmail("");
    changeMessage("");
  }

  @action
  changeName(String value) => nome = value;
  @action
  changeEmail(String value) => email = value;
  @action
  changeMessage(String value) => message = value;
  @action
  changeErrorText(String value) => errorText = value;

  @action
  checkMessage() async {
    loading = true;
    if (this.nome.isEmpty || this.email.isEmpty || this.message.isEmpty)
      changeErrorText("Favor, Preencher todos os campos");
    else if (this.nome.length < 3)
      changeErrorText("Campo nome deve ser maior que 3");
    else if (!this.email.contains("@") || !this.email.contains(".com"))
      changeErrorText("Formato de email incorreto");
  }

  sendEmail() async {
    checkMessage();
    if (errorText.isEmpty) {
      final Email email = Email(
        body: message,
        subject: 'Contato via app',
        recipients: ['blabla@gmail.com'],
        isHTML: false,
      );
      try {
        await FlutterEmailSender.send(email);
        _clean();
        loading = false;
      } catch (e) {
        changeErrorText("Falha o enviar mensagem");
        loading = false;
      }
    } else {
      loading = false;
    }
  }
}
