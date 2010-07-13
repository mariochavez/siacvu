<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<DistincionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Distincion) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Distincion) %>
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
                </p>
                
                <h4>Datos de la distinci&oacute;n</h4>
                <p>
                    <label>Nombre de la distinci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Titulo)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de distinci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.TipoDistincionNombre)%>&nbsp;</span>
                </p>
                 <p>
                    <label>Otorgante</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Otorgante)%>&nbsp;</span>
                </p>
                <p>
                    <label>Descripci&oacute;n de la distinci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.Descripcion)%>&nbsp;</span>
                </p>
                <p>
                    <label>Fecha de otorgamiento</label>
                    <span class="valor"><%= Html.Encode(Model.Form.FechaOtorgamiento)%>&nbsp;</span>
                    <span>Formato (dd/mm/aaaa)</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <span class="valor"><%= Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;mbito</label>
                    <span class="valor"><%= Html.Encode(Model.Form.AmbitoNombre)%>&nbsp;</span>
                </p>
                <% if(Model.Form.AmbitoNombre == "Binacional" || Model.Form.AmbitoNombre == "Internacional"){ %>
                    <p>
                        <label>Pa&iacute;s</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span>
                    </p>
                <% } %>
                <% if(Model.Form.AmbitoNombre.Contains("Estatal")){ %>
                    <p>
                        <label>Estado del pa&iacute;s</label>
                        <span class="valor"><%= Html.Encode(Model.Form.EstadoPaisNombre)%>&nbsp;</span>
                    </p>
                <% } %>
                <% if(Model.Form.AmbitoNombre.Contains("Local")){ %>
                    <p>
                        <label>Estado del pa&iacute;s</label>
                        <span class="valor"><%= Html.Encode(Model.Form.EstadoPaisNombre)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>Municipio</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Municipio)%>&nbsp;</span>
                    </p>
                <% } %>
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                
                <p class="submit">
                    <%=Html.ActionLink<DistincionController>(x => x.Index(), "Regresar") %>
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