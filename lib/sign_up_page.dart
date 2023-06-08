import 'package:flutter/material.dart';
import 'color_theme.dart';


/// 注册界面
class SignUpPage extends StatefulWidget {
  const SignUpPage ({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// 账号编辑控制器
  final TextEditingController _controllerEmail = TextEditingController();

  /// 密码编辑控制器
  final TextEditingController _controllerPassword = TextEditingController();

  /// 用户名
  final TextEditingController _controllerFullname = TextEditingController();

  /// 是否隐藏密码
  bool isShowPassword = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      resizeToAvoidBottomInset: false,
    );
  }

///
  Widget getBody() {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Icon(Icons.arrow_back_ios),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "注册",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    width: 45,
                    height: 5,
                    decoration: const BoxDecoration(color: primary),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    cursorColor: primary,
                    controller: _controllerEmail,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                        hintText: "请输入你的手机号/邮箱号",
                        hintStyle: TextStyle(fontSize: 14)
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    obscureText: !isShowPassword,
                    cursorColor: primary,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 14),
                        hintText: "请输入密码",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: primary)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: primary)),
                        suffixIcon: FlatButton(
                            onPressed: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                            child: Icon(
                              isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primary,
                            ))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    cursorColor: primary,
                    controller: _controllerFullname,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)),
                      hintText: "用户名",
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                            color: primary,
                            onPressed: () {
                              signUP();
                            },
                            child: const Text(
                              "完成",
                              style: TextStyle(color: white),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }


  signUP(){
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    String fullName = _controllerFullname.text;
    print("$email, $password, $fullName");
  }
}
