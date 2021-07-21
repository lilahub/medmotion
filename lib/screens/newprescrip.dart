import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share_extend/share_extend.dart';
import 'package:path_provider/path_provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

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
  String tarde;
  String noite;

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
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nome do Hospital'),
                onChanged: (val) {
                  setState(() {
                    hospital = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Médico(a)'),
                onChanged: (val) {
                  setState(() {
                    medico = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CRM'),
                onChanged: (val) {
                  setState(() {
                    crm = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Paciente'),
                onChanged: (val) {
                  setState(() {
                    paciente = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Remédio'),
                onChanged: (val) {
                  setState(() {
                    remedio = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Dias'),
                onChanged: (val) {
                  setState(() {
                    dias = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Manhã'),
                onChanged: (val) {
                  setState(() {
                    manha = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tarde'),
                onChanged: (val) {
                  setState(() {
                    tarde = val;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Noite'),
                onChanged: (val) {
                  setState(() {
                    noite = val;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  _creatPdf(context, hospital, medico, crm, paciente, remedio,
                      dias, manha, tarde, noite);
                },
                child: Text('Criar PDF'),
              )
            ],
          ),
        )));
  }

  _creatPdf(context, hospital, medico, crm, paciente, remedio, dias, manha,
      tarde, noite) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    var hosp = await rootBundle.loadString('assets/hospital.svg');
    pdf.addPage(
      pdfLib.MultiPage(
        build: (context) => [
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: hosp,
                height: 20,
                width: 20,
              ),
              pdfLib.Text(hospital),
            ],
          ),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: hosp,
                height: 20,
                width: 20,
              ),
              pdfLib.Text(
                medico,
              ),
            ],
          ),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: hosp,
                height: 20,
                width: 20,
              ),
              pdfLib.Text(
                paciente,
              ),
            ],
          ),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: hosp,
                height: 20,
                width: 20,
              ),
              pdfLib.Text(
                remedio,
              ),
            ],
          ),
          pdfLib.Row(
            children: [
              pdfLib.SvgImage(
                svg: hosp,
                height: 20,
                width: 20,
              ),
              pdfLib.Text(
                dias,
              ),
            ],
          ),
        ],
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = '$dir/pdfExample.pdf';
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save());

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ViewPdf(
              path,
            )));
  }
}

class ViewPdf extends StatefulWidget {
  ViewPdf(this.path);

  final String path;

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.path);
    setState(() {
      _doc = doc;
      _loading = false;
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
