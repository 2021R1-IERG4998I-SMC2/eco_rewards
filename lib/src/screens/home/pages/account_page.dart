import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:eco_rewards/widget/elevated_button.dart';
import 'package:eco_rewards/src/services.dart';
import 'package:eco_rewards/src/models/shared/user_wallet_model.dart';


class AccountPage extends StatefulWidget {
   const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage>{

  late TextEditingController walletController;
  late final prefs;
  late String wallet;

  @override
  void initState(){
    super.initState();
    asyncPref();
    walletController = TextEditingController();
  }

  void asyncPref() async{
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose(){
    walletController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          child:Center(
            child: Column(
              children: <Widget>[
                Expanded(child: Container(
                  child: TextField(
                    controller: walletController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "請輸入你的ETH區塊鏈錢包地址",
                        labelStyle: TextStyle(fontSize: 20.0)
                    ),
                  ),
                )),
                ElevatedRaisedButton(
                  onPressed: () async{
                    if(walletController.text.isNotEmpty){
                      await prefs.setString('wallet', walletController.text);
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text that the user has entered by using the
                            // TextEditingController.
                            content: Text('輸入銀包成功!'),
                          );
                        },
                      );
                      await services.get<UserWalletModel>().refreshBalance();
                      walletController.clear();
                    }
                  },
                    title: '完成'
                )
              ],
            ) 
          )
      )
  ); 
}
