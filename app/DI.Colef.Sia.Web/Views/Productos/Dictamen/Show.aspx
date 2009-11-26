<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<DictamenForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del dictamen como est&aacute; en el sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_ShowSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">

        <div id="forma">
            <div id="campos">
                <h4>Datos del investigador</h4>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                <h4>Datos del dictamen</h4>
                <p>
	                <label>Nombre del producto dictaminado</label>
	                <span class="valor"><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</span>
                </p>
                <p>
	                <label>Fecha de dictamen</label>
	                <span class="valor"><%= Html.Encode(Model.Form.FechaDictamen)%>&nbsp;</span>
	                </span><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
	                <label>Producto dictaminado</label>
	                <span class="valor"><%= Html.Encode(Model.Form.TipoDictamenNombre)%>&nbsp;</span>
                </p>
                <% if (Model.Form.TipoDictamenNombre.Contains("Artículo")){ %>
                    <% if(Model.Form.RevistaPublicacionTitulo != ""){ %>
                    	<% Html.RenderPartial("_ShowRevista", Model.Form.ShowFields); %>
                	<% } %>
                <% } %>
                <% if (Model.Form.TipoDictamenNombre.Contains("Capítulo") || Model.Form.TipoDictamenNombre.Contains("Libro")){ %>
                    <p>
	                    <label>Editorial</label>
	                    <span class="valor"><%= Html.Encode(Model.Form.EditorialNombre)%>&nbsp;</span>
                    </p>
                    <p>
	                    <label>Instituci&oacute;n de la editorial</label>
	                    <span class="valor"><%= Html.Encode(Model.Form.EditorialInstitucionNombre)%>&nbsp;</span>
                    </p>
                <% } %>
                <% if(Model.Form.TipoDictamenNombre.Contains("Proyecto")){ %>
                    <p>
	                    <label>Tipo de proyecto</label>
	                    <span class="valor"><%= Html.Encode(Model.Form.FondoConacytNombre)%>&nbsp;</span>
                    </p>
                <% } %>
                
                <p class="submit">
                    <%=Html.ActionLink<DictamenController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end campos-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>