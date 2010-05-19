<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<HomeForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
		<p>Listado de productos registrados, pero que a&uacute;n se encuentran en proceso.</p>
	</div><!--end subcontenido-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <p>La bandeja muestra los productos agrupados por categor&iacute;a, productos que estan en proceso de verificaci&oacute;n y firma por parte de la DGAA.</p>
            <p>El bot&oacute;n de <b>Editar</b> a la derecha del producto, permite ver la informaci&oacute;n del mismo, adem&aacute;s de permitir el realizarle cambios.</p>
            <p>El bot&oacute;n de <b>Firmar</b> a la derecha del producto, debe ser utilizado cuando el producto ya contiene toda la informaci&oacute;n necesaria y por lo tanto est&aacute; listo para enviar a firma.</p>
            <p>El bot&oacute;n de <b>Editar</b> a la derecha del producto, muestra la informaci&oacute;n del producto de manera que solo se pueda consultar, pero no hacer cambios.</p>
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
        
        <h4>
            <a href="#prodacademica" class="collapsable <%=Html.CollapsePanelClass(Model.Form.ProduccionAcademica.Length) %>">
                <span class="ui-icon ui-icon-circle-arrow-s"></span>
                Producci&oacute;n acad&eacute;mica 
                <span><%=Html.Encode(Model.Form.ProduccionAcademica.Length)%> producto(s)</span></a>
        </h4>
        
        <span id="prodacademica">
            <% Html.RenderPartial("_Producto", Model.Form.ProduccionAcademica); %>
        </span>
        
        <h4>
            <a href="#proyectos" class="collapsable <%=Html.CollapsePanelClass(Model.Form.Proyectos.Length) %>">
                <span class="ui-icon ui-icon-circle-arrow-s"></span>
                Proyectos de investigaci&oacute;n
                <span><%=Html.Encode(Model.Form.Proyectos.Length)%> producto(s)</span></a>
        </h4>
        <span id="proyectos">
            <% Html.RenderPartial("_Producto", Model.Form.Proyectos); %>
        </span>
        
        <h4>
            <a href="#recursoshumanos" class="collapsable <%=Html.CollapsePanelClass(Model.Form.FormacionRecursosHumanos.Length) %> ">
                <span class="ui-icon ui-icon-circle-arrow-s"></span>
                Formaci&oacute;n de recursos humanos
                <span><%=Html.Encode(Model.Form.FormacionRecursosHumanos.Length)%> producto(s)</span></a>
        </h4>
        
        <span id="recursoshumanos">
            <% Html.RenderPartial("_Producto", Model.Form.FormacionRecursosHumanos); %>
        </span>
        
        <h4>
            <a href="#vinculacion" class="collapsable <%=Html.CollapsePanelClass(Model.Form.Vinculacion.Length) %>">
                <span class="ui-icon ui-icon-circle-arrow-s"></span>
                Actividades de vinculaci&oacute;n y difusi&oacute;n
                <span><%=Html.Encode(Model.Form.Vinculacion.Length)%> producto(s)</span></a>
        </h4>
        <span id="vinculacion">
            <% Html.RenderPartial("_Producto", Model.Form.Vinculacion); %>
        </span>
		
		<h4>
		    <a href="#eventos" class="collapsable <%=Html.CollapsePanelClass(Model.Form.Eventos.Length) %>">
		        <span class="ui-icon ui-icon-circle-arrow-s"></span>
		        Organizaci&oacute;n y participaci&oacute;n de eventos acad&eacute;micos
		        <span><%=Html.Encode(Model.Form.Eventos.Length)%> producto(s)</span></a>
		</h4>
		<span id="eventos">
            <% Html.RenderPartial("_Producto", Model.Form.Eventos); %>
        </span>
    
    </div><!--end lista-->
    
</div><!--end textos-->
					    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>    
</asp:Content>
