<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionForm>>" %>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la particiopaci&oacute;n como est&aacute; en el sistema.
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
                    <label>Tipo de participaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.OtraParticipacionNombre) == "" ? "<span>No hay tipo de participación registrada</span>" : Html.Encode(Model.Form.OtraParticipacionNombre)%>
                </p>
                <p>
                    <label>T&iacute;tulo</label>
                    <%= Html.Encode(Model.Form.Titulo)%>
                </p>
                <p>
                    <label>Tipo de presentaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.TipoPresentacionNombre) == "" ? "<span>No hay tipo de presentación registrada</span>" : Html.Encode(Model.Form.TipoPresentacionNombre)%>
                </p>
                <p>
                    <label>Autor</label>
                    <%= Html.Encode(Model.Form.Autor) == "" ? "<span>No tiene autor registrado</span>" : Html.Encode(Model.Form.Autor)%>
                </p>
                <p>
                    <label>Instituci&oacute;n organizadora</label>
                    <%= Html.Encode(Model.Form.InstitucionNombre) == "" ? "<span>No hay institución organizadora registrada</span>" : Html.Encode(Model.Form.InstitucionNombre)%>
                </p>
                <p>
                    <label>Fecha de presentaci&oacute;n</label>
                    <%= Html.Encode(Model.Form.FechaPresentacion) == "" ? "<span>No hay fecha de presentación registrada</span>" : Html.Encode(Model.Form.FechaPresentacion)%>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>
                </p>                
                <p>
                    <label>Proyecto</label>
                    <%= Html.Encode(Model.Form.ProyectoNombre) == "" ? "<span>No hay proyecto registrado</span>" : Html.Encode(Model.Form.ProyectoNombre) %>
                </p>
                <p>
                    <label>Lugar</label>
                    <%= Html.Encode(Model.Form.Lugar) == "" ? "<span>No hay lugar registrado</span>" : Html.Encode(Model.Form.Lugar)%>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <%= Html.Encode(Model.Form.PaisNombre) == "" ? "<span>No hay país registrado</span>" : Html.Encode(Model.Form.PaisNombre)%>
                </p>
                
                <p>
                    <label>Estado</label>
                    <%= Html.Encode(Model.Form.EstadoPaisNombre) == "" ? "<span>No hay estado registrado</span>" : Html.Encode(Model.Form.EstadoPaisNombre)%>
                </p>
                <p>
                    <label>Ciudad</label>
                    <%= Html.Encode(Model.Form.Ciudad) == "" ? "<span>No hay ciudad registrada</span>" : Html.Encode(Model.Form.Ciudad)%>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ParticipacionController>(x => x.Index(), "Regresar") %>
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
