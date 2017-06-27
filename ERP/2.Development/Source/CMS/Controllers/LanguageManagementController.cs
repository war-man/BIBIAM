﻿using CMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.SqlServer;
using Kendo.Mvc.UI;
using System.Data;
using CMS.Helpers;
using System.IO;
using OfficeOpenXml;
using CloudinaryDotNet;
using System.Configuration;
using Hangfire;
using CMS.Filters;

namespace CMS.Controllers
{
    [Authorize]
    [CustomActionFilter(permission = "all,view,update,create,delete")]
    public class LanguageManagementController : CustomController
    {
        //private readonly bool overwrite;
        //
        // GET: /LanguageManagement/
        public ActionResult Index()
        {
            //using (var dbConn = Helpers.OrmliteConnection.openConn())
            //{
            //    dbConn.DropTables(
            //        typeof(tw_GlobalLanguage)
            //        );
            //    dbConn.CreateTables(overwrite,
            //        typeof(tw_GlobalLanguage)
            //        );
            //}
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["view"]))
            {
                return View();
            }
            return RedirectToAction("NoAccess", "Error");
        }

        public ActionResult Read([DataSourceRequest]DataSourceRequest request)
        {
            using (IDbConnection dbConn = Helpers.OrmliteConnection.openConn())
            {
                var data = new DataSourceResult();
                data = KendoApplyFilter.KendoData<tw_GlobalLanguage>(request);
                return Json(data);
            }
        }
        public ActionResult deletelanguage(Int64 id)
        {
            try
            {
                using (var dbConn = Helpers.OrmliteConnection.openConn())
                {
                    dbConn.Delete<tw_GlobalLanguage>("id={0}".Params(id, currentUser.homePage));
                }
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false, error = e.Message });
            }
        }
        [HttpPost]
        public ActionResult CreateUpdate(tw_GlobalLanguage data, HttpPostedFileBase file)
        {
            try
            {
                using (var dbConn = Helpers.OrmliteConnection.openConn())
                { 
                    if (data.id > 0)
                    {
                        if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
                        {
                            if (data.isDefault)
                            {
                                var existL = dbConn.Select<tw_GlobalLanguage>("id<>{0}", data.id);
                                existL.ForEach(s => { s.isDefault = false; });
                                dbConn.UpdateAll(existL);
                            }

                            var exist = dbConn.SingleOrDefault<tw_GlobalLanguage>("id={0}", data.id);
                            data.imagesPublicId = exist.imagesPublicId;
                            //data.imagesSize = exist.imagesSize;
                            data.updatedAt = DateTime.Now;
                            data.updatedBy = currentUser.name;
                            if (file != null && file.ContentLength > 0)
                            {
                                string fileExtension = System.IO.Path.GetExtension(file.FileName).ToLower();
                                if (fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif" || fileExtension == ".jpg")
                                {
                                    //string publicId = "CRM/Localization/" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + "_" + file.FileName.Substring(0, file.FileName.Length - fileExtension.Length);
                                    //data.imagesPublicId = publicId;
                                    //var imagesSize = new Helpers.CloudinaryAPI().Upload(file, publicId);
                                    //data.imagesSize = imagesSize;
                                    data.imagesPublicId = new AzureHelper().UploadImageToAzure("LanguageManagement", file, currentUser.name);
                                }
                                else
                                {
                                    return Json(new { success = false, error = "Vui lòng chọn đúng file ảnh." });
                                }
                            }
                            dbConn.UpdateOnly(data,
                                    onlyFields: p =>
                                        new
                                        {
                                            p.code,
                                            p.name,
                                            p.isDefault,
                                            p.active,
                                            p.imagesPublicId,
                                            p.updatedAt,
                                            p.updatedBy
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
                            if (data.isDefault)
                            {
                                var exist = dbConn.Select<tw_GlobalLanguage>();
                                exist.ForEach(s => { s.isDefault = false; });
                                dbConn.UpdateAll(exist);
                            }
                            data.createdAt = DateTime.Now;
                            data.createdBy = currentUser.name;
                            dbConn.Insert(data);
                            int Id = (int)dbConn.GetLastInsertId();
                            data.id = Id;
                            if (file != null && file.ContentLength > 0)
                            {
                                string fileExtension = System.IO.Path.GetExtension(file.FileName).ToLower();
                                if (fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif" || fileExtension == ".jpg")
                                {
                                    data.imagesPublicId = new AzureHelper().UploadImageToAzure("LanguageManagement", file, currentUser.name);
                                    dbConn.Update(data);
                                }
                                else
                                {
                                    return Json(new { success = false, error = "Vui lòng chọn đúng file ảnh." });
                                }
                            }
                        
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
        public ActionResult Active(string data)
        {
            if (accessDetail != null && (accessDetail.access["all"] || accessDetail.access["update"]))
            {
                try
                {
                    string[] separators = { "," };
                    string[] ids = data.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                    if (ids.Length == 0)
                    {
                        return Json(new { success = false, message = "Chọn các ngôn ngữ cần kích hoạt!" });
                    }

                    using (var dbConn = CMS.Helpers.OrmliteConnection.openConn())
                    {
                        foreach (var id in ids)
                        {
                            var exists = dbConn.FirstOrDefault<tw_GlobalLanguage>("id={0}".Params(id));
                            if (exists.active != true)
                            {
                                dbConn.UpdateOnly(new tw_GlobalLanguage { active = exists.active = true ? true : false, updatedBy = currentUser.name, updatedAt = DateTime.Now }, onlyFields: p => new { p.active, p.updatedBy, p.updatedAt }, where: p => p.id == int.Parse(id));
                            }
                            else
                            {
                                dbConn.UpdateOnly(new tw_GlobalLanguage { active = exists.active = true ? false : true, updatedBy = currentUser.name, updatedAt = DateTime.Now }, onlyFields: p => new { p.active, p.updatedBy, p.updatedAt }, where: p => p.id == int.Parse(id));
                            }
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