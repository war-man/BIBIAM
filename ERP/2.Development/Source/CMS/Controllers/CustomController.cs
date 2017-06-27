﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.SqlServer;
using CMS.Models;
using Microsoft.Owin.Security;
using CMS.Helpers;
using System.Threading;
using System.Globalization;

namespace CMS.Controllers
{
    public class CustomController : BaseController
    {
        protected Users currentUser;
        protected AccessDetail accessDetail;
        protected bool isAdmin;
        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }
        //BaoVT add
        protected IEnumerable<Code_Master_Json> GetListCode_Master_Json(string Type)
        {
            string culture = Request.Cookies["_culture"] != null ? Request.Cookies["_culture"].Value : "vi";
            using (var db = OrmliteConnection.openConn())
            {
                return db.GetDictionary<string, string>("SELECT Value," + (culture == "vi" ? "Name_Vi" : "Name") + " FROM Code_Master WHERE Type = {0} Order By order_Num".Params(Type)).Select(s => new Code_Master_Json { Value = s.Key, Name = s.Value });
            }
        }   
        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (User.Identity.IsAuthenticated)
            {
                using (var dbConn = Helpers.OrmliteConnection.openConn())
                {
                    currentUser = dbConn.FirstOrDefault<Users>("name={0}", User.Identity.Name);
                    if (currentUser != null)
                    {
                        if (!currentUser.active)
                        {
                            AuthenticationManager.SignOut();
                        }

                        isAdmin = dbConn.Scalar<bool>("select top 1 1 from UserInGroup WHERE userId = " + currentUser.id + " and groupId = 1");

                        var controller = this.GetType().Name.Substring(0, this.GetType().Name.IndexOf("Controller"));
                        if (controller != "CustomData")
                        {
                            var listAccess = currentUser.listAccess.Where(s => s.controllerName == controller);
                            var access = new Dictionary<string, bool>();
                            if (listAccess.Count() > 0)
                            {
                                foreach (var item in listAccess.FirstOrDefault().access.Select(s => s.Key))
                                {
                                    access.Add(item, listAccess.Where(s => s.access.ContainsKey(item) && s.access[item] == true).Count() > 0 ? true : false);
                                }
                            }

                            accessDetail = currentUser.listAccess.Where(s => s.controllerName == controller).FirstOrDefault();
                            if (accessDetail != null)
                            {
                                accessDetail.access = access;
                            }

                        }


                        ViewData["menuView"] = currentUser.listAccess.Where(s => s.access != null && ((s.access.ContainsKey("all") && s.access["all"]) || (s.access.ContainsKey("view") && s.access["view"]))).Select(s => s.controllerName).ToList();
                        ViewBag.accessDetail = accessDetail;
                        string image = String.Empty;
                        //if (currentUser.imagesSize != null)
                        //{
                        //    image = currentUser.imagesSize.face;
                        //}
                        //else 
                        if (currentUser.gender == null || currentUser.gender == "unknown")
                        {
                            image = Url.Content("~/Content/images/unknown.png");
                        }
                        else
                        {
                            image = currentUser.gender == "male" ? Url.Content("~/Content/images/male.png") : Url.Content("~/Content/images/female.png");
                        }
                        ViewBag.userImage = image;
                        ViewData["userId"] = currentUser.id.ToString();
                        ViewBag.controllerName = controller;
                    }
                }
            }
        }
    }
}