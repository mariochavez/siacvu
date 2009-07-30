using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public enum Title
    {
        New,
        Edit,
        Index,
        Show
    }

    public class BaseController<TModel, TForm> : Controller where TModel : Entity
    {
        protected RedirectToRouteResult RedirectToIndex(string message)
        {
            SetMessage(string.Format("El {0} {1}", GetObjectName(false), message));
            return RedirectToAction("Index");
        }

        protected ViewResult ViewEdit()
        {
            return View("Edit");
        }

        protected ViewResult ViewNew()
        {
            return View("New");
        }

        protected bool IsValidateModel(TModel model, TForm form, Title title)
        {
            ModelState.AddModelErrors(model.ValidationResults());
            if (!ModelState.IsValid)
            {
                var data = CreateViewDataWithTitle(title); 
                data.Form = form;
                SetError(string.Format("Se ha generado un error al actualizar el {0}, por favor corrija los siguientes errores.\n{1}",
                    GetObjectName(false),
                    ModelState.ContainsKey("Entity") ? ModelState["Entity"].Errors[0].ErrorMessage : String.Empty));

                ViewData.Model = data;
                return false;
            }

            return true;
        }

        protected string GetObjectName(bool pluralize)
        {
            var objectName = typeof (TModel).Name;

            if (pluralize)
            {
                if (objectName.EndsWith("l"))
                    objectName += "es";
                else if (objectName.EndsWith("s"))
                    objectName += "es";
                else if (objectName.EndsWith("r"))
                    objectName += "es";
                else if (objectName.EndsWith("n"))
                    objectName += "es";
                else if (objectName.EndsWith("d"))
                    objectName += "es";
                else
                    objectName += "s";
            }
            return objectName;
        }

        protected GenericViewData<TForm> CreateViewDataWithTitle(Title title)
        {
            string message = String.Empty;

            switch (title)
            {
                case Title.Index:
                    message = String.Format("Administracion de {0}", GetObjectName(true));
                    break;

                case Title.New:
                    message = String.Format("Crear nuevo {0}", GetObjectName(false));
                    break;

                case Title.Edit:
                    message = String.Format("Modificacion de {0}", GetObjectName(false));
                    break;

                case Title.Show:
                    message = String.Format("Informacion de {0}", GetObjectName(false));
                    break;
            }

            return new GenericViewData<TForm> { Title = message };
        }

        protected void SetMessage(string message)
        {
            TempData["message"] = message;
        }

        protected void SetError(string message)
        {
            ViewData["error"] = message;
        }

        protected ContentResult Rjs(string viewName, object model)
        {
            var output = this.RenderPartialToString(viewName, model);
            output = output.Replace("\n", " ");
            output = output.Replace("\r", " ");

            output = "try { " + output + " } catch(e) { alert(e); }";
            return Content(output);
        }

        protected ContentResult Rjs(string viewName)
        {
            return Rjs(viewName, null);
        }

        protected ContentResult Rjs(object model)
        {
            var viewName = ControllerContext.RouteData.Values["action"].ToString();
            return Rjs(viewName, model);
        }
    }
}
