<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ReporteForm>>" %>
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
		<p>Para modificar el reporte t&eacute;cnico utilice los siguientes campos para realizar cambios dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
    
	    <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">

            <% using (Html.BeginForm("Update", "Reporte")) { %>
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Datos del investigador</h4>
	            <p>
                    <label>Departamento</label>
                    <%= Html.Encode(Model.Form.DepartamentoNombre)%>
                </p>
                <p>
                    <label>Sede</label>
                    <%= Html.Encode(Model.Form.SedeNombre)%>
                </p>
                
                <h4>Datos del reporte t&eacute;cnico</h4>                
                <p>
                    <label>Nombre del reporte</label>
                    <%=Html.TextArea("Titulo", Model.Form.Titulo, 3, 35, new { @class = "input420-bold-requerido", maxlength = 200 })%>    
                    <span class="cvu"></span>
                    <%=Html.ValidationMessage("Titulo")%>
                </p>
                <p>
                    <label>Tipo de reporte</label>
                    <%=Html.DropDownList("TipoReporte", Model.Form.TiposReportes.CreateSelectList<TipoReporteForm>("Id", "Nombre"),
                                "Seleccione ...", new { @class = "requerido" })%>
                    <%=Html.ValidationMessage("TipoReporte") %>
                </p>

                <h4>Coautores<span class="cvu"></span></h4>
			    <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoReportes, ModelId = Model.Form.Id } ); %>
                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoReportes, ModelId = Model.Form.Id } ); %>
                <p>
                    <label>Autores</label>
                    <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
                    <span class="cvu"></span>
                </p>

                <% Html.RenderPartial("_DatosReporte", Model.Form); %>
                
                <h4 class="ReporteTecnico">Tem&aacute;tica del reporte t&eacute;cnico</h4>
                <h4 class="CuadernoTrabajo">Referencia bibliogr&aacute;fica</h4>                
				<% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
        		
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<ReporteController>(x => x.Index(), "Regresar")%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        reporteSetup();
    });
</script>
</asp:Content>
