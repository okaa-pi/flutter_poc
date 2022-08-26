import 'package:flutter/cupertino.dart';
import 'package:vidis/infrastructure/api/PrescriptionsApi.dart';
import 'package:vidis/infrastructure/exceptions/ApiException.dart';
import 'package:vidis/infrastructure/model/v1.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrescriptionScreenState();

}

class PrescriptionScreenState extends State<PrescriptionScreen> {

  late Future<Prescription> prescription;

  @override
  void initState() {
    super.initState();
    prescription = PrescriptionsApi().getPrescriptionFromRid('BEP04A4E4A2A2');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Prescription"),
        ),
        child: Center(
              child: FutureBuilder<Prescription>(builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Text('Prescription loaded : ${snapshot.data?.ridCode}');
                }
                else if (snapshot.hasError) {
                  return ListView(children: [Text((snapshot.error as ApiException).cause.code)],);
                }
                return const CupertinoActivityIndicator();
              },
              future: prescription)
        )
    );
  }

}