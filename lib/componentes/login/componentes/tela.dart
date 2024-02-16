import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../mapa/map_view.dart';

import '../_comun/meu_snackbar.dart';
import '../servicos/autenticacao_servico.dart';
import 'decoracao_campo_autenticacao.dart';
import 'forget_password.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/utils.dart';
import 'package:flutter/gestures.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({Key? key}) : super(key: key);

  @override
  _AutenticacaoTelaState createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: EdgeInsets.fromLTRB(33.06, 0, 0, 36.55),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.487, -1.117),
                end: Alignment(0.931, 1.045),
                colors: <Color>[Color(0xff00427d), Color(0xff003768)],
                stops: <double>[0, 1],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildFormFields(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFormFields() {
    List<Widget> fields = [
      Container(
        // group28o4w (22:756)
        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
        width: 200,
        height: 80,
        child: Image.asset(
          'assets/images/Bus.png',
          width: 213,
          height: 72.76,
        ),
      ),
      /*Container(
        // acessarcontats5 (22:715)
        margin: EdgeInsets.fromLTRB(80, 30, 0, 0),
        child: Text(
          (queroEntrar) ? "Acessar conta" : "Cadastre-se",
          style: SafeGoogleFont(
            'Inter',
            fontSize: 30,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: 1,
            color: Color(0xffebf1f4),
          ),
        ),
      ),*/
      const SizedBox(height: 25),
      TextFormField(
        controller: _emailController,
        decoration: getAuthenticationInputDecoration('E-mail'),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "O e-mail não pode ser vazio";
          }
          if (value.length < 5) {
            return "O e-mail é muito curto";
          }

          // Expressão regular para validar e-mails
          final emailRegex = RegExp(
              r'^[\w-]+(\.[\w-]+)*@([a-z0-9-]+\.)+[a-z]{2,}$',
              caseSensitive: false,
              multiLine: false);

          if (!emailRegex.hasMatch(value)) {
            return "O e-mail não é válido";
          }

          return null;
        },
        style: SafeGoogleFont(
          'Inter',
          fontSize: 16.3860034943,
          fontWeight: FontWeight.w700,
          height: 1.2125,
          color: Color(0xffffffff),
        ),
        //validator: (value) => _validateEmail(value),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: _senhaController,
        decoration: getAuthenticationInputDecoration('Senha'),
        obscureText: true,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "A senha não pode ser vazia";
          }

          // Verificar se a senha contém pelo menos uma letra maiúscula
          if (!value.contains(RegExp(r'[A-Z]'))) {
            return "A senha deve conter pelo menos uma letra maiúscula";
          }

          // Verificar se a senha contém pelo menos uma letra minúscula
          if (!value.contains(RegExp(r'[a-z]'))) {
            return "A senha deve conter pelo menos uma letra minúscula";
          }

          // Verificar se a senha contém pelo menos um número
          if (!value.contains(RegExp(r'[0-9]'))) {
            return "A senha deve conter pelo menos um número";
          }

          return null;
        },
        style: SafeGoogleFont(
          'Inter',
          fontSize: 16.3860034943,
          fontWeight: FontWeight.w700,
          height: 1.2125,
          color: Color(0xffffffff),
        ),
        //obscureText: false,
        //validator: (value) => _validatePassword(value),
      ),
      const SizedBox(height: 8),
    ];

    if (!queroEntrar) {
      fields.addAll([
        TextFormField(
          decoration: getAuthenticationInputDecoration('Confirme Senha'),
          obscureText: true,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "A confirmação de senha não pode ser vazia";
            }
            if (value.length < 5) {
              return "A confirmação de senha é muito curta";
            }

            // Verificar se a senha e a confirmação de senha são iguais
            if (value != _senhaController.text) {
              return "A senha e a confirmação de senha não coincidem";
            }

            return null;
          },
          style: SafeGoogleFont(
            'Inter',
            fontSize: 16.3860034943,
            fontWeight: FontWeight.w700,
            height: 1.2125,
            color: Color(0xffffffff),
          ),
          //obscureText: true,
          //validator: (value) => _validateConfirmPassword(value),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nomeController,
          decoration: getAuthenticationInputDecoration('Nome'),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "O nome não pode ser vazio";
            }
            if (value.length < 5) {
              return "O nome é muito curto";
            }

            // Verificar se o nome contém pelo menos um espaço
            if (!value.contains(' ')) {
              return "Digite o nome completo, incluindo primeiro e último nome";
            }

            return null;
          },
          style: SafeGoogleFont(
            'Inter',
            fontSize: 16.3860034943,
            fontWeight: FontWeight.w700,
            height: 1.2125,
            color: Color(0xffffffff),
          ),
          //validator: (value) => _validateName(value),
        ),
      ]);
    }

    fields.addAll([
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: botaoPrincipalClicado,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff24d7ff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.all(16.0),
          minimumSize: Size(double.infinity, 12),
        ),
        child: Text(
          queroEntrar ? "Entrar" : "Cadastrar",
          textAlign: TextAlign.end,
          style: SafeGoogleFont(
            'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1,
            color: Color(0xffffffff),
          ),
        ),
      ),
      TextButton(
        onPressed: () => setState(() => queroEntrar = !queroEntrar),
        child: Text(
          (queroEntrar) ? "Cadastre-se" : "",
          style: SafeGoogleFont(
            'Inter',
            fontSize: 16.3860034943,
            fontWeight: FontWeight.w700,
            height: 1.2125,
            color: Color(0xffffffff),
          ),
        ),
      ),
      TextButton(
        onPressed: () => _esqueceuSenha(context),
        child: Text("Esqueceu a senha?",
            style: TextStyle(
              height: -2,
              color: Colors.white,
              fontSize: 14,
            )),
      ),
      Container(
        // group223Rq5 (14:479)
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        width: 100,
        height: 46,
        child: Image.asset(
          "assets/images/smctic.png",
          width: 100,
          height: 46,
        ),
      ),
      Container(
        // group220a35 (22:898)
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*Container(
              // falarcomaprefeituraub9 (22:901)
              margin: EdgeInsets.fromLTRB(0, 10, 2, 10),
              child: Text(
                'Falar com a Prefeitura',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 16.8682975769,
                  fontWeight: FontWeight.w700,
                  height: 1.2125,
                  color: Color(0xffffffff),
                ),
              ),
            ),*/
            Container(
              // group219owR (22:902)
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // frame148wnj (22:903)
                    margin: EdgeInsets.fromLTRB(25, 0, 6, 0),
                    width: 74.85,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      // group217fyd (22:904)
                      padding: EdgeInsets.fromLTRB(2, 20, 0, 0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff0f497d),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        // group210zW7 (22:906)
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // layer19P1 (22:907)
                              margin: EdgeInsets.fromLTRB(0, 0, 0.38, 2.08),
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/icons/whatsapp.png',
                                width: 26.19,
                                height: 26.29,
                              ),
                            ),
                            Text(
                              // whatsappFS3 (22:910)
                              'Whatsapp',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 8.4341487885,
                                fontWeight: FontWeight.w700,
                                height: 1.2125,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group211PHM (22:912)
                    margin: EdgeInsets.fromLTRB(0, 0, 5.2, 0),
                    padding: EdgeInsets.fromLTRB(22, 22, 23.41, 16.26),
                    width: 74.85,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff0f497d),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // layer1UJo (22:914)
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5.39),
                          width: 28.38,
                          height: 20.18,
                          child: Image.asset(
                            'assets/images/icons/email.png',
                            width: 28.38,
                            height: 20.18,
                          ),
                        ),
                        Container(
                          // emailBDD (22:916)
                          margin: EdgeInsets.fromLTRB(0, 0, 0.03, 0),
                          child: Text(
                            'E-mail',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 8.4341487885,
                              fontWeight: FontWeight.w700,
                              height: 1.2125,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // frame150gfm (22:917)
                    margin: EdgeInsets.fromLTRB(0, 0, 5.2, 0),
                    width: 74.85,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      //onPressed: () => _launchLink('tel:02137829090'),
                      // group215zwM (22:918)
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff0f497d),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // layer1HfZ (22:920)
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            width: 26,
                            height: 26,
                            child: Image.asset(
                              'assets/images/icons/telefone.png',
                              width: 26,
                              height: 26,
                            ),
                          ),
                          Text(
                            // telefoneBkw (22:926)
                            'Telefone',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 8.4341487885,
                              fontWeight: FontWeight.w700,
                              height: 1.2125,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // group214WoD (22:927)
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      // group213GXV (22:928)
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff0f497d),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        // frame151b3y (22:930)
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // layer1WRq (22:931)
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 3.2),
                              width: 25,
                              height: 26,
                              child: Image.asset(
                                'assets/images/icons/local.png',
                                width: 25,
                                height: 26,
                              ),
                            ),
                            Text(
                              // endereodFZ (22:934)
                              'Endereço',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 8.4341487885,
                                fontWeight: FontWeight.w700,
                                height: 1.2125,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);

    return fields;
  }

  void botaoPrincipalClicado() {
    if (queroEntrar) {
      logarUsuario();
    } else {
      cadastrarUsuario();
    }
  }

  void cadastrarUsuario() async {
    if (_formKey.currentState!.validate()) {
      final String nome = _nomeController.text;
      final String email = _emailController.text;
      final String senha = _senhaController.text;

      _autenServico
          .cadastrarUsuario(nome: nome, senha: senha, email: email)
          .then((String? erro) {
        if (erro != null) {
          mostrarSnackBar(context: context, texto: erro);
        } else {
          // Após um cadastro bem-sucedido, faça login automaticamente
          logarUsuario(isAutoLogin: true);
        }
      });
    }
  }

  void logarUsuario({bool isAutoLogin = false}) async {
    // Se for um login automático após cadastro, pula a validação do formulário
    if (isAutoLogin || _formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String senha = _senhaController.text;

      _autenServico
          .logarUsuarios(email: email, senha: senha)
          .then((String? erro) async {
        if (erro != null) {
          mostrarSnackBar(context: context, texto: erro);
        } else {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MapView(
                onLogout: () async {
                  // Adicione aqui a lógica para fazer logout
                },
                onUpdate: (user, userImage) {
                  // Adicione aqui a lógica para atualizar o usuário
                },
                userName: 'Nome do Usuário',
                userEmail: 'email@example.com',
                userImageUrl: 'URL da Imagem do Perfil',
                updateProfileImageCallback: (File? userImage) {},
                userImageURL: null,
              ),
            ),
          );
        }
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "O e-mail não pode ser vazio";
    }
    if (value.length < 5) {
      return "O e-mail é muito curto";
    }

    // Expressão regular para validar e-mails
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-z0-9-]+\.)+[a-z]{2,}$',
        caseSensitive: false, multiLine: false);

    if (!emailRegex.hasMatch(value)) {
      return "O e-mail não é válido";
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha não pode ser vazia";
    }

    // Verificar se a senha contém pelo menos uma letra maiúscula
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "A senha deve conter pelo menos uma letra maiúscula";
    }

    // Verificar se a senha contém pelo menos uma letra minúscula
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "A senha deve conter pelo menos uma letra minúscula";
    }

    // Verificar se a senha contém pelo menos um número
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "A senha deve conter pelo menos um número";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "A confirmação de senha não pode ser vazia";
    }
    if (value.length < 5) {
      return "A confirmação de senha é muito curta";
    }

    // Verificar se a senha e a confirmação de senha são iguais
    if (value != _senhaController.text) {
      return "A senha e a confirmação de senha não coincidem";
    }

    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome não pode ser vazio";
    }
    if (value.length < 5) {
      return "O nome é muito curto";
    }

    // Verificar se o nome contém pelo menos um espaço
    if (!value.contains(' ')) {
      return "Digite o nome completo, incluindo primeiro e último nome";
    }

    return null;
  }

  void _esqueceuSenha(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
    ).then((result) {
      // Adicione qualquer lógica desejada após a conclusão da redefinição de senha
      if (result == "reset_success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Um e-mail de redefinição de senha foi enviado.")),
        );
      }
    });
  }
}
