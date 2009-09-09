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
            <div class="elementodescripcion">
                <p>
	                <label>Nombre del producto dictaminado</label>
	                <%= Html.Encode(Model.Form.Nombre) %>
                </p>
                <p>
	                <label>Tipo de dictamen</label>
	                <%= Html.Encode(Model.Form.TipoDictamenNombre) == "" ? "<span>No hay tipo de dictamen registrado</span>" : Html.Encode(Model.Form.TipoDictamenNombre)%>
                </p>
                <p>
	                <label>Tipo de participaci&oacute;n</label>
	                <%= Html.Encode(Model.Form.TipoParticipacionNombre) == "" ? "<span>No hay tipo de participación registrada</span>" : Html.Encode(Model.Form.TipoParticipacionNombre)%>
                </p>
                <p>
	                <label>Instituci&oacute;n solicitante</label>
	                <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
	                <label>Periodo de referencia</label>
	                <%=Html.Encode(Model.Form.PeriodoReferenciaPeriodo)%>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<DictamenController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end elementodescripcion-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
