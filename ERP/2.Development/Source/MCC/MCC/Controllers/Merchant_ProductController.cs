﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.SqlServer;
using BIBIAM.Core.Entities;
using MCC.Models;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using BIBIAM.Core.Data.DataObject;
using CloudinaryDotNet;
using System.Web;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using MCC.Helpers;
using MCC.Filters;
using System.IO;
using System.Security.AccessControl;
using System.Security.Principal;
using OfficeOpenXml;
using System.Text.RegularExpressions;
using BIBIAM.Core;
using Kendo.Mvc;
using System.ComponentModel;

namespace MCC.Controllers
{
    [Authorize]
    public class Merchant_ProductController : CustomController
    {
        public ActionResult Index()
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["create"]))
            {
                ViewBag.isAdmin = isAdmin;
                using (var db = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    ViewBag.thuong_hieu = db.GetDictionary<string, string>("SELECT ma_thuong_hieu,ten_thuong_hieu FROM BrandManagement").Select(s => new Code_Master_Json { Value = s.Key, Name = s.Value });
                }
                return View();
            }
            else return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Read([DataSourceRequest] DataSourceRequest request)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    var sqlQuery = @"SELECT p.*,mi.ten_gian_hang,b.ten_thuong_hieu,hi.ten_phan_cap as nganh_hang
                                        FROM Merchant_Product p 
                                        LEFT join BrandManagement b on p.thuong_hieu = b.ma_thuong_hieu
                                        LEFT JOIN dbo.Merchant_Info mi ON mi.ma_gian_hang=p.ma_gian_hang
                                        LEFT JOIN dbo.Hierarchy hi ON hi.ma_phan_cap=p.ma_loai_san_pham ";
                    
                    string whereCondition = string.Empty;
                    var b = new SortDescriptor("ngay_cap_nhat", ListSortDirection.Descending);
                    request.Sorts.Add(b);
                    if (isAdmin)
                    {
                        return Json(KendoApplyFilter.KendoDataByQuery<Merchant_Product>(request, sqlQuery, whereCondition));
                    }
                    else
                    {
                        whereCondition = "where p.ma_gian_hang={0}".Params(currentUser.ma_gian_hang);
                        return Json(KendoApplyFilter.KendoDataByQuery<Merchant_Product>(request, sqlQuery + whereCondition, ""));
                    }
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }

        public ActionResult GetPropertyFromProduct(string ma_san_pham)
        {
            //List<SqlParameter> param = new List<SqlParameter>();
            //param.Add(new SqlParameter("@ma_san_pham", ma_san_pham));
            //param.Add(new SqlParameter("@ma_gian_hang", currentUser.ma_gian_hang));
            //DataTable dt = new BIBIAM.Core.Data.Providers.SqlHelper(AppConfigs.MCCConnectionString).ExecuteQuery("p_Get_Property_Detail_From_Product", param);
            //List<Product_Property> lstResult = new Product_Property_DAO().ConvertDatatableToList(dt);
            //return Json(new { success = true, data = lstResult });

            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    var data = dbConn.SqlList<Property>("exec p_Get_Property_Detail_From_Product {0}, {1}".Params(ma_san_pham, currentUser.ma_gian_hang));
                    if (data == null)
                        return Json(new { success = false, message = "Không có dữ liệu", JsonRequestBehavior.AllowGet });
                    else return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }

        public ActionResult ReadProductInfo([DataSourceRequest] DataSourceRequest request)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                var data = new Product_Info_DAO().ReadAllNonSelected(AppConfigs.ERPConnectionString);
                return Json(data.ToDataSourceResult(request));
            }
            else return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult getNameFromHierarchy(string ma_phan_cap)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    var data = dbConn.FirstOrDefault<Hierarchy>(s => s.ma_phan_cap == ma_phan_cap);
                    return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                }
            }
            else return RedirectToAction("NoAccess", "Error");
        }

        public ActionResult CreateFromProdInfo(int id, string ma_san_pham)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["create"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    dbConn.ExecuteSql("EXEC p_ProductInfo_to_MerchantProduct @id={0}, @ma_san_pham={1}, @ma_gian_hang={2}".Params(id, ma_san_pham, currentUser.ma_gian_hang));
                }
                return Json(new { success = true });
            }
            else return RedirectToAction("NoAccess", "Error");
        }

        public ActionResult Create()
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["create"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    ViewBag.thuong_hieu = dbConn.GetDictionary<string, string>("SELECT ma_thuong_hieu,ten_thuong_hieu FROM BrandManagement").Select(s => new Code_Master_Json { Value = s.Key, Name = s.Value });
                    return View();
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult ReadHierarchy([DataSourceRequest] DataSourceRequest request, int cap, string ma_phan_cap_cha = "")
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    //dbConn.ChangeDatabase(AllConstant.ERPDBName);
                    var loai_phan_cap = dbConn.FirstOrDefault<Code_Master>(s => s.Name == "Product" && s.Type == "HierarchyType");
                    var data = dbConn.Select<Hierarchy>(s => s.trang_thai == AllConstant.trang_thai.DANG_SU_DUNG && s.loai_phan_cap == loai_phan_cap.Value && s.cap == cap && s.ma_phan_cap_cha == ma_phan_cap_cha).OrderBy(s => s.ten_phan_cap);
                    return Json(data.ToDataSourceResult(request));
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }
        //public ActionResult Edit(string id)
        //{
        //    if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"] || accessDetail.access["create"]))
        //    {
        //        if (String.IsNullOrEmpty(id))
        //            return RedirectToAction("Create", "Merchant_Product");
        //        using (var db = MCC.Helpers.OrmliteConnection.openConn())
        //        {
        //            ViewBag.isAdmin = isAdmin;
        //            ViewBag.thuong_hieu = db.GetDictionary<string, string>("SELECT ma_thuong_hieu,ten_thuong_hieu FROM BrandManagement").Select(s => new Code_Master_Json { Value = s.Key, Name = s.Value });
        //            if (isAdmin)
        //                ViewBag.data = db.SingleOrDefault<Merchant_Product>("ma_san_pham = {0}", id);
        //            else
        //                ViewBag.data = db.SingleOrDefault<Merchant_Product>("ma_san_pham = {0} and ma_gian_hang = {1}", id, currentUser.ma_gian_hang);

        //            if (ViewBag.data == null)
        //                return RedirectToAction("Create", "Merchant_Product");

        //            return View();
        //        }
        //    }
        //    return RedirectToAction("NoAccess", "Error");
        //}

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateUpdateProduct(Merchant_Product product, Merchant_Product_Hierarchy hierarchy, List<Merchant_Product_Image> listimage, List<Merchant_Product_Property> properties, HttpPostedFileBase file, HttpPostedFileBase FileUploadCatalog)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["create"]))
            {
                if (product.id == 0 || product.ma_san_pham == null)
                {
                    if (file == null && (listimage == null ? 0 : listimage.Count()) == 0)
                    {
                        return Json(new { success = false, message = "Vui lòng chọn hình ảnh sản phẩm", JsonRequestBehavior.AllowGet });
                    }

                    if (file != null)
                    {
                        product.url = new Helpers.ProcessImage().UploadImageToAzure(AllConstant.FoldderName_Merchant_Product, file, currentUser.ma_gian_hang, currentUser.name);
                    }

                    //Xử lí catalog
                    if (FileUploadCatalog != null)
                    {
                        //update folder info
                        Merchant_Folder_Info folder = new Merchant_Folder_Info();
                        folder.ma_gian_hang = currentUser.ma_gian_hang;
                        folder.ten_thu_muc = AllConstant.FoldderName_Merchant_Catalog;
                        folder.ngay_tao = DateTime.Now;
                        folder.nguoi_tao = currentUser.name;
                        folder.ngay_cap_nhat = DateTime.Now;
                        folder.nguoi_cap_nhat = currentUser.name;
                        string a = new Merchant_Folder_Info_DAO().Insert(folder, AppConfigs.MCCConnectionString);

                        string LocalPath = "";
                        string LocalFolderPath = "";
                        string url_link = new AzureHelper().UploadFileToAzure("Catalog", FileUploadCatalog, currentUser.name, ref LocalFolderPath, ref LocalPath);
                        //update catalog info
                        Merchant_Catalog catalog = new Merchant_Catalog();
                        catalog.dung_luong = FileUploadCatalog.ContentLength;
                        catalog.duong_dan_day_du = url_link;
                        catalog.ma_gian_hang = currentUser.ma_gian_hang;
                        catalog.ten_catalog = Path.GetFileNameWithoutExtension(FileUploadCatalog.FileName);
                        catalog.thu_muc = currentUser.ma_gian_hang + "/Catalog/";
                        catalog.url = DateTime.Now.ToString("yyyyMMddHHmmssfff") + currentUser.name + "-" + FileUploadCatalog.FileName;
                        string b = new Merchant_Catalog_DAO().UpSert(catalog, currentUser.name, AppConfigs.MCCConnectionString);

                        product.catalog = url_link;
                    }

                    // Product
                    product.ma_loai_san_pham = hierarchy.ma_cay_phan_cap_3;
                    product.ma_gian_hang = currentUser.ma_gian_hang;
                    product.nguoi_tao = currentUser.name;
                    product.khoi_luong = double.Parse(Request["khoi_luong"].ToString(), System.Globalization.NumberStyles.AllowDecimalPoint, System.Globalization.NumberFormatInfo.InvariantInfo);
                    product.tag = product.slug = StringHelper.convertToUnSign3(product.ten_san_pham + " " + product.part_no);
                    // Image Thumbnail   
                    // Hierarchy                
                    // Product_Property                 
                    string result = new Merchant_Product_DAO().CreateProduct(product, hierarchy, listimage, properties, AppConfigs.MCCConnectionString);
                    if (!string.IsNullOrEmpty(result))
                    {
                        string[] StringSplit = new string[] { "@@" };
                        if (result.Split(StringSplit, StringSplitOptions.None)[0] != "true")
                            return Json(new { success = false, message = result.Split(StringSplit, StringSplitOptions.None)[1], JsonRequestBehavior.AllowGet });
                        using (var dbConn = MCC.Helpers.OrmliteConnection.openConn())
                        {
                            var data = dbConn.FirstOrDefault<Merchant_Product>("ma_san_pham={0}".Params(result.Split(StringSplit, StringSplitOptions.None)[1]));
                            return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                        }
                    }
                }
                else
                {
                    List<Merchant_Product_Property> properties_update = new List<Merchant_Product_Property>();
                    if (file != null)
                    {
                        /* 
                         xử lý
                        */
                        // kết quả
                        product.url = new Helpers.ProcessImage().UploadImageToAzure(AllConstant.FoldderName_Merchant_Product, file, currentUser.ma_gian_hang, currentUser.name);
                    }
                    // Product

                    //Xử lí catalog
                    if (FileUploadCatalog != null)
                    {
                        //update folder info
                        Merchant_Folder_Info folder = new Merchant_Folder_Info();
                        folder.ma_gian_hang = currentUser.ma_gian_hang;
                        folder.ten_thu_muc = AllConstant.FoldderName_Merchant_Catalog;
                        folder.ngay_tao = DateTime.Now;
                        folder.nguoi_tao = currentUser.name;
                        folder.ngay_cap_nhat = DateTime.Now;
                        folder.nguoi_cap_nhat = currentUser.name;
                        string a = new Merchant_Folder_Info_DAO().Insert(folder, AppConfigs.MCCConnectionString);

                        string LocalPath = "";
                        string LocalFolderPath = "";
                        string url_link = new AzureHelper().UploadFileToAzure("Catalog", FileUploadCatalog, currentUser.name, ref LocalFolderPath, ref LocalPath);
                        //update catalog info
                        Merchant_Catalog catalog = new Merchant_Catalog();
                        catalog.dung_luong = FileUploadCatalog.ContentLength;
                        catalog.duong_dan_day_du = url_link;
                        catalog.ma_gian_hang = currentUser.ma_gian_hang;
                        catalog.ten_catalog = Path.GetFileNameWithoutExtension(FileUploadCatalog.FileName);
                        catalog.thu_muc = currentUser.ma_gian_hang + "/Catalog/";
                        catalog.url = DateTime.Now.ToString("yyyyMMddHHmmssfff") + currentUser.name + "-" + FileUploadCatalog.FileName;
                        string b = new Merchant_Catalog_DAO().UpSert(catalog, currentUser.name, AppConfigs.MCCConnectionString);
                        product.catalog = url_link;
                    }

                    product.ma_loai_san_pham = hierarchy.ma_cay_phan_cap_3;
                    product.ma_gian_hang = currentUser.ma_gian_hang;
                    product.nguoi_cap_nhat = currentUser.name;
                    product.khoi_luong = double.Parse(Request["khoi_luong"].ToString(), System.Globalization.NumberStyles.AllowDecimalPoint, System.Globalization.NumberFormatInfo.InvariantInfo);
                    product.tag = product.slug = StringHelper.convertToUnSign3(product.ten_san_pham + " " + product.part_no);
                    product.nguoi_cap_nhat = currentUser.name;
                    using (var db = MCC.Helpers.OrmliteConnection.openConn())
                    {
                        hierarchy = db.SqlList<Merchant_Product_Hierarchy>("exec _p_Get_Tree_Hierarchy_By_IdLevel3 {0}".Params(hierarchy.ma_cay_phan_cap_3)).FirstOrDefault();
                    }
                    // Product_Property                 
                    string result = new Merchant_Product_DAO().UpdateProduct(product, hierarchy, listimage, properties_update, AppConfigs.MCCConnectionString);
                    if (result == "true")
                        using (var db = MCC.Helpers.OrmliteConnection.openConn())
                        {
                            Merchant_Product data;
                            if (isAdmin)
                                data = db.FirstOrDefault<Merchant_Product>("id = {0}", product.id);
                            else
                                data = db.FirstOrDefault<Merchant_Product>("id = {0} and ma_gian_hang = {1}", product.id, currentUser.ma_gian_hang);
                            return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                        }
                    else
                        return Json(new { success = false, message = result, JsonRequestBehavior.AllowGet });
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult GetImages(string ma_san_pham)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    List<Merchant_Product_Image> data;
                    if (isAdmin)
                        data = db.Select<Merchant_Product_Image>("ma_san_pham = {0}".Params(ma_san_pham));
                    else
                        data = db.Select<Merchant_Product_Image>("ma_san_pham = {0} and ma_gian_hang={1}".Params(ma_san_pham, currentUser.ma_gian_hang));
                    return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Delete(string data)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["delete"]))
            {

                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần xóa!" });
                }
                string rs = new Merchant_Product_DAO().ChangeStatus(ids, AppConfigs.MCCConnectionString, currentUser.name, AllConstant.trang_thai.KHONG_SU_DUNG);
                if(rs!="true")
                {
                    return Json(new { success = false, message = "Xóa không thành công! " });
                }
                string st = new Merchant_Product_DAO().Delete(ids, AppConfigs.MCCConnectionString);
                if (st == "true")
                    return Json(new { success = true, message = "Thành công!" });
                else
                    ModelState.AddModelError("", st);
            }
            if (!isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["delete"]))
            {

                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần xóa!" });
                }
                string st = new Merchant_Product_DAO().ChangeStatus(ids, AppConfigs.MCCConnectionString, currentUser.name, AllConstant.trang_thai.KHONG_SU_DUNG);
                if (st == "true")
                    return Json(new { success = true, message = "Thành công!" });
                else
                    ModelState.AddModelError("", st);
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult ActiveProduct(string data)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                try
                {
                    string[] separators = { "," };
                    string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                    if (ids.Length == 0)
                    {
                        return Json(new { success = false, message = "Chọn các sản phẩm cần kích hoạt!" });
                    }

                    using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                    {
                        foreach (var id in ids)
                        {
                            var exists = dbConn.FirstOrDefault<Merchant_Product>("id={0}".Params(id));
                            dbConn.UpdateOnly(new Merchant_Product { trang_thai = exists.trang_thai == "DANG_SU_DUNG" ? "KHONG_SU_DUNG" : "DANG_SU_DUNG", nguoi_cap_nhat = currentUser.name, ngay_cap_nhat = DateTime.Now }, onlyFields: p => new { p.trang_thai, p.nguoi_cap_nhat, p.ngay_cap_nhat }, where: p => p.id == int.Parse(id));
                        }
                    }
                    return Json(new { success = true, message = "Thành công!" });
                }
                catch (Exception e)
                {
                    return Json(new { success = false, error = e.Message });
                }
            }
            else
            {
                return Json(new { success = false, error = "Bạn không có quyền thực hiên chức năng này!" });
            }


        }
        public ActionResult InActiveProduct(string data)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {

                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần ngưng hoạt động!" });
                }
                string st = new Merchant_Product_DAO().ChangeStatus(ids, AppConfigs.MCCConnectionString, currentUser.name, AllConstant.trang_thai.KHONG_SU_DUNG);
                if (st == "true")
                    return Json(new { success = true, message = "Thành công!" });
                else
                    ModelState.AddModelError("", st);
            }
            return Json(new { success = false, message = "Ngưng hoạt động không thành công! " });
        }
        public ActionResult Xuat_Ban(string id)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                var rs = "";
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    var check = db.FirstOrDefault<Merchant_Product>("id={0}".Params(id));
                    if (check.trang_thai != AllConstant.trang_thai.DANG_SU_DUNG || check.trang_thai_duyet != AllConstant.trang_thai_duyet.DA_DUYET)
                    {
                        return Json(new { success = false, message = "Sản phẩm không sử dụng hoặc chưa được duyệt!", JsonRequestBehavior.AllowGet });
                    }
                    else
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_xuat_ban = {3}, nguoi_xuat_ban = {0},ngay_xuat_ban={1} where id = {2}".Params(currentUser.name, DateTime.Now, id, AllConstant.trang_thai_xuat_ban.DA_XUAT_BAN));
                        
                        //SyncToMySQL
                        rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                    }
                }
                //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);
                if (rs == "true")
                {
                    using (var dbConn = MCC.Helpers.OrmliteConnection.openConn())
                    {
                        var data = dbConn.FirstOrDefault<Merchant_Product>("id={0}".Params(id));
                        return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                    }
                }
                else
                    return Json(new { success = false, message = rs, JsonRequestBehavior.AllowGet });
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Ngung_Xuat_Ban(string id)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                var rs = "";
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    db.ExecuteNonQuery("update Merchant_Product set trang_thai_xuat_ban = {3}, nguoi_xuat_ban = {0},ngay_xuat_ban={1} where id = {2}".Params(currentUser.name, DateTime.Now, id, AllConstant.trang_thai_xuat_ban.CHUA_XUAT_BAN));

                    //SyncToMySQL
                    rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                }
              
                //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);
                if (rs == "true")
                {
                    using (var dbConn = MCC.Helpers.OrmliteConnection.openConn())
                    {
                        var data = dbConn.FirstOrDefault<Merchant_Product>("id={0}".Params(id));
                        return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                    }
                }
                else
                    return Json(new { success = false, message = rs, JsonRequestBehavior.AllowGet });
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Xuat_Ban_Danh_Sach(string data)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần xuất bản!" });
                }
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    foreach (var id in ids)
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_xuat_ban = {3}, nguoi_xuat_ban = {0},ngay_xuat_ban={1} where id = {2}".Params(currentUser.name, DateTime.Now, id, AllConstant.trang_thai_xuat_ban.DA_XUAT_BAN));
                        //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);

                        //SyncToMySQL
                        var rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                    }
                }
                return Json(new { success = true, JsonRequestBehavior.AllowGet });
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Ngung_Xuat_Ban_Danh_Sach(string data)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần ngưng xuất bản!" });
                }
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    foreach (var id in ids)
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_xuat_ban = {3}, nguoi_xuat_ban = {0},ngay_xuat_ban={1} where id = {2}".Params(currentUser.name, DateTime.Now, id, AllConstant.trang_thai_xuat_ban.CHUA_XUAT_BAN));
                        //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);

                        //SyncToMySQL
                        var rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);

                    }
                }
                return Json(new { success = true, JsonRequestBehavior.AllowGet });
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult TuChoiDuyet(string data,string li_do_tu_choi_duyet)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần từ chối duyệt!" });
                }
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    foreach (var id in ids)
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_duyet = {0},trang_thai_xuat_ban={5} ,ly_do_tu_choi_duyet={1}, nguoi_duyet = {2},ngay_duyet={3} where id = {4}".Params(AllConstant.trang_thai_duyet.TU_CHOI,li_do_tu_choi_duyet,currentUser.name, DateTime.Now, id,AllConstant.trang_thai_xuat_ban.CHUA_XUAT_BAN));
                        //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);

                        //SyncToMySQL
                        var rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                    }
                }
                return Json(new { success = true, JsonRequestBehavior.AllowGet });
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult TuChoiDuyetRow(string id, string li_do_tu_choi_duyet)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    try
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_duyet = {0},trang_thai_xuat_ban={5} ,ly_do_tu_choi_duyet={1}, nguoi_duyet = {2},ngay_duyet={3} where id = {4}".Params(AllConstant.trang_thai_duyet.TU_CHOI, li_do_tu_choi_duyet, currentUser.name, DateTime.Now, id, AllConstant.trang_thai_xuat_ban.CHUA_XUAT_BAN));
                        //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);

                        //SyncToMySQL
                        var rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                        if (rs == "true")
                        {
                            var data = db.FirstOrDefault<Merchant_Product>("id={0}".Params(id));
                            return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                        }
                    }
                    catch (Exception e)
                    {
                        return Json(new { success = false, message = e.Message.ToString(), JsonRequestBehavior.AllowGet });
                    }
                }
                
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Duyet(string id)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    try
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_duyet = {3}, nguoi_duyet = {0},ngay_duyet={1} where id = {2}".Params(currentUser.name, DateTime.Now, id, AllConstant.trang_thai_duyet.DA_DUYET));
                        //new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);
                        
                        //SyncToMySQL
                        var rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                        if (rs == "true")
                        {
                                var data = db.FirstOrDefault<Merchant_Product>("id={0}".Params(id));
                                return Json(new { success = true, data = data, JsonRequestBehavior.AllowGet });
                        }
                    }
                    catch (Exception e)
                    {
                        return Json(new { success = false, message = e.Message.ToString(), JsonRequestBehavior.AllowGet });
                    }
                }
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult Duyet_Danh_Sach(string data)
        {
            if (isAdmin && accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các sản phẩm cần duyệt!" });
                }
                using (var db = MCC.Helpers.OrmliteConnection.openConn())
                {
                    foreach (var id in ids)
                    {
                        db.ExecuteNonQuery("update Merchant_Product set trang_thai_duyet = {3}, nguoi_duyet = {0},ngay_duyet={1} where id = {2}".Params(currentUser.name, DateTime.Now, id, AllConstant.trang_thai_duyet.DA_DUYET));
                        //var rs = new Merchant_Product_DAO().SyncToMySQL(id, currentUser.name);

                        //SyncToMySQL
                        var rs = new Merchant_Product_DAO().SyncToMySQL(id, AppConfigs.MCCConnectionString);
                    }
                }
                return Json(new { success = true, JsonRequestBehavior.AllowGet });
            }
            return RedirectToAction("NoAccess", "Error");
        }
        public ActionResult GetProduct([DataSourceRequest]DataSourceRequest request, string text)
        {
            using (IDbConnection dbConn = Helpers.OrmliteConnection.openConn())
            {
                var data = new List<Merchant_Product>();
                if (isAdmin)
                    data = dbConn.Select<Merchant_Product>(@"SELECT TOP 5 ma_san_pham,ten_san_pham FROM Merchant_Product WHERE ten_san_pham COLLATE Latin1_General_CI_AI  LIKE N'%" + text + "%' or ma_san_pham={0}".Params(text));
                else
                    data = dbConn.Select<Merchant_Product>(@"SELECT TOP 5 ma_san_pham,ten_san_pham FROM Merchant_Product WHERE (ten_san_pham COLLATE Latin1_General_CI_AI  LIKE N'%" + text + "%' or ma_san_pham={0}) and ma_gian_hang={1}".Params(text,currentUser.ma_gian_hang));
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Export(string type)
        {
            using (var dbConn = Helpers.OrmliteConnection.openConn())
            {
                FileInfo fileInfo = new FileInfo(Server.MapPath(@"~\ExportExcelFile\Product_Template.xlsx"));

                var excelPkg = new ExcelPackage(fileInfo);
                string fileName = "SanPham_" + DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss") + ".xlsx";
                string contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                ExcelWorksheet Sheet = excelPkg.Workbook.Worksheets["Data"];
                ExcelWorksheet ws1 = excelPkg.Workbook.Worksheets["Hierarchy"];

                int rowData2 = 2;
                var hierarchy = dbConn.Select<Hierarchy>(s => s.cap == 3 && s.loai_phan_cap == "HRC06" && s.trang_thai == AllConstant.trang_thai.DANG_SU_DUNG);
                foreach (var item in hierarchy)
                {
                    int j = 1;
                    ws1.Cells[rowData2, j++].Value = item.ten_phan_cap + "-" + item.ma_phan_cap;
                    rowData2++;
                }

                if (type == "1")
                {
                    List<Merchant_Product> lstProduct = new List<Merchant_Product>();
                    Hierarchy itemHierarchy;
                    string ten_phan_cap = "";
                    if (isAdmin)
                        lstProduct = dbConn.Select<Merchant_Product>();
                    else
                        lstProduct = dbConn.Select<Merchant_Product>(s => s.ma_gian_hang == currentUser.ma_gian_hang);
                    rowData2 = 2;

                    foreach (var item in lstProduct)
                    {
                        int j = 1;
                        Sheet.Cells[rowData2, j++].Value = item.ma_san_pham;
                        if (!string.IsNullOrEmpty(item.ma_loai_san_pham))
                        {
                            itemHierarchy = hierarchy.Where(s => s.ma_phan_cap == item.ma_loai_san_pham).FirstOrDefault();
                            if (itemHierarchy != null)
                                Sheet.Cells[rowData2, j++].Value = itemHierarchy.ten_phan_cap + "-" + itemHierarchy.ma_phan_cap;
                            else
                                Sheet.Cells[rowData2, j++].Value = "";
                        }
                        else
                        {
                            Sheet.Cells[rowData2, j++].Value = "";
                        }
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.ten_san_pham) ? item.ten_san_pham : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.part_no) ? item.part_no : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.mo_ta) ? item.mo_ta : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.minimum_order.ToString()) ? item.minimum_order.ToString() : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.trong_so.ToString()) ? item.trong_so.ToString() : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.khoi_luong.ToString()) ? item.khoi_luong.ToString() : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.don_gia.ToString()) ? item.don_gia.ToString() : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.gia_si.ToString()) ? item.gia_si.ToString() : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.xuat_xu) ? item.xuat_xu : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.thuong_hieu) ? item.thuong_hieu : "";
                        Sheet.Cells[rowData2, j++].Value = !string.IsNullOrEmpty(item.model) ? item.model : "";

                        rowData2++;
                    }
                }

                MemoryStream output = new MemoryStream();
                excelPkg.SaveAs(output);
                output.Position = 0;
                return File(output.ToArray(), contentType, fileName);
            }
        }
        public ActionResult GetOriginalInfo()
        {
            using (var dbConn = OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
            {
                var data = new List<DropDownJsonString>();
                data = dbConn.GetDictionary<string, string>("SELECT distinct xuat_xu as id, xuat_xu as name FROM Merchant_Product where xuat_xu is not null").Select(s => new DropDownJsonString { id = s.Key, name = s.Value }).ToList();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Import(HttpPostedFileBase FileUpload)
        {
            try
            {
                //var aba = Request["files"];
                if (FileUpload == null || FileUpload.ContentLength == 0) return Json(new { success = false, message = "File rỗng." });
                var fileExtension = System.IO.Path.GetExtension(FileUpload.FileName);
                if (fileExtension != ".xlsx" && fileExtension != ".xls") return Json(new { success = false, message = "File không không đúng định dạng excel *.xlsx,*.xls" });
                string datetime = DateTime.Now.ToString("yyyyMMddHHmmss");
                string fileLocation = string.Format("{0}/{1}", Server.MapPath("~/ExcelImport"), "[" + currentUser.name + "-" + datetime + FileUpload.FileName);
                string errorFileLocation = string.Format("{0}/{1}", Server.MapPath("~/ExcelImport"), "[" + currentUser.name + "-" + datetime + "-Error]" + FileUpload.FileName);
                string linkerror = "[" + currentUser.name + "-" + datetime + "-Error]" + FileUpload.FileName;
                if (!System.IO.Directory.Exists(Server.MapPath("~/ExcelImport")))
                {
                    System.IO.Directory.CreateDirectory(fileLocation);
                }
                if (System.IO.File.Exists(fileLocation)) System.IO.File.Delete(fileLocation);
                string contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                FileUpload.SaveAs(fileLocation);
                var rownumber = 2;
                var total = 0;
                var error = 0;
                FileInfo fileInfo = new FileInfo(fileLocation);
                var excelPkg = new ExcelPackage(fileInfo);
                FileInfo template = new FileInfo(Server.MapPath(@"~\ExportExcelFile\Product_Template.xlsx"));
                template.CopyTo(errorFileLocation);
                FileInfo _fileInfo = new FileInfo(errorFileLocation);
                var _excelPkg = new ExcelPackage(_fileInfo);
                ExcelWorksheet oSheet = excelPkg.Workbook.Worksheets["Data"];
                ExcelWorksheet eSheet = _excelPkg.Workbook.Worksheets["Data"];
                int totalRows = oSheet.Dimension.End.Row;
                string hierarchycode = "";
                string ma_thuong_hieu = "";
                using (var dbConn = OrmliteConnection.openConn())
                {
                    var listHerarchy = dbConn.Select<Hierarchy>(s => s.cap == 3 && s.loai_phan_cap == "HRC06" && s.trang_thai == AllConstant.trang_thai.DANG_SU_DUNG);
                    var listBrand = dbConn.Select<BrandManagement>(s => s.trang_thai == AllConstant.trang_thai.DANG_SU_DUNG);
                    for (int i = 2; i <= totalRows; i++)
                    {
                        string masanpham = oSheet.Cells[i, 1].Value != null ? oSheet.Cells[i, 1].Value.ToString() : "";
                        string hierarchy = oSheet.Cells[i, 2].Value != null ? oSheet.Cells[i, 2].Value.ToString() : "";
                        string productname = oSheet.Cells[i, 3].Value != null ? oSheet.Cells[i, 3].Value.ToString() : "";
                        string part_no = oSheet.Cells[i, 4].Value != null ? oSheet.Cells[i, 4].Value.ToString() : "";
                        string mo_ta = oSheet.Cells[i, 5].Value != null ? oSheet.Cells[i, 5].Value.ToString() : "";
                        var strminimumorder = oSheet.Cells[i, 6].Value;
                        var strtrong_so = oSheet.Cells[i, 7].Value;
                        string strkhoi_luong = oSheet.Cells[i, 8].Value != null ? oSheet.Cells[i, 8].Value.ToString() : "0";
                        string strdon_gia = oSheet.Cells[i, 9].Value != null ? oSheet.Cells[i, 9].Value.ToString() : "0";
                        string strgia_si = oSheet.Cells[i, 10].Value != null ? oSheet.Cells[i, 10].Value.ToString() : "0";
                        string xuat_xu = oSheet.Cells[i, 11].Value != null ? oSheet.Cells[i, 11].Value.ToString() : "";
                        string thuong_hieu = oSheet.Cells[i, 12].Value != null ? oSheet.Cells[i, 12].Value.ToString() : "";
                        string model = oSheet.Cells[i, 13].Value != null ? oSheet.Cells[i, 13].Value.ToString() : "";
                        string tu_khoa = oSheet.Cells[i, 14].Value != null ? oSheet.Cells[i, 14].Value.ToString() : "";
                        string trang_thai = oSheet.Cells[i, 15].Value != null ? oSheet.Cells[i, 15].Value.ToString() : "";
                        string noi_dung = oSheet.Cells[i, 16].Value != null ? oSheet.Cells[i, 16].Value.ToString() : "";
                        if (string.IsNullOrEmpty(hierarchy) || string.IsNullOrEmpty(productname))
                        {
                            eSheet.Cells[rownumber, 1].Value = masanpham;
                            eSheet.Cells[rownumber, 2].Value = hierarchy;
                            eSheet.Cells[rownumber, 3].Value = productname;
                            eSheet.Cells[rownumber, 4].Value = part_no;
                            eSheet.Cells[rownumber, 5].Value = mo_ta;
                            eSheet.Cells[rownumber, 6].Value = strminimumorder;
                            eSheet.Cells[rownumber, 7].Value = strtrong_so;
                            eSheet.Cells[rownumber, 8].Value = strkhoi_luong;
                            eSheet.Cells[rownumber, 9].Value = strdon_gia;
                            eSheet.Cells[rownumber, 10].Value = strgia_si;
                            eSheet.Cells[rownumber, 11].Value = xuat_xu;
                            eSheet.Cells[rownumber, 12].Value = thuong_hieu;
                            eSheet.Cells[rownumber, 13].Value = model;
                            eSheet.Cells[rownumber, 14].Value = tu_khoa;
                            eSheet.Cells[rownumber, 15].Value = trang_thai;
                            eSheet.Cells[rownumber, 16].Value = "Vui lòng nhập (*).";
                            rownumber++;
                            error++;
                            continue;
                        }

                        int trong_so = 0;
                        int minimum_order = 0;
                        double khoi_luong = 0;
                        float don_gia = 0;
                        float gia_si = 0;
                        bool
                        result = double.TryParse(strkhoi_luong, out khoi_luong);
                        result = float.TryParse(strdon_gia, out don_gia);
                        result = float.TryParse(strgia_si, out gia_si);

                        if (!result)
                        {
                            eSheet.Cells[rownumber, 1].Value = masanpham;
                            eSheet.Cells[rownumber, 2].Value = hierarchy;
                            eSheet.Cells[rownumber, 3].Value = productname;
                            eSheet.Cells[rownumber, 4].Value = part_no;
                            eSheet.Cells[rownumber, 5].Value = mo_ta;
                            eSheet.Cells[rownumber, 6].Value = strminimumorder;
                            eSheet.Cells[rownumber, 7].Value = strtrong_so;
                            eSheet.Cells[rownumber, 8].Value = strkhoi_luong;
                            eSheet.Cells[rownumber, 9].Value = strdon_gia;
                            eSheet.Cells[rownumber, 10].Value = strgia_si;
                            eSheet.Cells[rownumber, 11].Value = xuat_xu;
                            eSheet.Cells[rownumber, 12].Value = thuong_hieu;
                            eSheet.Cells[rownumber, 13].Value = model;
                            eSheet.Cells[rownumber, 14].Value = tu_khoa;
                            eSheet.Cells[rownumber, 15].Value = trang_thai;
                            eSheet.Cells[rownumber, 16].Value = "Vui lòng nhập số.";
                            rownumber++;
                            error++;
                            continue;
                        }

                        if (khoi_luong <= 0)
                        {
                            eSheet.Cells[rownumber, 1].Value = masanpham;
                            eSheet.Cells[rownumber, 2].Value = hierarchy;
                            eSheet.Cells[rownumber, 3].Value = productname;
                            eSheet.Cells[rownumber, 4].Value = part_no;
                            eSheet.Cells[rownumber, 5].Value = mo_ta;
                            eSheet.Cells[rownumber, 6].Value = strminimumorder;
                            eSheet.Cells[rownumber, 7].Value = strtrong_so;
                            eSheet.Cells[rownumber, 8].Value = strkhoi_luong;
                            eSheet.Cells[rownumber, 9].Value = strdon_gia;
                            eSheet.Cells[rownumber, 10].Value = strgia_si;
                            eSheet.Cells[rownumber, 11].Value = xuat_xu;
                            eSheet.Cells[rownumber, 12].Value = thuong_hieu;
                            eSheet.Cells[rownumber, 13].Value = model;
                            eSheet.Cells[rownumber, 14].Value = tu_khoa;
                            eSheet.Cells[rownumber, 15].Value = trang_thai;
                            eSheet.Cells[rownumber, 16].Value = "Vui lòng khối lượng > 0.";
                            rownumber++;
                            error++;
                            continue;
                        }

                        //if (don_gia < 50000 || gia_si < 50000)
                        //{
                        //    eSheet.Cells[rownumber, 1].Value = hierarchy;
                        //    eSheet.Cells[rownumber, 2].Value = productname;
                        //    eSheet.Cells[rownumber, 3].Value = part_no;
                        //    eSheet.Cells[rownumber, 4].Value = strtrong_so;
                        //    eSheet.Cells[rownumber, 5].Value = strkhoi_luong;
                        //    eSheet.Cells[rownumber, 6].Value = strdon_gia;
                        //    eSheet.Cells[rownumber, 7].Value = strgia_si;
                        //    eSheet.Cells[rownumber, 8].Value = xuat_xu;
                        //    eSheet.Cells[rownumber, 9].Value = thuong_hieu;
                        //    eSheet.Cells[rownumber, 10].Value = model;
                        //    eSheet.Cells[rownumber, 11].Value = "Vui lòng đơn giá và giá sỉ > 50,000";
                        //    rownumber++;
                        //    error++;
                        //    continue;
                        //}

                        if (hierarchy.Split('-').Length > 0)
                        {
                            hierarchycode = hierarchy.Split('-')[1];
                            if (listHerarchy.Where(s => s.ma_phan_cap == hierarchycode).FirstOrDefault() == null)
                            {
                                eSheet.Cells[rownumber, 1].Value = masanpham;
                                eSheet.Cells[rownumber, 2].Value = hierarchy;
                                eSheet.Cells[rownumber, 3].Value = productname;
                                eSheet.Cells[rownumber, 4].Value = part_no;
                                eSheet.Cells[rownumber, 5].Value = mo_ta;
                                eSheet.Cells[rownumber, 6].Value = strminimumorder;
                                eSheet.Cells[rownumber, 7].Value = strtrong_so;
                                eSheet.Cells[rownumber, 8].Value = strkhoi_luong;
                                eSheet.Cells[rownumber, 9].Value = strdon_gia;
                                eSheet.Cells[rownumber, 10].Value = strgia_si;
                                eSheet.Cells[rownumber, 11].Value = xuat_xu;
                                eSheet.Cells[rownumber, 12].Value = thuong_hieu;
                                eSheet.Cells[rownumber, 13].Value = model;
                                eSheet.Cells[rownumber, 14].Value = tu_khoa;
                                eSheet.Cells[rownumber, 15].Value = trang_thai;
                                eSheet.Cells[rownumber, 16].Value = "Mã cây phân cấp không tồn tại";
                                rownumber++;
                                error++;
                                continue;
                            }
                            if (thuong_hieu.Split('-').Length > 0)
                            {
                                ma_thuong_hieu = thuong_hieu.Split('-')[1];
                                if (listBrand.Where(s => s.ma_thuong_hieu == ma_thuong_hieu).FirstOrDefault() == null)
                                {
                                    eSheet.Cells[rownumber, 1].Value = masanpham;
                                    eSheet.Cells[rownumber, 2].Value = hierarchy;
                                    eSheet.Cells[rownumber, 3].Value = productname;
                                    eSheet.Cells[rownumber, 4].Value = part_no;
                                    eSheet.Cells[rownumber, 5].Value = mo_ta;
                                    eSheet.Cells[rownumber, 6].Value = strminimumorder;
                                    eSheet.Cells[rownumber, 7].Value = strtrong_so;
                                    eSheet.Cells[rownumber, 8].Value = strkhoi_luong;
                                    eSheet.Cells[rownumber, 9].Value = strdon_gia;
                                    eSheet.Cells[rownumber, 10].Value = strgia_si;
                                    eSheet.Cells[rownumber, 11].Value = xuat_xu;
                                    eSheet.Cells[rownumber, 12].Value = thuong_hieu;
                                    eSheet.Cells[rownumber, 13].Value = model;
                                    eSheet.Cells[rownumber, 14].Value = tu_khoa;
                                    eSheet.Cells[rownumber, 15].Value = trang_thai;
                                    eSheet.Cells[rownumber, 16].Value = "Mã thương hiệu không tồn tại";
                                    rownumber++;
                                    error++;
                                    continue;
                                }
                            }
                            //var slug = Helpers.SqlHelper.convertToUnSign3(productname) + Helpers.SqlHelper.convertToUnSign3(part_no);
                            if (!string.IsNullOrEmpty(masanpham))
                            {
                                Merchant_Product product = new Merchant_Product();
                                product.ma_san_pham = masanpham;
                                product.ten_san_pham = productname.Replace("\n", " ").Replace("\r\n", " ").Trim();//productname.Replace(System.Environment.NewLine, " ");
                                product.ma_loai_san_pham = hierarchycode;
                                product.mo_ta = mo_ta;
                                product.model = model;
                                product.part_no = part_no;
                                product.minimum_order = minimum_order;
                                product.trong_so = trong_so;
                                product.khoi_luong = khoi_luong;
                                product.don_gia = don_gia;
                                product.gia_si = gia_si;
                                product.tag = product.slug = StringHelper.convertToUnSign3(product.ten_san_pham + " " + product.part_no);
                                product.xuat_xu = xuat_xu;
                                product.thuong_hieu = ma_thuong_hieu;
                                product.tu_khoa = tu_khoa;
                                product.ma_gian_hang = currentUser.ma_gian_hang;
                                product.trang_thai = trang_thai;
                                product.nguoi_tao = currentUser.name;
                                product.nguoi_cap_nhat = currentUser.name;
                                var objhierarchy = dbConn.SqlList<Merchant_Product_Hierarchy>("exec _p_Get_Tree_Hierarchy_By_IdLevel3 {0}".Params(hierarchycode)).FirstOrDefault();
                                string msg = new Merchant_Product_DAO().UpdateProduct(product, objhierarchy, new List<Merchant_Product_Image>(), new List<Merchant_Product_Property>(), AppConfigs.MCCConnectionString);
                                total++;
                            }
                            else
                            {
                                Merchant_Product product = new Merchant_Product();
                                product.ma_san_pham = masanpham;
                                product.ten_san_pham = productname.Replace("\n", " ").Replace("\r\n", " ").Trim();//productname.Replace(System.Environment.NewLine, " ");
                                product.ma_loai_san_pham = hierarchycode;
                                product.mo_ta = mo_ta;
                                product.model = model;
                                product.part_no = part_no;
                                product.minimum_order = minimum_order;
                                product.trong_so = trong_so;
                                product.khoi_luong = khoi_luong;
                                product.don_gia = don_gia;
                                product.gia_si = gia_si;
                                product.tag = product.slug = StringHelper.convertToUnSign3(product.ten_san_pham + " " + product.part_no);
                                product.xuat_xu = xuat_xu;
                                product.thuong_hieu = ma_thuong_hieu;
                                product.tu_khoa = tu_khoa;
                                product.ma_gian_hang = currentUser.ma_gian_hang;
                                product.trang_thai = trang_thai;
                                product.nguoi_tao = currentUser.name;
                                product.nguoi_cap_nhat = currentUser.name;

                                var objhierarchy = dbConn.SqlList<Merchant_Product_Hierarchy>("exec _p_Get_Tree_Hierarchy_By_IdLevel3 {0}".Params(hierarchycode)).FirstOrDefault();

                                string msg = new Merchant_Product_DAO().CreateProduct(product, objhierarchy, new List<Merchant_Product_Image>(), new List<Merchant_Product_Property>(), AppConfigs.MCCConnectionString);
                                total++;
                            }

                        }
                        else
                        {
                            eSheet.Cells[rownumber, 1].Value = masanpham;
                            eSheet.Cells[rownumber, 2].Value = hierarchy;
                            eSheet.Cells[rownumber, 3].Value = productname;
                            eSheet.Cells[rownumber, 4].Value = part_no;
                            eSheet.Cells[rownumber, 5].Value = mo_ta;
                            eSheet.Cells[rownumber, 6].Value = strminimumorder;
                            eSheet.Cells[rownumber, 7].Value = strtrong_so;
                            eSheet.Cells[rownumber, 8].Value = strkhoi_luong;
                            eSheet.Cells[rownumber, 9].Value = strdon_gia;
                            eSheet.Cells[rownumber, 10].Value = strgia_si;
                            eSheet.Cells[rownumber, 11].Value = xuat_xu;
                            eSheet.Cells[rownumber, 12].Value = thuong_hieu;
                            eSheet.Cells[rownumber, 13].Value = model;
                            eSheet.Cells[rownumber, 14].Value = tu_khoa;
                            eSheet.Cells[rownumber, 15].Value = trang_thai;
                            eSheet.Cells[rownumber, 16].Value = "Mã cây phân cấp không hợp lệ";
                            rownumber++;
                            error++;
                            continue;
                        }
                    }
                }
                _excelPkg.Save();
                return Json(new { success = true, total = total, totalError = error, link = linkerror, JsonRequestBehavior.AllowGet });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    message = ex.Message,
                    JsonRequestBehavior.AllowGet
                });
            }
        }
    }
}

