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

            <% using (Html.BeginForm("Create", "Evento")) { %>
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <p>
                    <label>Nombre del evento</label>
	                <%=Html.TextBox("Nombre", Model.Form.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	                <span class="cvu"></span>
	                <%=Html.ValidationMessage("Nombre")%>
                </p>
                <p>
                    <label>Tipo de evento</label>
	                <%=Html.DropDownList("TipoEvento", Model.Form.TiposEventos.CreateSelectList<TipoEventoForm>("Id", "Nombre"),
                                "Seleccione ...", new { @class = "requerido" })%>
	                <%=Html.ValidationMessage("TipoEvento") %>
                </p>
                <p class="TipoEvento_field">
                    <label>Objetivo del evento</label>
	                <%=Html.TextArea("ObjetivoEvento", Model.Form.ObjetivoEvento, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
	                <%=Html.ValidationMessage("ObjetivoEvento")%>
                </p>                
                <p>
                    <label>Tipo de participaci&oacute;n</label>
                    <%=Html.DropDownList("TipoParticipacion", Model.Form.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
                                "Seleccione ...", new { @class = "requerido" })%>
                    <span class="cvu"></span>
                    <%=Html.ValidationMessage("TipoParticipacion")%>
                </p>
                
                <div class="TipoEvento_field">
                    <% Html.RenderPartial("_EditInstitucion", new InstitucionForm { Instituciones = Model.Form.InstitucionEventos, ModelId = Model.Form.Id } ); %>
                </div>
                
                <% Html.RenderPartial("_DatosEvento", Model.Form); %>
                
                <div id="TipoParticipacion_fields">
                    <p>
                        <label>T&iacute;tulo del trabajo</label>
	                    <%=Html.TextBox("TituloTrabajo", Model.Form.TituloTrabajo, new { @class = "input420-requerido", maxlength = 100 })%>
	                    <span class="cvu"></span>
	                    <%=Html.ValidationMessage("TituloTrabajo")%>
                    </p>
                    
                    <h4>Coautores<span class="cvu"></span></h4>
				    <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoEventos, ModelId = Model.Form.Id } ); %>
	                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoEventos, ModelId = Model.Form.Id } ); %>
	                <p>
	                    <label>Total de autores</label>
	                    <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
	                    <span class="cvu"></span>	          
	                </p>
                    <p>
	                    <label>Posici&oacute;n del autor</label>
	                    <span class="valor"><%=Html.Encode(Model.Form.PosicionAutor) %></span>
	                    <%=Html.Hidden("PosicionAutor", Model.Form.PosicionAutor) %>
	                    <span class="cvu"></span>
                    </p>
                </div>
                
				<% Html.RenderPartial("_DatosReferencia", Model.Form); %>
        				
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<EventoController>(x => x.Index(), "Regresar")%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        eventoSetup();
    });
</script>
</asp:Content>
