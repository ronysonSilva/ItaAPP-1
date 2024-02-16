import 'package:flutter/material.dart';
import 'package:meu_app/utils.dart';

class CustomBottomSheet extends StatelessWidget {
  final Function() onToggleMarkers;
  final Function() onTogglePolylines;

  CustomBottomSheet({
    required this.onToggleMarkers,
    required this.onTogglePolylines,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1, 1.031),
              end: Alignment(1, -1),
              colors: <Color>[
                Color(0xff003768),
                Color(0xa4003768),
                Color(0x00003768),
              ],
              stops: <double>[0, 0.461, 1],
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: onToggleMarkers,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            // group19VCX (14:410)
                            width: 200,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group173E3 (14:384)
                                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  width: 40,
                                  height: 27,
                                  child: Image.asset(
                                    'assets/images/icons/bus_alert.png',
                                    width: 30,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  // coletadelixoMib (14:373)
                                  'Ônibus Grátis',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                    color: Color(0xff003768),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: onTogglePolylines,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            // group19VCX (14:410)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group173E3 (14:384)
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  width: 30,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/icons/trash.png',
                                    width: 10,
                                    height: 10,
                                  ),
                                ),
                                Text(
                                  // nibusgrtisx67 (14:374)
                                  'Coleta de lixo',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold,
                                    height: 3,
                                    color: Color(0xff003768),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Add more buttons here
                  ],
                ),
                // Add more content here
              ],
            ),
          ),
        );
      },
    );
  }
}
