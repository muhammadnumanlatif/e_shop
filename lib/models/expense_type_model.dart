

class ExpenseTypeModel {
  int? iExpenseTypeID;
  int? iFirmID;
  String? sTypeName;
  String? sCode;
  String? dtCreatedDate;

  ExpenseTypeModel( this.iExpenseTypeID, this.iFirmID, this.sTypeName, this.sCode,this.dtCreatedDate);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "iExpenseTypeID":iExpenseTypeID??"",
      "iFirmID":iFirmID??"",
      "sTypeName":sTypeName??"",
      "sCode":sCode??"",
      "dtCreatedDate":dtCreatedDate??"",
    };
    return map;
  }

  ExpenseTypeModel.fromMap(Map<String,dynamic> map){
    iExpenseTypeID=map["iExpenseTypeID"];
    iFirmID=map["iFirmID"];
    sTypeName=map ["sTypeName"];
    sCode= map["sCode"];
    dtCreatedDate= map["dtCreatedDate"];
  }
}