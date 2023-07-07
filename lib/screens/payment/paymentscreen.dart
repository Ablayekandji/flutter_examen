import 'package:flutter/material.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}
class _WalletScreenState extends State<WalletScreen> {

  List<dynamic> listTransactionResponse = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              _widgetTransactions()
            ],
          ),
        ),
      ),
    );
  }
  Widget _widgetSolde(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14)
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 22, bottom: 22, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }
  Widget _widgetTransactions(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Container(
        child: Column(
          children: [
            _headerTransaction(),
            _listTransactions()
          ],
        ),
      ),
    );
  }
  Widget _headerTransaction(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text(
            "Voir plus",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
  Widget _listTransactions(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listTransactionResponse.length,
              itemBuilder: (BuildContext context, int index) {
                return ;
              },
            ),
          )
        ],
      ),
    );
  }
}