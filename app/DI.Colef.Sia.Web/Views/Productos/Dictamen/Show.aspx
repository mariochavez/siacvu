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
                    <strong><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Sede</label>
                    <strong><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Tipo de dictamen</label>
	                <strong><%= Html.Encode(Model.Form.TipoDictamenNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Nombre de la revista</label>
	                <strong><%= Html.Encode(Model.Form.RevistaPublicacionTitulo)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Instituci&oacute;n de la revista</label>
	                <strong><%= Html.Encode(Model.Form.RevistaPublicacionInstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Editorial</label>
	                <strong><%= Html.Encode(Model.Form.EditorialNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Instituci&oacute;n de la editorial</label>
	                <strong><%= Html.Encode(Model.Form.EditorialInstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
	                <label>Tipo de proyecto</label>
	                <strong><%= Html.Encode(Model.Form.FondoConacytNombre)%>&nbsp;</strong>
                </p>
                
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
