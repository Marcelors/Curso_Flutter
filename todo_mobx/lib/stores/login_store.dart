import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisible() =>  passwordVisible = !passwordVisible;

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get isEmailValid =>  RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isFormValid => isPasswordValid && isEmailValid;


  @observable
  bool loading = false;

  @action
  Future<void> login() async{
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;
  }

  @observable
  bool loggedIn = false;

  @computed
  Function get loginPressed => (isEmailValid && isPasswordValid && !loading) ? login : null;
}