import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meu_app/utils.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordPage({super.key});

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      // Retorna "reset_success" para indicar sucesso
      Navigator.pop(context, "reset_success");
    } catch (e) {
      print('Error: $e');
      // Retorna nulo para indicar falha
      Navigator.pop(context, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x00ffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 0, 0, 0),
          size: 24,
        ),
      ),*/
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
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
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ///***If you have exported images you must have to copy those images in assets/images directory.
                      Image(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/animation/2023/06/13/15/12/15-12-30-710_512.gif"),
                        height: 100,
                        width: 140,
                        fit: BoxFit.contain,
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                        child: Text(
                          "Esqueceu sua senha?",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      Text(
                        "Basta inserir o endereço de e-mail que você usou para se registrar conosco e enviaremos um link de redefinição!",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: SafeGoogleFont(
                          'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: TextField(
                          controller: emailController,
                          obscureText: false,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                  color: Color(0xff028ddc), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                  color: Color(0xff028ddc), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: Color(0xff028ddc), width: 1),
                            ),
                            hintText: "Insira seu Email",
                            hintStyle: SafeGoogleFont(
                              'Inter',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xffb1c0d6),
                            ),
                            filled: true,
                            fillColor: Color(0xff00284c),
                            isDense: false,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            suffixIcon: Icon(Icons.mail,
                                color: Color(0xffb1c0d6), size: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //onPressed: () => _resetPassword(context),
            Container(
              alignment: Alignment(0.0,
                  0.65), // Altere a orientação conforme necessário (e.g., Alignment.topLeft, Alignment.bottomRight)
              child: ElevatedButton(
                onPressed: () => _resetPassword(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff24d7ff), // Cor de fundo
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Color(0xff62c6ff),
                        width: 1.3), // cor e expessura da borda do botão
                    // Borda raio
                  ),
                  padding: EdgeInsets.all(16.0), // Padding do botão
                  minimumSize: Size(150, 50),
                ),
                child: Text(
                  "Enviar",
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 16.3860034943,
                    fontWeight: FontWeight.w700,
                    height: 1.2125,
                    color: Color(0xffffffff),

                    // Cor do texto
                  ),
                ),
              ),
              /*Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 0, 0, 30), //posicionamento do botão
              child: Align(
                alignment: Alignment(0.0, 0.7), // alinhamento do botão
                child: MaterialButton(
                  color: Color.fromARGB(255, 255, 255, 255),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2), // cor e expessura da borda do botão
                  ),
                  padding: EdgeInsets.all(16),
                  onPressed: () => _resetPassword(context),
                  child: Text(
                    "Enviar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                  height: 50,
                  minWidth: 220, //altura e largura do botão enviar
                ),
              ),
            ),*/
            ),
          ],
        ),
      ),
    );
  }
}

 /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Redefinir senha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _resetPassword(context),
              child: Text('Redefinir senha'),
            ),
          ],
        ),
      ),
    );
  }*/