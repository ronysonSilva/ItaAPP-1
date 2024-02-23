import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/utils.dart';

class abrirChamado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 892,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 55, 104),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 30,
              top: 116,
              child: Container(
                width: 330,
                height: 96,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 96,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff009ddf)),
                        color: Color(0xff002d55),
                        borderRadius: BorderRadius.circular(12.9999990463),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 56,
                              height: 56,
                              child: Image.asset(
                                'assets/images/icons/camera01.png',
                                width: 56,
                                height: 56,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                'FOTO 1',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffdfe9ef),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 21,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 96,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff009ddf)),
                        color: Color(0xff002d55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 56,
                              height: 60,
                              child: Image.asset(
                                'assets/images/icons/camera02.png',
                                width: 56,
                                height: 0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                'FOTO 2',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffdfe9ef),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 21,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 96,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff009ddf)),
                        color: Color(0xff002d55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 56,
                              height: 56,
                              child: Image.asset(
                                'assets/images/icons/camera03.png',
                                width: 56,
                                height: 56,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                'FOTO 3',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffdfe9ef),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 241,
              child: Container(
                width: 350,
                height: 564,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Assunto',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: Color(0xffb1c0d6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                            width: double.infinity,
                            height: 103,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Descrição do problema',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: Color(0xffb1c0d6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Endereço ',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: Color(0xffb1c0d6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Cidade',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: Color(0xffb1c0d6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'CEP',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: Color(0xffb1c0d6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Telefone de contato',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: Color(0xffb1c0d6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 17, 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff00284c),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 200, 0),
                                  child: Text(
                                    'Secretaria',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                      color: Color(0xffb1c0d6),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  width: 14,
                                  height: 8,
                                  child: Image.asset(
                                    'assets/images/icons/expandir.png',
                                    width: 14,
                                    height: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: double.infinity,
                        height: 70,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff62c6ff)),
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                              begin: Alignment(-1.5, -7),
                              end: Alignment(0.2, 3),
                              colors: <Color>[
                                Color(0xff7de7ff),
                                Color(0xff24d7ff),
                                Color(0xff31a7e5)
                              ],
                              stops: <double>[0, 0, 1],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'ENVIAR CHAMADO',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 34,
              top: 46,
              child: Container(
                width: 331,
                height: 33,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 110, 0),
                      child: Text(
                        'Abrir chamado',
                        style: SafeGoogleFont(
                          'DM Sans',
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 33,
                        height: 33,
                        child: Image.asset(
                          'assets/images/icons/back_icon.png',
                          width: 33,
                          height: 33,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
