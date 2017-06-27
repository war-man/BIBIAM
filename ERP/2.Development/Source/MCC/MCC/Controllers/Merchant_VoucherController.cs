﻿using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MCC.Models;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using MCC.Helpers;
using System.Data;
using System.IO;
using OfficeOpenXml;
using System.Collections;
using System.Data.OleDb;
using System.Dynamic;
using System.Text.RegularExpressions;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Threading.Tasks;
using BIBIAM.Core.Entities;
using BIBIAM.Core.Data.DataObject;
using BIBIAM.Core.Data;
using BIBIAM.Core;

namespace MCC.Controllers
{
    public class Merchant_VoucherController : CustomController
    {
        public ActionResult Index()
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                {
                    ViewBag.isAdmin = isAdmin;
                    ViewBag.ma_gian_hang = currentUser.ma_gian_hang;
                    return View();
                }
            }
            else
            {
                return RedirectToAction("NoAccessRights", "Error");
            }
        }

        public ActionResult Read([DataSourceRequest]DataSourceRequest request)
        {
            using (IDbConnection dbConn = Helpers.OrmliteConnection.openConn())
            {
                var data = new DataSourceResult();
                if (isAdmin == true)
                {
                    data = KendoApplyFilter.KendoData<Merchant_Voucher>(request);
                }
                else
                {
                    data = KendoApplyFilter.KendoData<Merchant_Voucher>(request, " ma_gian_hang ={0} ".Params(currentUser.ma_gian_hang));
                }
                return Json(data);
            }
        }

        public ActionResult Delete(string data)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["delete"]))
            {

                string[] separators = { "," };
                string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                if (ids.Length == 0)
                {
                    return Json(new { success = false, message = "Chọn các Thẻ cần xóa!" });
                }
                string st = new Merchant_Voucher_DAO().Delete(ids, AppConfigs.MCCConnectionString);
                if (st == "true")
                    return Json(new { success = true, message = "Thành công!" });
                else
                    ModelState.AddModelError("", st);
            }
            return RedirectToAction("NoAccess", "Error");
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateUpdate(Merchant_Voucher data, HttpPostedFileBase file, List<Merchant_Image_Info> listimage)
        {
            try
            {
                using (var dbConn = Helpers.OrmliteConnection.openConn())
                {
                    var checkUpd = dbConn.SingleOrDefault<Merchant_Voucher>("ma_khuyen_mai={0} and id = {1}", data.ma_khuyen_mai,data.id);
                    var checkIns = dbConn.SingleOrDefault<Merchant_Voucher>("ma_khuyen_mai={0}", data.ma_khuyen_mai);
                    if (checkUpd == null)
                        if (checkIns != null)
                            return Json(new { success = false, error = "Mã thẻ đã tồn tại!" });
                    //return Json(new { success = false, message = "Vui lòng chọn hình ảnh sản phẩm", JsonRequestBehavior.AllowGet });

                    if (listimage != null)
                    {
                        foreach (var item in listimage)
                        {
                            data.url = item.duong_dan_day_du;
                            data.ma_anh_goc = item.ma_anh_goc;
                        }
                    }

                    if (file != null)
                    {
                        data.url = new Helpers.ProcessImage().UploadImageToFolder(AllConstant.FoldderName_Merchant_Voucher, file, currentUser.ma_gian_hang, currentUser.name);
                        data.ma_anh_goc = currentUser.name + "_" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                    }

                    if (data.id > 0)
                    {
                        if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
                        {
                            var exist = dbConn.SingleOrDefault<Merchant_Voucher>("id={0}", data.id);
                            if (data.url == null)
                            {
                                exist.url = exist.url;
                                data.ma_anh_goc = exist.ma_anh_goc;
                            }
                            data.ngay_cap_nhat = DateTime.Now;
                            data.nguoi_cap_nhat = currentUser.name;

                            dbConn.UpdateOnly(data,
                                    onlyFields: p =>
                                        new
                                        {
                                            p.ma_khuyen_mai,
                                            p.ten_khuyen_mai,
                                            p.loai_khuyen_mai, 
                                            p.url,
                                            p.ma_anh_goc,
                                            p.gia_tri,
                                            p.dieu_kien,
                                            p.gia_ban,
                                            p.so_luong,
                                            p.ngay_bat_dau,
                                            p.ngay_ket_thuc,
                                            p.mieu_ta,
                                            p.trang_thai,
                                            p.ngay_cap_nhat,
                                            p.nguoi_cap_nhat
                                        },
                                where: p => p.id == data.id);
                        }
                        else
                        {
                            return Json(new { success = false, error = "Don't have permission to update" });
                        }
                    }
                    else
                    {
                        if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["create"]))
                        {
                            data.ma_gian_hang = currentUser.ma_gian_hang;
                            data.ngay_tao = DateTime.Now;
                            data.nguoi_tao = currentUser.name;
                            data.ngay_cap_nhat= DateTime.Parse("01/01/1900");
                            dbConn.Insert(data);
                            int Id = (int)dbConn.GetLastInsertId();
                            data.id = Id;
                        }
                        else
                        {
                            return Json(new { success = false, error = "Don't have permission to create" });
                        }
                    }
                }
                return Json(new { success = true, data = data });
            }
            catch (Exception e)
            {
                return Json(new { success = false, error = e.Message });
            }
        }

        public ActionResult GetHierarchy(string text)
        {
            using (var dbConn = MCC.Helpers.OrmliteConnection.openConn())
            {
                var data = dbConn.Select<Hierarchy>("ten_phan_cap like N'%" + text + "%'").OrderBy(s => s.id);
                return Json(data, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult ActiveVoucher(string data)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                try
                {
                    string[] separators = { "," };
                    string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                    if (ids.Length == 0)
                    {
                        return Json(new { success = false, message = "Chọn các Voucher cần kích hoạt/Hủy kích hoạt!" });
                    }

                    using (var dbConn = MCC.Helpers.OrmliteConnection.openConn(AppConfigs.MCCConnectionString))
                    {
                        foreach (var id in ids)
                        {
                            var exists = dbConn.FirstOrDefault<Merchant_Voucher>("id={0}".Params(id));
                            dbConn.UpdateOnly(new Merchant_Voucher { trang_thai = exists.trang_thai == "DANG_SU_DUNG" ? "KHONG_SU_DUNG" : "DANG_SU_DUNG", nguoi_cap_nhat = currentUser.name, ngay_cap_nhat = DateTime.Now }, onlyFields: p => new { p.trang_thai, p.nguoi_cap_nhat, p.ngay_cap_nhat }, where: p => p.id == int.Parse(id));
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
    }
}