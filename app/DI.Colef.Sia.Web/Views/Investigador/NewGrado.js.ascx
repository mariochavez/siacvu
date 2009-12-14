<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% using (Html.BeginForm("AddGrado", "Investigador", FormMethod.Post, new { id = "gradoform" })) { %>
    <%=Html.Hidden("InvestigadorId", Model.Id) %>
    <% Html.RenderPartial("_NewGrado"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar grado", new { rel = "#gradoform", @class = "remote", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="grado">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#gradoForm').html(html);
$('#gradoNew').hide();
$('#gradoForm').show();

AutoComplete.manualSetup('GradoAcademicoInvestigador_InstitucionNombre');
DateTimePicker.setup();

var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";

$('#GradoAcademicoInvestigador_DocumentoProbatorio').uploadify({
            'uploader': '<%=ResolveUrl("~/Scripts/uploadify.swf") %>',
            'script': '<%=Url.Action("AddFile") %>',
            'cancelImg': '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>',
            'folder': '<%=Url.Action("AddFile") %>',
            'queueID': 'GradoAcademico_FileQueue',
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });