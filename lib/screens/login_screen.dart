import 'package:desafio/screens/widgets/botton_anime.dart';
import 'package:desafio/screens/widgets/button_login_redeSocial.dart';
import 'package:desafio/screens/widgets/error_dialog.dart';
import 'package:desafio/screens/widgets/logo.dart';
import 'package:desafio/utils/color_schemes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final double _radius = 80;
  bool _avanca = false;
  bool alinhado = false;
  bool isError = false;

  final buttonKey = GlobalKey();
  final aninamatedKey = GlobalKey();
  Offset position = const Offset(0, 0);

  String login = '';
  String senha = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ///set a posicação inicial para o animated container
  void getButtonPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? box =
          buttonKey.currentContext!.findRenderObject() as RenderBox?;

      Offset? positionLocal = box?.localToGlobal(Offset.zero);

      if (positionLocal != null) {
        var meioWidth = box!.size.width / 2;

        setState(() {
          position = Offset(positionLocal.dx + meioWidth, positionLocal.dy);
          alinhado = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: mediaQuery.width,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 800, maxWidth: 800),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(image: 'assets/images/logo.png'),
                    const SizedBox(height: 50),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: TextField(
                        onChanged: ((value) => login = value),
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                              color: Color(0xFF6750A4),
                            ),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: TextField(
                        onChanged: ((value) => senha = value),
                        decoration: const InputDecoration(
                          label: Text(
                            'Senha',
                            style: TextStyle(
                              color: Color(0xFF6750A4),
                            ),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6750A4))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black.withOpacity(0.5),
                              decorationThickness: 1,
                            ),
                          ),
                          Botao(
                            label: 'Entrar',
                            isLoading: isLoading,
                            key: buttonKey,
                            onTap: () async {
                              // errorLogin();
                              setState(() {
                                isError = false;
                                _avanca = false;
                              });

                              await Future.delayed(const Duration(seconds: 1));

                              setState(() {
                                isLoading = !isLoading;
                              });
                              getButtonPosition();
                              await Future.delayed(const Duration(seconds: 3));

                              setState(() {
                                isLoading = false;
                                if (login == 'email@email.com.br' &&
                                    senha == '123') {
                                  _avanca = true;
                                } else {
                                  isError = true;
                                  _avanca = false;
                                }
                              });
                            },
                            aprovado: _avanca,
                            height: mediaQuery.height,
                            width: mediaQuery.width,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 100,
                      child: Divider(
                        color: lightColorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: mediaQuery.width * 0.9,
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ButtonLoginRedeSocial(
                              imageLogo: 'assets/images/google.png',
                              color: Color(0xFFEA4335)),
                          ButtonLoginRedeSocial(
                              imageLogo: 'assets/images/facebook.png',
                              color: Color.fromARGB(255, 50, 129, 255)),
                          ButtonLoginRedeSocial(
                              imageLogo: 'assets/images/apple.png',
                              color: Color(0xFF000000)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Copyright © Masterclass 2022'),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              AnimatedPositioned(
                left: isLoading ? position.dx : 0,
                top: isLoading ? position.dy : 0,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _avanca = false;
                      isError = false;
                    });
                  },
                  child: AnimatedOpacity(
                    opacity: _avanca ? 1 : 0,
                    duration: const Duration(microseconds: 100),
                    child: AnimatedContainer(
                      key: aninamatedKey,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        color: Color(0xFF6750A4), //Color(0xFF6750A4),
                        borderRadius:
                            BorderRadius.circular(_avanca == false ? 40 : 0),
                      ),
                      // color: Colors.blue, // Color(0xFF6750A4),
                      height: _avanca ? mediaQuery.height : 40,
                      width: _avanca ? mediaQuery.width : 50,
                    ),
                  ),
                ),
              ),
              ErrorDialog(
                isError: isError,
                mediaQuery: mediaQuery,
                onTap: () {
                  setState(() {
                    isError = !isError;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
