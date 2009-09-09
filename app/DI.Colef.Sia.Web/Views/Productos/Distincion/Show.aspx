<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<DistincionForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la distinci&oacute;n como est&aacute; en el sistema.
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
                    <label>Tipo de distinci&oacute;n</label>
                    <%= Html.Encode(Model.Form.TipoDistincionNombre) == "" ? "<span>No hay tipo de distinción registrada</span>" : Html.Encode(Model.Form.TipoDistincionNombre)%>
                </p>
                <p>
                    <label>Descripci&oacute;n</label>
                    <%= Html.Encode(Model.Form.Descripcion) == "" ? "<span>No hay descripción registrada</span>" : Html.Encode(Model.Form.Descripcion)%>
                </p>
                <p>
                    <label>Fecha de otorgamiento</label>
                    <%= Html.Encode(Model.Form.FechaOtorgamiento) == "" ? "<span>No hay fecha de otorgamiento registrada</span>" : Html.Encode(Model.Form.FechaOtorgamiento)%>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <%= Html.Encode(Model.Form.AmbitoNombre) == "" ? "<span>No hay ámbito registrado</span>" : Html.Encode(Model.Form.AmbitoNombre)%>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                <p>
                    <label>Estado del pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.EstadoPaisNombre) == "" ? "<span>No hay estado del país registrado</span>" : Html.Encode(Model.Form.EstadoPaisNombre)%>
                </p>
                <p>
                    <label>Ciudad</label>
                    <%= Html.Encode(Model.Form.Ciudad) == "" ? "<span>No hay ciudad registrada</span>" : Html.Encode(Model.Form.Ciudad)%>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <%=Html.Encode(Model.Form.PeriodoReferenciaPeriodo)%>
                 </p>
                
                <p class="submit">
                    <%=Html.ActionLink<DistincionController>(x => x.Index(), "Regresar") %>
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
