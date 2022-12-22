

class ProductUnitModel {
  int? iItemUnitID;
  int? iFirmID;
  String? sUnitName;
  String? sUnitShortName;
  String? dtCreatedDate;

  ProductUnitModel( this.iItemUnitID, this.iFirmID, this.sUnitName, this.sUnitShortName,this.dtCreatedDate);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "iItemUnitID":iItemUnitID??"",
      "iFirmID":iFirmID??"",
      "sUnitName":sUnitName??"",
      "sUnitShortName":sUnitShortName??"",
      "dtCreatedDate":dtCreatedDate??"",
    };
    return map;
  }

  ProductUnitModel.fromMap(Map<String,dynamic> map){
    iItemUnitID=map["iItemUnitID"];
    iFirmID=map["iFirmID"];
    sUnitName=map ["sUnitName"];
    sUnitShortName= map["sUnitShortName"];
    dtCreatedDate= map["dtCreatedDate"];
  }
}