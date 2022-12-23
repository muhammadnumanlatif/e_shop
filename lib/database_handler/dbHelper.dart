import 'package:e_shop/models/product_company_model.dart';
import 'package:e_shop/models/product_grouping_model.dart';
import 'package:e_shop/models/product_unit_model.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite3/sqlite3.dart' as sql;
import 'dart:io';

import '../models/area_model.dart';
import '../models/expense_type_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

class DbHelper {

  static Database? _db;

  static const String DB_Name = "sqlite32.db";
  static const String Table_User = "auth_logins";
  static const String Table_Area = "area";
  static const String Table_Product_Company = "product_company";
  static const String Table_Product_Grouping = "product_grouping";
  static const String Table_Product_Unit = "product_unit";
  static const String Table_Expense_Type = "expense_type";
  static const String Table_Product = "product";
  static const int Version = 1;

  static const String C_UserID = "user_id";
  static const String C_IpAddress = "ip_address";
  static const String C_Email = "email";
  static const String C_date = "date";
  static const String C_Password = "password";

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path,version: Version, onCreate: _onCreate);
    return db;
  }


  _onCreate(Database db, int intVersion) async{
    Batch batch = db.batch();

   batch.execute(
        "CREATE TABLE $Table_User ("
        "user_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "ip_address TEXT NOT NULL,"
        "email TEXT NOT NULL,"
        "date TEXT NOT NULL,"
        "password TEXT NOT NULL)");

    batch.execute(
        "CREATE TABLE $Table_Area ("
        "iAutoID	INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "iAreaID	INTEGER NOT NULL,"
        "iFirmID	INTEGER,"
        "iSystemUserID	INTEGER NOT NULL,"
            "sName	TEXT NOT NULL,"
        "sCode	TEXT NOT NULL,"
        "sSyncStatus	TEXT,"
        "sEntrySource	TEXT,"
        "bStatus	TEXT,"
        "sAction	TEXT,"
        "iDeletedBy	INTEGER,"
        "dtDeletedDate	datetime,"
        "iUpdatedBy	INTEGER,"
        "dtUpdatedDate	datetime,"
        "iAddedBy INTEGER,"
        "dtCreatedDate	TEXT)");
    batch.execute(
       " CREATE TABLE $Table_Product_Company ("
    "iAutoID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "iProductCompanyID	INTEGER NOT NULL,"
        "iSystemUserID INTEGER NOT NULL,"
        "iFirmID INTEGER DEFAULT NULL,"
        "sCompanyName	TEXT NOT NULL,"
        "sCode TEXT DEFAULT NULL,"
        "sAddress TEXT DEFAULT NULL,"
        "sPhone TEXT DEFAULT NULL,"
        "sMobile TEXT DEFAULT NULL,"
        "sSyncStatus	TEXT DEFAULT NULL,"
        "sEntrySource	TEXT DEFAULT NULL,"
        "sDescription	TEXT DEFAULT NULL,"
        "bStatus	TEXT DEFAULT NULL,"
        "sAction	TEXT DEFAULT NULL,"
        "iDeletedBy	INTEGER DEFAULT NULL,"
        "dtDeletedDate	datetime DEFAULT NULL,"
        "iUpdatedBy	INTEGER DEFAULT NULL,"
        "dtUpdatedDate	datetime DEFAULT NULL,"
        "iAddedBy	INTEGER DEFAULT NULL,"
        "dtCreatedDate	datetime DEFAULT NULL"
    ")");

   batch.execute(
        "CREATE TABLE $Table_Product_Grouping ("
    "iAutoID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "iProductGroupID	INTEGER NOT NULL,"
        "sGroupName TEXT NOT NULL,"
        "sCode	TEXT DEFAULT NULL,"
        "sActive TEXT DEFAULT NULL,"
        "sSyncStatus	TEXT DEFAULT NULL,"
        "sEntrySource	TEXT DEFAULT NULL,"
        "bStatus TEXT DEFAULT NULL,"
        "sAction TEXT DEFAULT NULL,"
        "iDeletedBy INTEGER DEFAULT NULL,"
        "dtDeletedDate datetime DEFAULT NULL,"
        "iUpdatedBy INTEGER DEFAULT NULL,"
        "dtUpdatedDate datetime DEFAULT NULL,"
        "iAddedBy INTEGER DEFAULT NULL,"
        "dtCreatedDate datetime DEFAULT NULL)"
    );

   batch.execute(
        "CREATE TABLE $Table_Product_Unit ("
    "iAutoID INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "iItemUnitID INTEGER NOT NULL,"
        "iFirmID INTEGER DEFAULT NULL,"
        "sUnitName TEXT NOT NULL,"
        "sUnitShortName	TEXT DEFAULT NULL,"
        "sActive TEXT DEFAULT NULL,"
        "sSyncStatus	TEXT DEFAULT NULL,"
        "sEntrySource TEXT DEFAULT NULL,"
        "bStatus TEXT DEFAULT NULL,"
        "sAction TEXT DEFAULT NULL,"
        "iDeletedBy INTEGER DEFAULT NULL,"
        "dtDeletedDate datetime DEFAULT NULL,"
        "iUpdatedBy INTEGER DEFAULT NULL,"
        "dtUpdatedDate	datetime DEFAULT NULL,"
        "iAddedBy	INTEGER DEFAULT NULL,"
        "dtCreatedDate	datetime DEFAULT NULL)"
    );

    batch.execute(
       "CREATE TABLE $Table_Expense_Type ("
   "iAutoID	INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
       "iExpenseTypeID	INTEGER NOT NULL,"
       "iFirmID	INTEGER DEFAULT NULL,"
       "sTypeName TEXT NOT NULL,"
       "sCode	TEXT DEFAULT NULL,"
       "sSyncStatus	TEXT DEFAULT NULL,"
       "sEntrySource	TEXT DEFAULT NULL,"
       "bStatus TEXT DEFAULT NULL,"
       "sAction	TEXT DEFAULT NULL,"
       "iDeletedBy	INTEGER DEFAULT NULL,"
       "dtDeletedDate	datetime DEFAULT NULL,"
       "iUpdatedBy	INTEGER DEFAULT NULL,"
       "dtUpdatedDate	datetime DEFAULT NULL,"
       "iAddedBy	INTEGER DEFAULT NULL,"
       "dtCreatedDate	datetime DEFAULT NULL)"
   );

   await db.execute(
       "CREATE TABLE  $Table_Product("
   "iAutoID	INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,"
       "iProductID	INTEGER NOT NULL,"
       "iSystemUserID	INTEGER DEFAULT NULL,"
       "iFirmID	INTEGER DEFAULT NULL,"
       "isProductCompanyID	INTEGER DEFAULT NULL,"
       "isProductGroupID	INTEGER DEFAULT NULL,"
       "isTaxcodeID	INTEGER DEFAULT NULL,"
       "isExtraChargesID	INTEGER DEFAULT NULL,"
       "sProductName	TEXT NOT NULL,"
       "sProductLocation	TEXT DEFAULT NULL,"
       "sCode	TEXT DEFAULT NULL,"
       "sBarCode	TEXT DEFAULT NULL,"
       "iBaseUnit	INTEGER DEFAULT NULL,"
       "iSecondaryUnit	INTEGER DEFAULT NULL,"
       "sPeacePerSize	TEXT DEFAULT NULL,"
       "sTotalPeace	TEXT DEFAULT NULL,"
       "sTotalUnitSize	TEXT DEFAULT NULL,"
       "sWhatSecUnitIs TEXT DEFAULT NULL,"
       "dcPurcasePerBaseUnitPrice	decimal(10, 2) DEFAULT NULL,"
    "dcPurchasePerSecondaryUnitPrice	decimal(10, 2) DEFAULT NULL,"
    "dcSalePerBaseUnitPrice	decimal(10, 2) DEFAULT NULL,"
    "dSalePerSecondaryUnitPrice	TEXT DEFAULT NULL,"
    "sProduct_image TEXT DEFAULT NULL,"
    "sImage_Thumbnail	TEXT DEFAULT NULL,"
    "sOpeningStockBaseUnit	TEXT DEFAULT NULL,"
    "sOpeningStockSecondaryUnit	TEXT DEFAULT NULL,"
    "sOpeningStockPurchase_At	TEXT DEFAULT NULL,"
    "sTotalBaseUnitStockQty	TEXT DEFAULT NULL,"
    "sTotalSecondaryUnitStockQty	TEXT DEFAULT NULL,"
    "sTotalBaseUnitPurchaseValue	TEXT DEFAULT NULL,"
    "sTotalSecondaryUnitPurchaseValue	TEXT DEFAULT NULL,"
    "sProducttype	TEXT DEFAULT NULL,"
    "sBaseUnitProfitRatio	TEXT DEFAULT NULL,"
    "sSecoundaryUnitProfitRatio	TEXT DEFAULT NULL,"
    "sTotalBaseUnitAvgPP	TEXT DEFAULT NULL,"
    "sTotalSecUnitAvgPP	TEXT DEFAULT NULL,"
    "sBonusRecivedStockInBaseUnit	TEXT DEFAULT NULL,"
    "sBonusRecivedStockInSecondaryUnit	TEXT DEFAULT NULL,"
    "sTotalBonusGivenStockOutInBaseUnit	TEXT DEFAULT NULL,"
    "sTotalBonusGivenStockOutInSecUnit	TEXT DEFAULT NULL,"
    "sTotalStockWithBonusInBaseUnitQty	TEXT DEFAULT NULL,"
    "sTotalStockWithBonusInSecUnitQty	TEXT DEFAULT NULL,"
    "bOnlineSale	TEXT NOT NULL,"
    "sSyncStatus	TEXT DEFAULT NULL,"
    "sEntrySource	TEXT DEFAULT NULL,"
    "bStatus	TEXT DEFAULT NULL,"
    "sAction	TEXT DEFAULT NULL,"
    "iDeletedBy	INTEGER DEFAULT NULL,"
    "dtDeletedDate	datetime DEFAULT NULL,"
    "iUpdatedBy	INTEGER DEFAULT NULL,"
    "dtUpdatedDate	datetime DEFAULT NULL,"
    "iAddedBy	INTEGER DEFAULT NULL,"
    "dtCreatedDate	datetime DEFAULT NULL)"
   );
    List<dynamic> res = await batch.commit();
  }


  //Save
  Future<ProductModel> saveProductData(ProductModel product) async{
    var dbClient = await db;
    await dbClient.insert(Table_Product, product.toMap());
    return product;
  }

  Future<ExpenseTypeModel> saveExpenseTypeData(ExpenseTypeModel expenseType) async{
    var dbClient = await db;
    await dbClient.insert(Table_Expense_Type, expenseType.toMap());
    return expenseType;
  }

  Future<ProductUnitModel> saveProductUnitData(ProductUnitModel productUnit) async{
    var dbClient = await db;
    await dbClient.insert(Table_Product_Unit, productUnit.toMap());
    return productUnit;
  }

  Future<UserModel> saveUserData(UserModel user) async{
  var dbClient = await db;
   await dbClient.insert(Table_User, user.toMap());
  return user;
  }
  Future<AreaModel> saveAreaData(AreaModel area) async{
    var dbClient = await db;
    await dbClient.insert( Table_Area,area.toMap());
    return area;
  }
  Future<ProductCompanyModel> saveProductCompanyData(ProductCompanyModel productCompany) async{
    var dbClient = await db;
    await dbClient.insert( Table_Product_Company,productCompany.toMap());
    return productCompany;
  }
  Future<ProductGroupingModel> saveProductGroupingData(ProductGroupingModel productGrouping) async{
    var dbClient = await db;
    await dbClient.insert( Table_Product_Grouping,productGrouping.toMap());
    return productGrouping;
  }

  //Get
  Future<List<Map<String, Object?>>> getProduct() async{
    var dbClient = await db;
    List<Map<String, Object?>> res = await dbClient.query(Table_Product);
    return res;
  }
  Future<List<Map<String, Object?>>> getExpenseType() async{
    var dbClient = await db;
    List<Map<String, Object?>> res = await dbClient.query(Table_Product_Unit);
    return res;
  }

  Future<List<Map<String, Object?>>> getProductUnit() async{
    var dbClient = await db;
    List<Map<String, Object?>> res = await dbClient.query(Table_Product_Unit);
    return res;
  }

  Future<List<Map<String, Object?>>> getSaleArea() async{
    var dbClient = await db;
    List<Map<String, Object?>> res = await dbClient.query(Table_Area);
      return res;
  }

  Future<List<Map<String, Object?>>> getProductGrouping() async{
    var dbClient = await db;
    List<Map<String, Object?>> res = await dbClient.query(Table_Product_Grouping);
    return res;
  }

  Future<List<Map<String, Object?>>> getProductCompany() async{
    var dbClient = await db;
    List<Map<String, Object?>> res = await dbClient.query(Table_Product_Company);
    return res;
  }

  Future<UserModel?> getLoginUser(String userEmail, String userPassword) async{
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE $C_Email = '$userEmail' AND $C_Password = '$userPassword'");
    if(res.length>0){
      return UserModel.fromMap(res.first);
    }
    print("${res.length}");
    return null;
  }
}