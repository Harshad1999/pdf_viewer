import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_viewer/api_server.dart';

class PdfViewer extends StatefulWidget {
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  String _localFile;

  @override
  void initState() {
    // TODO: implement initState
    ApiService.loadPDF().then((value) {
      setState(() {
        _localFile = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF_Viewer'),
        centerTitle: true,
      ),
      body: _localFile != null
          ? Container(
              child: PDFView(filePath: _localFile),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
