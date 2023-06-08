import 'package:flutter/material.dart';
import 'color_theme.dart';


///  忘记密码界面
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
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
                    height: 30,
                  ),
                  const Text("忘记密码",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  const SizedBox(
                    height: 38,
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                            color: primary,
                            onPressed: () {
                              forgotPassword();
                            },
                            child: const Text(
                              "完成",
                              style: TextStyle(color: white),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  forgotPassword() {
    String emailField = _controllerEmail.text;
    if (emailField.isNotEmpty) {
      // process api here
      alertSample(emailField);
    }
  }


  /// 获取短信验证码弹框
  Future<void> alertSample(email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("获取短信验证码"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("发送验证码至 $email 手机"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text("确认"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

