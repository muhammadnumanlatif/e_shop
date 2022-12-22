

class ProductGroupingModel {
  int? iProductGroupID;
  String? sGroupName;
  String? sCode;
  String? dtCreatedDate;

  ProductGroupingModel( this.iProductGroupID, this.sGroupName, this.sCode,this.dtCreatedDate);

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "iProductGroupID":iProductGroupID??"",
      "sGroupName":sGroupName??"",
      "sCode":sCode??"",
      "dtCreatedDate":dtCreatedDate??"",
    };
    return map;
  }

  ProductGroupingModel.fromMap(Map<String,dynamic> map){
    iProductGroupID=map["iProductGroupID"];
    sGroupName=map ["sGroupName"];
    sCode= map["sCode"];
    dtCreatedDate= map["dtCreatedDate"];
  }
}