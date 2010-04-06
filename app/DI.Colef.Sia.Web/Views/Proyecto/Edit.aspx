<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ProyectoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Para modificar el proyecto utilice los siguientes campos para realizar cambios dentro del sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <% if(User.IsInRole("Investigadores")){ %>
                <% if(Model.Form.FirmaAceptacion2 == 2){ %>
                    <h3>&Aacute;rea de validaci&oacute;n de producto</h3>
                    <p>Motivo del rechazo: <%=Html.Encode(Model.Form.FirmaDescripcion)%></p>
                <% } %>
            <% } %>
	        <% if(User.IsInRole("DGAA")){ %>
	            <h3>&Aacute;rea de validaci&oacute;n de producto</h3>
	            <% Html.RenderPartial("_CustomFirmaForm", new FirmaForm{Id = Model.Form.Id, IdName = "ProyectoId", Controller = "Proyecto", TipoProducto = 14}); %>
	        <% } %>
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">

        <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">
            <% using (Html.BeginForm("Update", "Proyecto", FormMethod.Post, new { @class = "remote" })){ %>
                <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Informaci&oacute;n general del proyecto</h4>
                <% Html.RenderPartial("_InformacionGeneral", Model.Form); %>
                
            <h4>
                <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.ParticipanteExternoProyectos.Length + Model.Form.ParticipanteInternoProyectos.Length) %>">
                    <span class="ui-icon ui-icon-circle-arrow-s"></span>Investigadores participantes
                    <span>
                        <%=Html.Encode(Model.Form.ParticipanteExternoProyectos.Length + Model.Form.ParticipanteInternoProyectos.Length)%>
                        coautor(es) </span><span class="cvu"></span></a>
            </h4>
            <span id="coautores_area">
                <% Html.RenderPartial("_EditResponsable", Model.Form); %>
                <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "ParticipanteSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.ParticipanteSeOrdenaAlfabeticamente, Rel = "NewParticipanteInternoLink, NewParticipanteExternoLink", SubFormName = "participante", UrlActionExterno = "NewParticipanteExterno", UrlActionInterno = "NewParticipanteInterno", Link1Id = "NewParticipanteInternoLink", Link2Id = "NewParticipanteExternoLink", InvestigadorType = "participantes" }); %>
                <% Html.RenderPartial("_EditParticipanteInterno", new ParticipanteForm { ParticipantesInternos = Model.Form.ParticipanteInternoProyectos, ModelId = Model.Form.Id, ParticipanteSeOrdenaAlfabeticamente = Model.Form.ParticipanteSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_EditParticipanteExterno", new ParticipanteForm { ParticipantesExternos = Model.Form.ParticipanteExternoProyectos, ModelId = Model.Form.Id, ParticipanteSeOrdenaAlfabeticamente = Model.Form.ParticipanteSeOrdenaAlfabeticamente }); %>
                <% Html.RenderPartial("_ParticipanteEmptyListMessage", new ParticipanteForm { ParticipantesExternos = Model.Form.ParticipanteExternoProyectos, ParticipantesInternos = Model.Form.ParticipanteInternoProyectos }); %>
                <% Html.RenderPartial("_AutorEntry", Model.Form); %>
            </span>
                
                <h4>Calendario del proyecto</h4>
                <% Html.RenderPartial("_CalendarioProyecto", Model.Form); %>

                <h4>Fuentes de financiamiento</h4>
                <% Html.RenderPartial("_FuenteFinanciamiento", Model.Form); %>
                
                <h4>Recursos financieros</h4>
                <% Html.RenderPartial("_EditRecursoFinanciero", Model.Form); %>
                <p>
                    <label></label>
                    Total pesos: <span id="totalpesos" class="valor"><%=Html.Encode(Math.Round(Model.Form.TotalPesos, 2)) %></span>
                    Total d&oacute;lares: <span id="totaldolares" class="valor"><%=Html.Encode(Math.Round(Model.Form.TotalDolares, 2)) %></span>
                </p>
                
                <h4>Tem&aacute;tica del proyecto</h4>
                <% Html.RenderPartial("_TematicaProyecto", Model.Form); %>
                
                <% Html.RenderPartial("_EditArchivo", Model.Form); %>

                <h4>Productos acad&eacute;micos contemplados</h4>
                <% Html.RenderPartial("_ProductoAcademicoContemplado", Model.Form); %>
                
                <h4>Participaci&oacute;n de estudiantes/becarios</h4>
                <% Html.RenderPartial("_ParticipacionEstudiante", Model.Form); %>
                <div id="ParticipaEstudiante_Fields">
                    <% Html.RenderPartial("_EditParticipaEstudiante", Model.Form); %>
                </div>
                
                <% if(Page.User.IsInRole("DGAA")){ %>
                    <% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Sectores = Model.Form.Sectores, Organizaciones = Model.Form.Organizaciones, Niveles = Model.Form.Niveles, IsShowForm = false }); %>
                    <% Html.RenderPartial("_ShowClase", new ShowFieldsForm { SectoresEconomicos = Model.Form.SectoresEconomicos, Ramas = Model.Form.Ramas, Clases = Model.Form.Clases, IsShowForm = false }); %>
                <% } %>
                
                <h4>Productos generados del proyecto</h4>
                <% Html.RenderPartial("_EditProductoGenerado", Model.Form); %>
                
                <% Html.RenderPartial("_ProgressBar"); %>
                
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<ProyectoController>(x => x.Index(), "Regresar", new { id = "regresar" })%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->

    <script type="text/javascript">
        $(document).ready(function() {
            setupDocument();
            proyectoSetup('<%=Html.Encode(Model.Form.UserRole) %>');
            setupOrden();

            var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
            var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
            var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
            var uploadImg = '<%=ResolveUrl("~/Content/Images/adjuntar.png") %>';
            var action = '<%=Url.Action("AddFile") %>';

            UploadMulti.setup('#uploadify', 'fileQueue', uploader, cancelImg, uploadImg, action, auth);
        });
    </script>
</asp:Content>
