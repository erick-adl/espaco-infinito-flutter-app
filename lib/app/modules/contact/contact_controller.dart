import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/state_manager.dart';

class ContactController extends GetxController {
  final nome = "".obs;

  final email = "".obs;

  final message = "".obs;

  final errorText = "".obs;

  final loading = false.obs;

  void _clean() {
    changeEmail("");
    changeEmail("");
    changeMessage("");
  }

  changeName(String value) => nome.value = value;

  changeEmail(String value) => email.value = value;

  changeMessage(String value) => message.value = value;

  changeErrorText(String value) => errorText.value = value;

  checkMessage() async {
    loading.value = true;
    if (this.nome.value.isEmpty ||
        this.email.value.isEmpty ||
        this.message.value.isEmpty)
      changeErrorText("Favor, Preencher todos os campos");
    else if (this.nome.value.length < 3)
      changeErrorText("Campo nome deve ser maior que 3");
    else if (!this.email.value.contains("@") ||
        !this.email.value.contains(".com"))
      changeErrorText("Formato de email incorreto");
  }

  sendEmail() async {
    checkMessage();
    if (errorText.value.isEmpty) {
      final Email email = Email(
        body: message.value,
        subject: 'Contato via app',
        recipients: ['tatiane.monticelli@gmail.com'],
        isHTML: false,
      );
      try {
        await FlutterEmailSender.send(email);
        _clean();
        loading.value = false;
      } catch (e) {
        changeErrorText("Falha o enviar mensagem");
        loading.value = false;
      }
    } else {
      loading.value = false;
    }
  }
}
