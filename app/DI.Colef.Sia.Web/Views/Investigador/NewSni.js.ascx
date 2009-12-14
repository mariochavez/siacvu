<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddSni", "Investigador", FormMethod.Post, new { id = "sniform", style = "margin: 0px;" })) { %>
    <%=Html.Hidden("InvestigadorId", Model.Id) %>
    <% Html.RenderPartial("_NewSni"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar sni", new { rel = "#sniform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="sni">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#sniForm').html(html);
$('#sniNew').hide();
$('#sniForm').show();
DateTimePicker.setup();

investigadorSetup();

var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
var action = '<%=Url.Action("AddFile") %>';

UploadFile.setup('#SniInvestigador_DocumentoProbatorio', 'Sni_FileQueue',
            uploader, cancelImg, action, auth);