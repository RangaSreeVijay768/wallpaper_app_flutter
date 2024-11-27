// import 'package:basic/app/core/logger/log.dart';
// import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
// import 'package:basic/app/escale/models/transactions_by_customer_id_models.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:intl/intl.dart';
//
// import '../../../escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
//
//
//
// class BluetoothReceiptUtils{
//
//   static String generateBarcodeContent(int customerId) {
//     String customerIdStr = customerId.toString().padLeft(6, '0');
//
//     final now = DateTime.now();
//     String formattedDate = "${now.day.toString().padLeft(1, '0')}${now.month.toString().padLeft(1, '0')}${now.year.toString().substring(1)}";
//
//     // return "$customerIdStr$formattedDate";
//     return "       ";
//   }
//
//
//
//   static List<LineText> getPrintReceiptText(String customerName, List<GetTransactionsByCustomerIdResponse> transactions, String barcodeContent) {
//     double totalCost = 0;
//     List<LineText> list = [];
//
//     list.add(LineText(type: LineText.TYPE_TEXT, content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: customerName, align: LineText.ALIGN_LEFT, weight: 1, fontZoom: 1, linefeed: 1));
//
//     final date = AppDateTimeUtils.getCurrentDate();
//     final time = DateFormat('HH:mm').format(DateTime.now());
//
//     list.add(LineText(type: LineText.TYPE_TEXT, content: date, align: LineText.ALIGN_LEFT, fontZoom: 1, linefeed: 0));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: time, align: LineText.ALIGN_RIGHT, fontZoom: 1, linefeed: 0, y: 0, relativeX: 320,));
//     list.add(LineText(linefeed: 1));
//
//     list.add(LineText(type: LineText.TYPE_TEXT, content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: "Items", align: LineText.ALIGN_LEFT, fontZoom: 1, linefeed: 0));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: 'Bags    kg', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 0,  y: 0, relativeX: 120));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: 'Amount', align: LineText.ALIGN_RIGHT, fontZoom: 1, linefeed: 0,  y: 0, relativeX: 300));
//     list.add(LineText(linefeed: 1));
//
//     list.add(LineText(type: LineText.TYPE_TEXT, content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//
//
//     for (var trans in transactions) {
//       totalCost += trans.cost!;
//       String bags = trans.totalBags?.toString() ?? "";
//       String weight = trans.totalWeight?.toStringAsFixed(0) ?? "";
//       String cost = trans.cost?.toStringAsFixed(0) ?? "";
//
//       list.add(LineText(type: LineText.TYPE_TEXT, content: trans.items, align: LineText.ALIGN_LEFT, fontZoom: 1, linefeed: 0));
//       list.add(LineText(type: LineText.TYPE_TEXT, content: ' $bags    $weight  ', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 0,  y: 0, relativeX: 120));
//       list.add(LineText(type: LineText.TYPE_TEXT, content: cost, align: LineText.ALIGN_RIGHT, fontZoom: 1, linefeed: 0,  y: 0, relativeX: 300));
//       list.add(LineText(linefeed: 1));
//     }
//
//     list.add(LineText(type: LineText.TYPE_TEXT, content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: "TOTAL", align: LineText.ALIGN_LEFT, fontZoom: 1, linefeed: 0));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: "Rs ${totalCost.toStringAsFixed(0)}", align: LineText.ALIGN_RIGHT, weight: 1, fontZoom: 1, linefeed: 0, x: 0, y: 0, relativeX: 270));
//     list.add(LineText(linefeed: 1));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//
//     list.add(LineText(type: LineText.TYPE_BARCODE, content: barcodeContent, align: LineText.ALIGN_CENTER, width: 1, linefeed: 0));
//
//     list.add(LineText(type: LineText.TYPE_TEXT, content: "Powered By @Sabzisetu", align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//     list.add(LineText(type: LineText.TYPE_TEXT, content: '--------------------------------', align: LineText.ALIGN_CENTER, fontZoom: 1, linefeed: 1));
//
//     return list;
//   }
//
// }
