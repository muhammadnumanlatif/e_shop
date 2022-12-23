

import 'dart:core';

class ProductModel {
  int? iProductID;
  int? iFirmID;
  int? iSystemUserID;
  int? isProductCompanyID;
  int? isProductGroupID;
  int? isTaxcodeID;
  int? isExtraChargesID;
  String? sProductName;
  String? sProductLocation;
  String? sCode;
  String? sBarCode;
  String? iBaseUnit;
  String? iSecondaryUnit;
  String? sPeacePerSize;
  String? sTotalPeace;
  String? sTotalUnitSize;
  String? sWhatSecUnitIs;
  double? dcPurcasePerBaseUnitPrice;
  double? dcPurchasePerSecondaryUnitPrice;
  double? dcSalePerBaseUnitPrice;
  double? dSalePerSecondaryUnitPrice;
  String? sProduct_image;
  String? sImage_Thumbnail;
  String? sOpeningStockBaseUnit;
  String? sOpeningStockSecondaryUnit;
  String? sOpeningStockPurchase_At;
  String? sTotalBaseUnitStockQty;
  String? sTotalSecondaryUnitStockQty;
  String? sTotalBaseUnitPurchaseValue;
  String? sTotalSecondaryUnitPurchaseValue;
  String? sProducttype;
  String? sBaseUnitProfitRatio;
  String? sSecoundaryUnitProfitRatio;
  String? sTotalBaseUnitAvgPP;
  String? sTotalSecUnitAvgPP;
  String? sBonusRecivedStockInBaseUnit;
  String? sBonusRecivedStockInSecondaryUnit;
  String? sTotalBonusGivenStockOutInBaseUnit;
  String? sTotalBonusGivenStockOutInSecUnit;
  String? sTotalStockWithBonusInBaseUnitQty;
  String? sTotalStockWithBonusInSecUnitQty;
  bool? bOnlineSale;
  String? sSyncStatus;
  String? sEntrySource;
  bool? bStatus;
  String? sAction;
  int? iDeletedBy;
  String? dtDeletedDate;
  int? iUpdatedBy;
  String? dtUpdatedDate;
  int? iAddedBy;
  String? dtCreatedDate;

  ProductModel({
    this.iFirmID,
    this.iProductID,
    this.dtCreatedDate,
    this.sCode,
    this.iSystemUserID,
    this.bOnlineSale=false,
    this.bStatus=false,
    this.dcPurcasePerBaseUnitPrice,
    this.dcPurchasePerSecondaryUnitPrice,
    this.dcSalePerBaseUnitPrice,
    this.dSalePerSecondaryUnitPrice,
    this.dtDeletedDate,
    this.dtUpdatedDate,
    this.iAddedBy,
    this.iBaseUnit,
    this.iDeletedBy,
    this.iSecondaryUnit,
    this.isExtraChargesID,
    this.isProductCompanyID,
    this.isProductGroupID,
    this.isTaxcodeID,
    this.iUpdatedBy,
    this.sAction,
    this.sBarCode,
    this.sBaseUnitProfitRatio,
    this.sBonusRecivedStockInBaseUnit,
    this.sBonusRecivedStockInSecondaryUnit,
    this.sEntrySource,
    this.sImage_Thumbnail,
    this.sOpeningStockBaseUnit,
    this.sOpeningStockPurchase_At,
    this.sOpeningStockSecondaryUnit,
    this.sPeacePerSize,
    this.sProduct_image,
    this.sProductLocation,
    this.sProductName,
    this.sProducttype,
    this.sSecoundaryUnitProfitRatio,
    this.sSyncStatus,
    this.sTotalBaseUnitAvgPP,
    this.sTotalBaseUnitPurchaseValue,
    this.sTotalBaseUnitStockQty,
    this.sTotalBonusGivenStockOutInBaseUnit,
    this.sTotalBonusGivenStockOutInSecUnit,
    this.sTotalPeace,
    this.sTotalSecondaryUnitPurchaseValue,
    this.sTotalSecondaryUnitStockQty,
    this.sTotalSecUnitAvgPP,
    this.sTotalStockWithBonusInBaseUnitQty,
    this.sTotalStockWithBonusInSecUnitQty,
    this.sTotalUnitSize,
    this.sWhatSecUnitIs,
});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      "iProductID":iProductID,
      "iFirmID" :iFirmID,
      "iSystemUserID" :iSystemUserID,
      "isProductCompanyID" :isProductCompanyID,
      "isProductGroupID": isProductGroupID,
      "isTaxcodeID": isTaxcodeID,
      "isExtraChargesID" :isExtraChargesID,
      "sProductName" :sProductName,
      "sProductLocation" :sProductLocation,
      "sCode" :sCode,
      "sBarCode" :sBarCode,
      "iBaseUnit" :iBaseUnit,
        "iSecondaryUnit":iSecondaryUnit,
      "sPeacePerSize":sPeacePerSize,
      "sTotalPeace" :sTotalPeace,
      "sTotalUnitSize":sTotalUnitSize,
      "sWhatSecUnitIs" :sWhatSecUnitIs,
      "dcPurcasePerBaseUnitPrice": dcPurcasePerBaseUnitPrice,
      "dcPurchasePerSecondaryUnitPrice" :dcPurchasePerSecondaryUnitPrice,
      "dcSalePerBaseUnitPrice" :dcSalePerBaseUnitPrice,
      "dSalePerSecondaryUnitPrice" :dSalePerSecondaryUnitPrice,
      "sProduct_image" :sProduct_image,
      "sImage_Thumbnail":sImage_Thumbnail,
    "sOpeningStockBaseUnit":sOpeningStockBaseUnit,
    "sOpeningStockSecondaryUnit":sOpeningStockSecondaryUnit,
    "sOpeningStockPurchase_At":sOpeningStockPurchase_At,
    "sTotalBaseUnitStockQty":sTotalBaseUnitStockQty,
    "sTotalSecondaryUnitStockQty":sTotalSecondaryUnitStockQty,
    "sTotalBaseUnitPurchaseValue":sTotalBaseUnitPurchaseValue,
    "sTotalSecondaryUnitPurchaseValue":sTotalSecondaryUnitPurchaseValue,
    "sProducttype":sProducttype,
    "sBaseUnitProfitRatio" :sBaseUnitProfitRatio,
    "sSecoundaryUnitProfitRatio":sSecoundaryUnitProfitRatio,
        "sTotalBaseUnitAvgPP":sTotalBaseUnitAvgPP,
    "sTotalSecUnitAvgPP":sTotalSecUnitAvgPP,
    "sBonusRecivedStockInBaseUnit":sBonusRecivedStockInBaseUnit,
    "sBonusRecivedStockInSecondaryUnit":sBonusRecivedStockInSecondaryUnit,
    "sTotalBonusGivenStockOutInBaseUnit":sTotalBonusGivenStockOutInBaseUnit,
    "sTotalBonusGivenStockOutInSecUnit":sTotalBonusGivenStockOutInSecUnit,
    "sTotalStockWithBonusInBaseUnitQty":sTotalStockWithBonusInBaseUnitQty,
    "sTotalStockWithBonusInSecUnitQty":sTotalStockWithBonusInSecUnitQty,
    "bOnlineSale":bOnlineSale,
    "sSyncStatus" :sSyncStatus,
    "sEntrySource":sEntrySource,
    "bStatus":bStatus,
    "sAction": sAction,
    "iDeletedBy":iDeletedBy,
    "dtDeletedDate":dtDeletedDate,
    "iUpdatedBy":iUpdatedBy,
    "dtUpdatedDate" :dtUpdatedDate,
    "iAddedBy" :iAddedBy,
    "dtCreatedDate":dtCreatedDate,
    };
    return map;
  }

//   ProductModel.fromMap(Map<String,dynamic> map){
//     iProductID=map["iAreaID"];
//     iFirmID=map["iSystemUserID"];
//     sName=map ["sName"];
//     sCode= map["sCode"];
//     dtCreatedDate= map["dtCreatedDate"];
//   }
}