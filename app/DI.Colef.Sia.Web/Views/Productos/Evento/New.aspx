<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<EventoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoNewTitle(TipoProductoEnum.Evento) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>
            <%=Html.ProductoNewMessage(TipoProductoEnum.Evento) %>
		</p>
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
                <%=Html.Hidden("Contexto", "evento", new { url = Url.Action("Glosario") })%>
                
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
                                       
                    <h4>
                        <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoEventos.Length + Model.Form.CoautorInternoEventos.Length) %>">
                          <span class="ui-icon ui-icon-circle-arrow-s"></span>
                          Autor(es) del trabajo presentado
                          <span><%=Html.Encode(Model.Form.CoautorExternoEventos.Length + Model.Form.CoautorInternoEventos.Length)%> autor(es)
                          </span>
                          <span class="cvu"></span>
                        </a>
                    </h4>
                    <span id="coautores_area">
                    <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "CoautorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewCoautorInternoLink, NewCoautorExternoLink", SubFormName = "coautor", UrlActionExterno = "NewCoautorExterno", UrlActionInterno = "NewCoautorInterno", Link1Id = "NewCoautorInternoLink", Link2Id = "NewCoautorExternoLink" }); %>
				    <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoEventos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	                <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, CoautoresInternos = Model.Form.CoautorInternoEventos }); %>
	                
                    <% Html.RenderPartial("_AutorEntry", Model.Form); %>
                    </span>
                </div>

                <% Html.RenderPartial("_DatosFinal", Model.Form); %>
                
                <% Html.RenderPartial("_EditArchivo", Model.Form); %>

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