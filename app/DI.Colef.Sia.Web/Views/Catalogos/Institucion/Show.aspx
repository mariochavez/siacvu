<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InstitucionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la instituci&oacute;n como est&aacute; en el sistema.
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
                <h4>Datos de la instituci&oacute;n</h4>
                <p>
                    <label>Nombre de la instituci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Agrupar instituci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AgrupaInstitucion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Siglas de la instituci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Siglas)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Sede)%>&nbsp;</span>
                </p>
                <p>
                    <label>P&aacute;gina WEB</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PaginaWeb)%>&nbsp;</span>
                </p>
                <p>
                    <label>E-mail</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Email)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tel&eacute;fono y/o Fax</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Telefono)%>&nbsp;</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de instituci&oacute;n</label>
                    <span class="valor"><%= HumanizeHelper.TipoInstitucion(Model.Form.TipoInstitucion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Estado</label>
                    <span class="valor"><%=Html.Encode(Model.Form.EstadoPaisNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Ciudad</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Ciudad)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;mbito de la instituci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sector de la instituci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.SectorNombre)%>&nbsp;</span>
                </p>
                <p class="submit">
                    <%= Html.ActionLink<InstitucionController>(x => x.Index(), "Regresar") %>
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