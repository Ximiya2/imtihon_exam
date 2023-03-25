import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:imtihon_exam/models/cards_model.dart';
import 'package:imtihon_exam/models/image_model.dart';
import 'package:imtihon_exam/view/widget/all_item.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../core/storage.dart';
import '../service/card_service.dart';
import '../service/utils_service.dart';
import 'add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  initState() {
    //getConnetivity();
    super.initState();
   // subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
   // });
    boxFunc();
    //_loadMoreData();
   // box!.clear();
  }

  // getConnetivity() =>
  //     subscription = Connectivity().onConnectivityChanged.listen(
  //           (ConnectivityResult result) async {
  //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //         if (!isDeviceConnected && isAlertSet == false) {
  //           showDialogBox();
  //           setState(() {
  //             isAlertSet = true;
  //           });
  //         }
  //       },
  //     );
  // Be sure to cancel subscription after you are done
  @override
  dispose() {
    // subscription.cancel();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: box!.values.length ?? 0,
            itemBuilder: (context, index){
              return AllItem(
                  context,
                  box!.getAt(index)!,
                  delete: (){
                    _deleteUser(index);
                    },);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _deleteUser(int id) async {
    bool result = await CardService.deleteCard(id.toString());

    if(result){
      box!.deleteAt(id);
      setState(() {});
      Utils.snackBarSucces('Update successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }
  // showDialogBox() => showCupertinoDialog<String>(
  //   context: context,
  //   builder: (context) =>  CupertinoAlertDialog(
  //     title: Text('No Connection'),
  //     content: Text('Please check your internet cennectivity'),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () async {
  //           Navigator.pop(context, 'Cancel');
  //           setState(() => isAlertSet = false);
  //           isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //           if (!isDeviceConnected){
  //             showDialogBox();
  //             setState(() {
  //               isAlertSet = true;
  //             });
  //           }
  //         },
  //         child: Text('OK'),
  //       )
  //     ],
  //   ),
  // );
// Future<void> _loadMoreData() async {
//   var res = await  CardService.getCards();
//   res.fold((l) {
//     EasyLoading.showError(l);
//   }, (r) {
//     setState(() {
//       if(!boxFunc(r)){
//         box!.addAll(r);
//       }
//
//     });
//     return box!;
//   }
//   );
// }

Future<void> boxFunc() async {
    var cards;
  var res = await  CardService.getCards();
  res.fold((l) {
    EasyLoading.showError(l);
  }, (r) {
    setState(() {
     cards = r;
    });
    return box!;
  }
  );
    for(int i = 0; i < box!.values.length; i++){
      for(int j = 0; j < cards.length; j++){
        if(cards[j].number != box!.getAt(i)?.number){
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (isDeviceConnected) {
            _createUser(cards(j));
            box!.add(cards(j));
          } else {
            box!.add(cards(j));
          }
        }
      }
    }
}
  void _createUser(CardsModel newUser) async {
    bool result =
    await CardService.createUser(newUser);

    if(result){
      setState(() {});
      Utils.snackBarSucces('Create successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }
}





