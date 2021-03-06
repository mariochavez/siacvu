﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<OrganoExternoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.OrganoExterno) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.OrganoExterno) %>
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
               <%-- <h4>Datos del investigador</h4>
	            <p>
                    <label>Nombre</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InvestigadorNombre)%>&nbsp;</span>
                </p>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>--%>
                
                <h4>Datos del &Oacute;rgano Externo</h4>
                <p>
                    <label>Nombre del &oacute;rgano</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Siglas</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Siglas)%>&nbsp;</span>
                </p>
                <p>
                    <label>Describa su participaci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Participacion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de inicio</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaInicial)%>&nbsp;</span>
                    <span>Formato (dd/mm/aaaa)</span>
                </p>                
                <p>
                    <label>Fecha de conclusi&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaFinal)%>&nbsp;</span>
                    <span>Formato (dd/mm/aaaa)</span>
                </p>
                <p>
                    <label>Ciudad/Estado</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Ciudad) %>&nbsp;</span>
                </p>
                <p>
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PaisNombre) %>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de &oacute;rgano</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoOrganoNombre)%>&nbsp;</span>
                </p>                
                <p>
                    <label>Sector</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SectorNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</span>
                </p>
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                
                <p class="submit">
                    <%=Html.ActionLink<OrganoExternoController>(x => x.Index(), "Regresar") %>
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