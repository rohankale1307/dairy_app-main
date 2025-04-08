class MilkData {
  String type;
  int amount;
  int liter;

  MilkData({required this.amount, required this.liter, required this.type});
}

class CattleFeedData {
  String feedName;
  int quantity;
  int amount;

  CattleFeedData({
    required this.feedName,
    required this.quantity,
    required this.amount,
  });
}

class DairyExpensesModel {
  String date;
  int total;
  List<DairyExpensesData> dairyExpenseData;

  DairyExpensesModel({
    required this.date,
    required this.total,
    required this.dairyExpenseData,
  });
}

class DairyExpensesData {
  String type;
  String amount;

  DairyExpensesData({
    required this.amount,
    required this.type,
  });
}

class CollectionCardData {
  int id;
  String name;
  double? fat;
  double? snf;
  double? qty;
  double? rate;
  double? liter;
  double? amount;
  String? dateTime;
  String? milkType;
  String? cattleFeedName;

  CollectionCardData({
    required this.id,
    required this.name,
    this.fat,
    this.snf,
    this.qty,
    this.rate,
    this.liter,
    this.amount,
    this.dateTime,
    this.milkType,
    this.cattleFeedName,
  });
}

class AdvanceAndDeductionReport {
  String id;
  String name;
  int totalAdvAmt;
  int totalDedAmt;

  AdvanceAndDeductionReport({
    required this.id,
    required this.name,
    required this.totalAdvAmt,
    required this.totalDedAmt,
  });
}

class AdvanceDeductionData {
  String date;
  int deduction;
  int newAdvance;

  AdvanceDeductionData({
    required this.date,
    required this.deduction,
    required this.newAdvance,
  });
}

class MilkReportModel {
  String date;
  String shift;
  String milk;
  String liter;
  String fat;
  String snf;
  String rate;
  String amount;

  MilkReportModel({
    required this.date,
    required this.shift,
    required this.milk,
    required this.liter,
    required this.fat,
    required this.snf,
    required this.rate,
    required this.amount,
  });
}

class MilkReport {
  String id;
  String name;
  List<MilkReportModel> milkReport;

  MilkReport({
    required this.id,
    required this.name,
    required this.milkReport,
  });
}

class CattleFeedReportItem {
  String id;
  String name;
  List<CattleFeedReportModel> cattleFeedReport;

  CattleFeedReportItem({
    required this.id,
    required this.name,
    required this.cattleFeedReport,
  });
}

class AdvAmtReportItem {
  String id;
  String name;
  List<AdvAmtReportModel> advAmtReportModel;

  AdvAmtReportItem({
    required this.id,
    required this.name,
    required this.advAmtReportModel,
  });
}

class AdvAmtReportModel {
  String date;
  String advAmt;
  String deductionAmt;

  AdvAmtReportModel({
    required this.date,
    required this.advAmt,
    required this.deductionAmt,
  });
}

class CattleFeedReportModel {
  String date;
  String feed;
  String qty;
  String rate;
  String amount;

  CattleFeedReportModel({
    required this.date,
    required this.feed,
    required this.qty,
    required this.rate,
    required this.amount,
  });
}

class NetPaymentReportItem {
  String id;
  String name;
  List<CattleFeedReportItem>? cattleFeedReport;
  List<MilkReport>? milkReport;
  List<AdvAmtReportItem>? advDedAmtReport;

  NetPaymentReportItem({
    required this.id,
    required this.name,
    this.advDedAmtReport,
    this.cattleFeedReport,
    this.milkReport,
  });
}

class NetPaymentReportModel {
  String id;
  String name;
  String totalMilkAmt;
  String totalCattleFeedAmt;
  String totalDeductionAmt;
  String totalNetPayment;

  NetPaymentReportModel({
    required this.id,
    required this.name,
    required this.totalCattleFeedAmt,
    required this.totalDeductionAmt,
    required this.totalMilkAmt,
    required this.totalNetPayment,
  });
}
