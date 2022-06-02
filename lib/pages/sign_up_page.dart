import 'package:baklavasina/models/auth_user.dart';
import 'package:baklavasina/repositories/auth_repository.dart';
import 'package:baklavasina/widgets/custom_form_field_widget.dart';
import 'package:baklavasina/widgets/dropdown_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _surnamecontroller = TextEditingController();
  TextEditingController _favTeamcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text("BAKLAVASINA",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Theme.of(context).primaryColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomFormFieldWidget(
                hintText: "E posta",
                icon: Icons.email,
                controller: _emailcontroller,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5)),
            CustomFormFieldWidget(
                obsucreText: true,
                hintText: "Şifre",
                icon: Icons.lock,
                controller: _passwordcontroller,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5)),
            CustomFormFieldWidget(
                hintText: "Ad",
                icon: Icons.person,
                controller: _namecontroller,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5)),
            CustomFormFieldWidget(
                hintText: "Soyad",
                icon: Icons.person,
                controller: _surnamecontroller,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5)),
            CustomFormFieldWidget(
                hintText: "Desteklenen takım",
                icon: Icons.people,
                controller: _favTeamcontroller,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5)),
            Padding(
              padding: EdgeInsets.all(15),
              child: DropdownMenuWidget(),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              onPressed: () async {
                SingUp(
                    context, _emailcontroller.text, _passwordcontroller.text);
              },
              child: Text("Kayıt Ol"),
            ),
          ],
        ),
      ),
    );
  }

  void SingUp(BuildContext context, String email, String password) async {
    AuthRepository _authrepository = Get.put(AuthRepository());
    AuthUser _user = await _authrepository.createUserWithEmail(email, password);
    if (_authrepository.user.userID == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text(
                  "Hata",
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
                      ))
                ],
              ));
    } else {
      Navigator.of(context).pop();
    }
  }
}
