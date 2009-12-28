<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<HomeForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="subcontenido">
	    <h3>Panel de administraci&oacute;n</h3>
		<p>Para crear o modificar productos utilice el men&uacute; de la parte superior llamado <strong>Productos</strong>.</p>
		
		<!-- 	
		<div class="botonzon">
		    <span>
		        
		    </span>
		</div>
	    -->
	</div><!--end subcontenido-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>Pendiente.</p>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
				
    <% Html.RenderPartial("_Message"); %>
    
    <%if(User.IsInRole("DGAA")){ %>
        <div id="forma">
            <p>
                <label>Filtrar por investigador</label>
                <%=Html.DropDownList("Investigador", Model.Form.Investigadores.CreateSelectList<InvestigadorForm>("UsuarioId", "Nombre"),
                    "Seleccione ...", new { @class = "cascade", rel = Url.Action("FilterProductsByInvestigador", "Home") })%>
            </p>
            <p>
                <label>Filtrar por departamento</label>
                <%=Html.DropDownList("Departamento", Model.Form.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "cascade", rel = Url.Action("FilterProductsByDepartamento", "Home") })%>
            </p>
        </div>
    <% } %>
    
    <div id="lista">
        <h4>Producci&oacute;n acad&eacute;mica</h4>
        <% Html.RenderPartial("_ProduccionAcademica", Model.Form); %>
        
        <h4>Proyectos de investigaci&oacute;n</h4>
        <% Html.RenderPartial("_ProyectosInvestigacion", Model.Form); %>
        
        <h4>Formaci&oacute;n de recursos humanos</h4>
        <% Html.RenderPartial("_RecursosHumanos", Model.Form); %>
        
        <h4>Actividades de vinculaci&oacute;n y difusi&oacute;n</h4>
        <% Html.RenderPartial("_VinculacionDifusion", Model.Form); %>
    
    </div><!--end lista-->
    
</div><!--end textos-->
					    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>    
</asp:Content>
