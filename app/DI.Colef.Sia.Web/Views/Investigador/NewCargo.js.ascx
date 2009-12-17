<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddCargo", "Investigador", FormMethod.Post, new { id = "cargoform", style = "margin: 0px;" })) { %>
    <%=Html.Hidden("InvestigadorId", Model.Id) %>
    <% Html.RenderPartial("_NewCargo"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Cargo", new { rel = "#cargoform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="cargo">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#cargoForm').html(html);
$('#cargoNew').hide();
$('#cargoForm').show();
DateTimePicker.setup();
Cascade.setup();

var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
var action = '<%=Url.Action("AddFile") %>';

UploadFile.setup('#CargoInvestigador_DocumentoProbatorio', 'Cargo_FileQueue',
            uploader, cancelImg, action, auth);