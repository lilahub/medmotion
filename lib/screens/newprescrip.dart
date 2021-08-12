import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medmotion/components/checkbox_day.dart';
import 'package:medmotion/components/selected_time.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share_extend/share_extend.dart';
import 'package:path_provider/path_provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPrescription extends StatefulWidget {
  @override
  _NewPrescriptionState createState() => _NewPrescriptionState();
}

class _NewPrescriptionState extends State<NewPrescription> {
  String hospital;
  String medico;
  String crm;
  String paciente;
  String remedio;
  String dias;
  String manha;
  String noite;
  String path;
  var doc;
  List<String> hours = [];
  var days = [
    {"label": "Segunda", "isSelected": false},
    {"label": "Terça", "isSelected": false},
    {"label": "Quarta", "isSelected": false},
    {"label": "Quinta", "isSelected": false},
    {"label": "Sexta", "isSelected": false},
    {"label": "Sábado", "isSelected": false},
    {"label": "Domingo", "isSelected": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E53BD),
        title: Center(child: Text('Receita em PDF')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              //   Image.asset(
              //     'assets/hospital.svg',
              //   ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/hospital.svg",
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Nome do Hospital",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            hospital = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/doutor.svg",
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Médico(a)",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            medico = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "CRM",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            crm = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/pessoa.svg",
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Paciente",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            paciente = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/remedio.svg",
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Remédio",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            remedio = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  ...days.map(
                    (day) => CheckboxDay(
                      day: day,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                          hintText: "Período de uso desse medicamento",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {
                            dias = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SelectedTime(hours: hours),
              RaisedButton(
                onPressed: () async {
                  await _creatPdf(context, hospital, medico, crm, paciente,
                      remedio, days, hours);
                },
                child: Text('Criar PDF'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _creatPdf(
      context, hospital, medico, crm, paciente, remedio, dias, horas) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    var hosp = await rootBundle.loadString('assets/hospital.svg');
    var med = await rootBundle.loadString('assets/doutor.svg');
    var pac = await rootBundle.loadString('assets/pessoa.svg');
    var rem = await rootBundle.loadString('assets/remedio.svg');
    var calendar = await rootBundle.loadString('assets/calendario.svg');
    var sol = await rootBundle.loadString('assets/sol.svg');
    var lua = await rootBundle.loadString('assets/lua.svg');
    var days = dias
        .where((dia) => dia["isSelected"] as bool)
        .map((dia) => dia["label"]);
    pdf.addPage(
      pdfLib.MultiPage(
        build: (context) => [
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: hosp,
                height: 25,
                width: 25,
              ),
              pdfLib.SizedBox(width: 10),
              pdfLib.Text(hospital),
            ],
          ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: med,
                height: 25,
                width: 25,
              ),
              pdfLib.SizedBox(width: 10),
              pdfLib.Text(
                medico,
              ),
            ],
          ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Row(
            children: [
              pdfLib.Text(
                "CRM: $crm",
              ),
            ],
          ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: pac,
                height: 25,
                width: 25,
              ),
              pdfLib.SizedBox(width: 10),
              pdfLib.Text(
                paciente,
              ),
            ],
          ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: rem,
                height: 25,
                width: 25,
              ),
              pdfLib.SizedBox(width: 10),
              pdfLib.Text(
                remedio,
              ),
            ],
          ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Text(
            "Horários:",
          ),
          pdfLib.SizedBox(height: 10),
          ...horas.map(
            (hora) => pdfLib.Row(
              children: [
                pdfLib.Text(
                  "$hora",
                ),
              ],
            ),
          ),
          pdfLib.SizedBox(height: 10),
          pdfLib.Row(
            children: [
              pdfLib.Text(
                "Dias: ${days.reduce((d1, d2) => "$d1,$d2")}",
              ),
            ],
          ),
        ],
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;

    path = '$dir/pdfExample.pdf';
    final File file = File(path);
    var pdfFile = await pdf.save();
    await file.writeAsBytes(pdfFile);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ViewPdf(
              file: file,
              path: path,
            )));
  }
}

class ViewPdf extends StatefulWidget {
  File file;
  String path;
  ViewPdf({this.file, this.path});

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument _doc;
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PDFDocument.fromFile(widget.file).then((doc) {
      setState(() {
        _doc = doc;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1E53BD),
          title: Text('Receita em PDF'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    ShareExtend.share(widget.path, "file",
                        sharePanelTitle: "Enviar PDF", subject: "example-pdf");
                  }),
            )
          ],
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(document: _doc));
  }
}
