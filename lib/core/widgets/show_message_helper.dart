
import 'package:fluttertoast/fluttertoast.dart';

 Future<bool?> showMessageHelper({required String msg}){
  return Fluttertoast.showToast(msg: msg);
}