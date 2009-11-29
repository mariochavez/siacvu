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

                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre de la publicaci&oacute;n</label>
                    <%=Html.TextBox("Titulo", Model.Form.Titulo, new { @class = "input420-bold-requerido", maxlength = 200 })%>    
                    <span class="cvu"></span>
                    <%=Html.ValidationMessage("Titulo")%>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <%=Html.DropDownList("TipoReporte", Model.Form.TiposReportes.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
                    <%=Html.ValidationMessage("TipoReporte") %>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica</label>
                    <%=Html.TextBox("AreaTematicaNombre", Model.Form.AreaTematicaNombre,
                            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "AreaTematica"), maxlength = 100 })%>
                    <%=Html.Hidden("AreaTematicaId", Model.Form.AreaTematicaId, new { rel = "#AreaTematicaNombre" })%>
                    <%=Html.ValidationMessage("AreaTematicaNombre")%>
                </p>
                <p>
	                <label>Palabra clave 1</label>
	                <%=Html.TextBox("PalabraClave1", Model.Form.PalabraClave1, new { @class = "input250", maxlength = 50 })%>
	                <span class="cvu"></span>
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <%=Html.TextBox("PalabraClave2", Model.Form.PalabraClave2, new { @class = "input250", maxlength = 50 })%>
	                <span class="cvu"></span>
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <%=Html.TextBox("PalabraClave3", Model.Form.PalabraClave3, new { @class = "input250", maxlength = 50 })%>
	                <span class="cvu"></span>
                </p>

                <h4>Coautores de la publicaci&oacute;n</h4>
			    <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoReportes, ModelId = Model.Form.Id } ); %>
                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoReportes, ModelId = Model.Form.Id } ); %>
                <p>
                    <label>Total de autores</label>
                    <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>	          
                    <span class="cvu"></span>
                </p>

                <% Html.RenderPartial("_DatosReporte", Model.Form); %>
                
                <h4 class="ReporteTecnico">Contenido del reporte t&eacute;cnico</h4>
                <h4 class="DocumentoTrabajo">Contenido del documento de trabajo</h4>
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
