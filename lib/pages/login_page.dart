import 'package:baklavasina/models/auth_user.dart';
import 'package:baklavasina/pages/sign_up_page.dart';
import 'package:baklavasina/repositories/auth_repository.dart';
import 'package:baklavasina/widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthRepository authRepository = Get.put(AuthRepository());
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _forgetpasswordcontroller = TextEditingController();
  final String _errorMessage = "Email veya şifre hatalı";
  @override
  void initState() {
    AuthRepository _authrepository = Get.put(AuthRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthRepository>(
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).primaryColorDark,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BAKLAVASINA",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor)),
              CustomFormFieldWidget(
                hintText: "E posta",
                icon: Icons.email,
                controller: _emailcontroller,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 15,
                ),
                padding: EdgeInsets.all(4),
              ),
              CustomFormFieldWidget(
                obsucreText: true,
                hintText: "Şifre",
                icon: Icons.lock,
                controller: _passwordcontroller,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                padding: EdgeInsets.all(4),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: CustomFormFieldWidget(
                              hintText: "E posta",
                              icon: Icons.email,
                              controller: _forgetpasswordcontroller,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.all(4),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _forgetpasswordcontroller.clear();
                                },
                                child: Text(
                                  "Kapat",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  forgetPassword(
                                      _forgetpasswordcontroller.text);
                                  _forgetpasswordcontroller.clear();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Gönder",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Şifremi Unuttum",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        "Kayıt ol",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () async {
                  login(
                      context, _emailcontroller.text, _passwordcontroller.text);
                },
                child: Text("Giriş Yap"),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          )),
        );
      },
    );
  }

  void login(BuildContext ctx, String email, String password) async {
    AuthUser _loginUser = await authRepository.signInWithEmail(email, password);
    if (_loginUser.userID != null) {
      print("Giriş yapan user: ${_loginUser.userID}");
    } else {
      showDialog(
          context: ctx,
          builder: (ctx) => AlertDialog(
                title: Text(
                  "Email veya şifre hatalı",
                  style: Theme.of(ctx)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      "Kapat",
                      style: Theme.of(ctx)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(ctx).primaryColor),
                    ),
                  ),
                ],
              ));
    }
  }

  void forgetPassword(String email) async {
    await authRepository.sendPasswordResetEmail(email);
  }
}
