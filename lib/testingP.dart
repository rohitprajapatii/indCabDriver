import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:indcabdriver/test/resume.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class testing extends StatelessWidget {

  final pdf = pw.Document();

  writeOnPdf(){
    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(32),

          build: (pw.Context context){
            return <pw.Widget>  [
              pw.Header(
                  level: 0,
                  child: pw.Text("INDCAB TRANSPORT PT LTD")
              ),

              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 15),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[
                        pw.Text("12-4-2021"),
                        pw.Text("02:25 PM"),
                      ]
                  )
              ),
              pw.SizedBox(height: 8,),
              one111('Total Amount',16),
              pw.SizedBox(height: 8,),

              one111("156",46),
              pw.SizedBox(height: 8,),
              one111('Total distance : 10.25 KM',16),
              pw.SizedBox(height: 8,),
              one111('Total Ride Time: 35 mins',16),
              pw.SizedBox(height: 15,),
              pw.Container(
                  height: 30,
                  child: pw.Center(child: pw.Text("Bill Breakup",style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold,))
                  )),
              one11("Rate for KM","12"),
              pw.SizedBox(height: 8,),
              one11("Discount","12"),
              pw.SizedBox(height: 8,),
              one11("Toll Charge","0.00"),
              pw.Divider(thickness: 2,),
              pw.SizedBox(height: 8,),
              one11("Payed Amount","145"),


            ];
          },


        )
    );
  }

  one111(String s,double size) {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal:6.0),
        child: pw.Text(s,style: pw.TextStyle(fontSize: size, fontWeight: pw.FontWeight.bold,))
    );
  }

  Future savePdf() async{

    // final outPut = await getExternalStorageDirectory();
    //
    // String path = outPut.path + '/example.pdf';
    // final file = File(path);
    // file.writeAsBytesSync(doc.save());

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");
    print("eeeeeeeeeeeeeeeeeeeee");

    await file.writeAsBytes(await pdf.save());

    // printPdf();

  }


  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("PDF Flutter"),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("PDF TUTORIAL", style: TextStyle(fontSize: 34),)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          writeOnPdf();
          await savePdf();

          Directory documentDirectory = await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";
          print("eeeeeeeeeeeeeeeeeeeee");
          print(fullPath);

          share();


          // Navigator.push(context, MaterialPageRoute(
          //     builder: (context) => PdfPreviewScreen(path: fullPath,)
          // ));

        },
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }


  Future<void> share() async {
    await FlutterShare.share(
        title: 'INDCAB Bill',
      linkUrl: 'https://www.indcabsonline.com/',

    );
  }

  one11(String s, String s1) {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal:6.0),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(s,style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold,)),
            pw.Text(s1,style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold,)),
          ],
        )
    );
  }
}