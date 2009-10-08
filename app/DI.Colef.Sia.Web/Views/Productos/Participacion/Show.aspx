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
                    <label>Tipo de participaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.OtraParticipacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>T&iacute;tulo</label>
                    <strong><%= Html.Encode(Model.Form.Titulo)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Tipo de presentaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.TipoPresentacionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Autor</label>
                    <strong><%= Html.Encode(Model.Form.NombreAutor)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Instituci&oacute;n organizadora</label>
                    <strong><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Fecha de presentaci&oacute;n</label>
                    <strong><%= Html.Encode(Model.Form.FechaPresentacion)%>&nbsp;</strong><span>Formato (dd/mm/yyyy)</span>
                </p>
                <p>
                    <label>Periodo de referencia</label>
                    <strong><%= Html.Encode(Model.Form.PeriodoReferenciaPeriodo) %>&nbsp;</strong>
                </p>                
                <p>
                    <label>Proyecto</label>
                    <strong><%= Html.Encode(Model.Form.ProyectoNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Lugar</label>
                    <strong><%= Html.Encode(Model.Form.Lugar)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <strong><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</strong>
                </p>
                
                <p>
                    <label>Estado</label>
                    <strong><%= Html.Encode(Model.Form.EstadoPaisNombre)%>&nbsp;</strong>
                </p>
                <p>
                    <label>Ciudad</label>
                    <strong><%= Html.Encode(Model.Form.Ciudad)%>&nbsp;</strong>
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ParticipacionController>(x => x.Index(), "Regresar") %>
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
