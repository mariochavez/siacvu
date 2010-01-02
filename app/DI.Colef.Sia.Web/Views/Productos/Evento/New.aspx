<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EventoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Favor de llenar los siguientes campos para dar de alta un evento dentro del sistema.</p>
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

            <% using (Html.BeginForm("Create", "Evento", FormMethod.Post, new { @class = "remote" })){ %>
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Eventos acad&eacute;micos</h4>
                    <% Html.RenderPartial("_DatosEvento", Model.Form); %>
                
                <div id="OrganizadorColef_fields">
                    <h4>Tem&aacute;tica y financiamiento del evento</h4>
                        <% Html.RenderPartial("_TematicaFinanciamiento", Model.Form); %>
                    
                    <h4>Sesion(es) del evento estrat&eacute;gico</h4>
                        <% Html.RenderPartial("_EditSesion", Model.Form); %>
                </div>
                
                <div id="TipoParticipacion_fields">
                    <p>
                        <label>T&iacute;tulo del trabajo</label>
	                    <%=Html.TextBox("TituloTrabajo", Model.Form.TituloTrabajo, new { @class = "input420-requerido", maxlength = 100 })%>
	                    <span class="cvu"></span>
	                    <%=Html.ValidationMessage("TituloTrabajo")%>
                    </p>
                    
                    <h4>Coautores del evento<span class="cvu"></span></h4>
                    <% Html.RenderPartial("_AddCoautoresButtons", new CoautorForm { ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente}); %>
				    <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoEventos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	                <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, CoautoresInternos = Model.Form.CoautorInternoEventos }); %>
	                <p>
	                    <label>Due&ntilde;o del producto</label>
	                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre1) %></span>
	                </p>
                    <p id="CoautorSeOrdenaAlfabeticamente_field">
	                    <label>Posici&oacute;n del coautor</label>
                        <%=Html.TextBox("PosicionCoautor", Model.Form.PosicionCoautor, new { @class = "input100-requerido", maxlength = 2 })%>
                        <span class="cvu"></span>
	                    <%=Html.ValidationMessage("PosicionCoautor")%>
                    </p>
	                <p>
	                    <label>Total de investigadores</label>
	                    <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
	                    <span class="cvu"></span>
	                </p>
                </div>
                
                <p>
                    <label>Obra publicada</label>
                    <span id="span_comprobante_documento" class="valor">&nbsp;</span><br />
                </p>
                <div style="padding: 0 0 10px 20px">
                    <input type="file" name="ComprobanteEvento_DocumentoProbatorio" id="ComprobanteEvento_DocumentoProbatorio" class="fileUpload"/>
                </div>
                <div id="Comprobante_FileQueue" style="display:none;" rel="#span_comprobante_documento"></div>
				
				<% Html.RenderPartial("_ProgressBar"); %>
        				
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<EventoController>(x => x.Index(), "Regresar", new { id = "regresar" })%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        eventoSetup();
        setupOrdenCoautores();
        
        var auth = "<% = Request.Cookies[FormsAuthentication.FormsCookieName]==null ? string.Empty : Request.Cookies[FormsAuthentication.FormsCookieName].Value %>";
        var uploader = '<%=ResolveUrl("~/Scripts/uploadify.swf") %>';
        var cancelImg = '<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>';
        var action = '<%=Url.Action("AddFile") %>';

        UploadFile.setup('#ComprobanteEvento_DocumentoProbatorio', 'Comprobante_FileQueue',
            uploader, cancelImg, action, auth);
    });
</script>
</asp:Content>