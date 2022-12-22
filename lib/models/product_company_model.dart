

class ProductCompanyModel {
  int? iProductCompanyID;
  int? iSystemUserID;
  String? sCompanyName;
  String? sCode;
  String? dtCreatedDate;

  ProductCompanyModel( this.iProductCompanyID, this.iSystemUserID, this.sCompanyName, this.sCode,this.dtCreatedDate);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "iProductCompanyID":iProductCompanyID??"",
      "iSystemUserID":iSystemUserID??"",
    "sCompanyName":sCompanyName??"",
      "sCode":sCode??"",
      "dtCreatedDate":dtCreatedDate??"",
    };
    return map;
  }

  ProductCompanyModel.fromMap(Map<String,dynamic> map){
    iProductCompanyID=map["iProductCompanyID"];
    iSystemUserID=map["iSystemUserID"];
    sCompanyName=map ["sCompanyName"];
    sCode= map["sCode"];
    dtCreatedDate= map["dtCreatedDate"];
  }
}