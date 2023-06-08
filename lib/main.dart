import 'package:flutter/material.dart';
import 'package:login_part01/sign_up_page.dart';
import 'color_theme.dart';
import 'forgot_password_page.dart';

void main() => runApp(
    const MaterialApp(
      // debugShowCheckedModeBanner: true,
      home: MyApp(),
    ));




/// 密码登录界面
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /// 账号编辑控制器
  final TextEditingController _controllerEmail = TextEditingController();

  /// 密码编辑控制器
  final TextEditingController _controllerPassword = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30,),
              const Text("Hi, Alex",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Container(
                width: 90,
                height: 5,
                decoration: const BoxDecoration(
                    color: primary
                ),
              ),
              const SizedBox(height: 40,),
              TextField(
                cursorColor: primary,
                controller: _controllerEmail,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary)
                  ),
                  hintText: "请输入你的手机号/邮箱号",
                  hintStyle: TextStyle(fontSize: 14)
                ),
              ),
              const SizedBox(height: 30,),
              TextField(
                obscureText: !isShowPassword,
                cursorColor: primary,
                controller: _controllerPassword,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(fontSize: 14),
                    hintText: "请输入密码",
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primary)
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primary)
                    ),
                    suffixIcon: FlatButton(onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    }, child: Icon(isShowPassword ? Icons.visibility : Icons.visibility_off, color: primary,))
                ),
              ),
              const SizedBox(height: 30,),
              InkWell(
                  onTap: () {
                    gotoForgotPassword();
                  },
                  child: const Align(child: Text("忘记密码？"), alignment: Alignment.centerRight,)),
              const SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        color: primary,
                        onPressed: () {
                          print("login action");
                        }, child: const Text("登 录",style: TextStyle(color: white),)),
                  )
                ],
              ),
              const SizedBox(height: 30,),
              InkWell(
                  onTap: () {
                    goToSignUpPage();
                  },
                  child: const Align(child: Text("未注册?"),alignment: Alignment.center,))
            ],
          ),
        )
    );
  }


  /// 跳转注册界面
  goToSignUpPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }


  /// 修改密码界面
  gotoForgotPassword() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
  }

}
