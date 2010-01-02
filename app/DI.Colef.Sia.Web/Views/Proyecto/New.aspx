<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ProyectoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Favor de llenar los siguientes campos para dar de alta un nuevo proyecto dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_NewSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">

        <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">
            <% using (Html.BeginForm("Create", "Proyecto", FormMethod.Post, new { @class = "remote" })){ %>
                <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Informaci&oacute;n general del proyecto</h4>
                <% Html.RenderPartial("_InformacionGeneral", Model.Form); %>
                
                <h4>Investigadores participantes</h4>
                <% Html.RenderPartial("_EditResponsable", Model.Form); %>
                <% Html.RenderPartial("_AddParticipantesButtons", new ParticipanteForm { ModelId = Model.Form.Id, ParticipanteSeOrdenaAlfabeticamente = Model.Form.ParticipanteSeOrdenaAlfabeticamente}); %>
                <% Html.RenderPartial("_EditParticipanteInterno", new ParticipanteForm { ParticipantesInternos = Model.Form.ParticipanteInternoProyectos, ModelId = Model.Form.Id, ParticipanteSeOrdenaAlfabeticamente = Model.Form.ParticipanteSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_EditParticipanteExterno", new ParticipanteForm { ParticipantesExternos = Model.Form.ParticipanteExternoProyectos, ModelId = Model.Form.Id, ParticipanteSeOrdenaAlfabeticamente = Model.Form.ParticipanteSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ParticipanteEmptyListMessage", new ParticipanteForm { ParticipantesExternos = Model.Form.ParticipanteExternoProyectos, ParticipantesInternos = Model.Form.ParticipanteInternoProyectos }); %>
	            <p>
	                <label>Due&ntilde;o del producto</label>
	                <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre1) %></span>
	            </p>
                <p id="ParticipanteSeOrdenaAlfabeticamente_field">
	                <label>Posici&oacute;n del participante</label>
                    <%=Html.TextBox("PosicionParticipante", Model.Form.PosicionParticipante, new { @class = "input100-requerido", maxlength = 2 })%>
                    <span class="cvu"></span>
	                <%=Html.ValidationMessage("PosicionParticipante")%>
                </p>
	            <p>
	                <label>Total de investigadores</label>
	                <span id="totalparticipantes" class="valor"><%=Html.Encode(Model.Form.TotalParticipantes) %></span>
	                <span class="cvu"></span>
	            </p>
                
                <h4>Calendario del proyecto</h4>
                <% Html.RenderPartial("_CalendarioProyecto", Model.Form); %>
                <p>
                    <label>Documento probatorio</label>
                    <span id="span_comprobantecalendario_documento" class="valor">&nbsp;</span><br />
                </p>
                <div style="padding: 0 0 10px 20px">
                    <input type="file" name="ComprobanteCalendarioProyecto_DocumentoProbatorio" id="ComprobanteCalendarioProyecto_DocumentoProbatorio" class="fileUpload"/>
                </div>
                <div id="ComprobanteCalendario_FileQueue" style="display:none;" rel="#span_comprobantecalendario_documento"></div>
                
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
                <p>
                    <label>Obra publicada</label>
                    <span id="span_comprobantetematica_documento" class="valor">&nbsp;</span><br />
                </p>
                <div style="padding: 0 0 10px 20px">
                    <input type="file" name="ComprobanteTematicaProyecto_DocumentoProbatorio" id="ComprobanteTematicaProyecto_DocumentoProbatorio" class="fileUpload"/>
                </div>
                <div id="ComprobanteTematica_FileQueue" style="display:none;" rel="#span_comprobantetematica_documento"></div>
                
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
            setupOrdenParticipantes();

            var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
            var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
            var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
            var action = '<%=Url.Action("AddFile") %>';

            UploadFile.setup('#ComprobanteCalendarioProyecto_DocumentoProbatorio', 'ComprobanteCalendario_FileQueue',
            uploader, cancelImg, action, auth);
            UploadFile.setup('#ComprobanteTematicaProyecto_DocumentoProbatorio', 'ComprobanteTematica_FileQueue',
            uploader, cancelImg, action, auth);
        });
    </script>

</asp:Content>
