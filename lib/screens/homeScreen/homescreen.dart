import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:projet_master/services/storage_service.dart';
import 'package:projet_master/shared/buttoncomponent.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../services/pointage_service.dart';
import '../loginscreen/loginscreen.dart';
import '../payment/paymentscreen.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState(){
    setState(() {
      _tooltipBehavior = TooltipBehavior(enable: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          actions: settingsWidgets(context),
        ),
        drawer: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person,
                        size: 100,
                        color: Colors.blueGrey,),
                      RichText(
                        text: TextSpan(text: "${StorageService.getFirstName()}\n",
                            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                            children: [
                              TextSpan(text: "${StorageService.getLastName()}",
                                  style: TextStyle(color: Colors.blueGrey, fontSize: 20))
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text("Profil"),
                leading: Icon(Icons.person_off_outlined),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("Pointages"),
                leading: Icon(Icons.list_alt_outlined),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("Payment"),
                leading: Icon(Icons.payment_outlined),
                onTap: (){
                    Get.to(WalletScreen());
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 10)),
                child: QrImageView(
                  data: widget.email,
                  version: QrVersions.auto,
                  size: 200.0,
                  foregroundColor: Colors.blueGrey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width / 1.3,
                child: BasicButtonComponent(
                  text: "Scanner",
                  onPressed: () async {
                    // TODO S'il ne scan rien il retourne -1
                    String barcodeScanRes =
                    await FlutterBarcodeScanner.scanBarcode(
                        '#FFFFFF', 'Fermer', true, ScanMode.QR);
                    if(barcodeScanRes!="-1") {
                      PointageService pointageservice = PointageService();
                      bool resp = await pointageservice.pointage(barcodeScanRes);
                      print("la valeur de response $resp");
                      if(resp){
                        /*Get.dialog(Dialog.fullscreen(
                          child: Center(
                            child: Text(barcodeScanRes),
                          ),
                        ));*/
                        Fluttertoast.showToast(
                            msg: "Pointage fait avec succes",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.greenAccent,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else{
                        //message a afficher si ca passe pas
                        Fluttertoast.showToast(
                            msg: "Impossible de valider votre pointage",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Données Statistics'),
                    // Enable legend
                    //legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: _tooltipBehavior,

                    series: <LineSeries<Pointe, String>>[
                      LineSeries<Pointe, String>(
                          dataSource:  <Pointe>[
                            Pointe('Jan', 20),
                            Pointe('Feb', 18),
                            Pointe('Mars', 14),
                            Pointe('Avr', 12),
                            Pointe('Mai', 20),
                            Pointe('Juin', 20),
                            Pointe('Juil', 20),
                            Pointe('Aout', 18),
                            Pointe('Sept',17),
                            Pointe('Oct', 20),
                            Pointe('Nov', 20),
                            Pointe('Dec', 15)
                          ],
                          xValueMapper: (Pointe pointe, _) => pointe.mois,
                          yValueMapper: (Pointe pointe, _) => pointe.total,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)
                      )
                    ]
                ),
              )
            ],
          ),
        ));
  }
  List<Widget> settingsWidgets(BuildContext context)
  {
    final List<Widget> widgetPopupMenuButton = <Widget>[];
    final List<PopupMenuEntry<dynamic>> widgetPopupMenuItems = <PopupMenuEntry<dynamic>>[
      PopupMenuItem<int>(
          value: 0,
          child: Row(
            children: const [
              Icon(
                Icons.settings,
                color: Colors.blueGrey,
                size: 30,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Parametres",
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          )),
      PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: const [
              Icon(
                Icons.rule,
                color: Colors.blueGrey,
                size: 30,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Conditions d'utilisation",
                style: TextStyle(color: Colors.blueGrey),
              )
            ],
          )),
      PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
              const SizedBox(
                width: 7,
              ),
              const Text(
                "Déconnexion",
                style: TextStyle(color: Colors.red),
              )
            ],
          )),
    ];
    widgetPopupMenuButton.add(
        PopupMenuButton(
          icon: const Icon(Icons.more_vert, color: Colors.white,),
          //don't specify icon if you want 3 dot menu
          color: Colors.white,
          itemBuilder: (context) => widgetPopupMenuItems,
          onSelected: (item) => {selectedItem(context,item)},
        )
    );
    return widgetPopupMenuButton;
  }
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        debugPrint("Settings");
        break;
      case 1:
        debugPrint("Privacy Clicked");
        break;
      case 2:
      //logoutDialog(context);
        StorageService.logout();
        Get.offAll(SignInScreen());
        break;
    }
  }

}

class Pointe {
  Pointe(this.mois, this.total);
  final String mois;
  final double total;
}
