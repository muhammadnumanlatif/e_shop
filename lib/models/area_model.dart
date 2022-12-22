

class AreaModel {
  int? iAreaID;
  int? iSystemUserID;
  String? sName;
  String? sCode;
  String? dtCreatedDate;

  AreaModel( this.iAreaID, this.iSystemUserID, this.sName, this.sCode,this.dtCreatedDate);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "iAreaID":iAreaID??"",
      "iSystemUserID":iSystemUserID??"",
      "sName":sName??"",
      "sCode":sCode??"",
      "dtCreatedDate":dtCreatedDate??"",
    };
    return map;
  }

  AreaModel.fromMap(Map<String,dynamic> map){
    iAreaID=map["iAreaID"];
    iSystemUserID=map["iSystemUserID"];
    sName=map ["sName"];
    sCode= map["sCode"];
    dtCreatedDate= map["dtCreatedDate"];
  }
}