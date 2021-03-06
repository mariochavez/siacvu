﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ResenaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Resena) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Resena) %>
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
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %>&nbsp;</span>
                </p>
	            <p>
                    <label>Departamento</label>
                    <span class="valor"><%=Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%=Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>--%>
                
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>T&iacute;tulo de la colaboraci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.NombreProducto)%>&nbsp;</span>
                </p>
                 <p>
                    <label>Nombre del(la) Autor(a)</label>
                    <span class="valor"><%=Html.Encode(Model.Form.NombreAutor)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <span class="valor"><%=HumanizeHelper.TipoResena(Model.Form.TipoResena)%>&nbsp;</span>
                </p>
                                
                <h4>
                    <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.CoautorExternoResenas.Length + Model.Form.CoautorInternoResenas.Length) %>">
                        <span class="ui-icon ui-icon-circle-arrow-s"></span>
                        Coautor(es) <!-- de <span id="coautores" class="titulovalor">--<=Model.Form.TipoResena == 1 ? "la Nota cr&iacute;tica" : "la Rese&ntilde;a bibligr&aacute;fica" ></span>-->
                        <span>
                            <%=Html.Encode(Model.Form.CoautorExternoResenas.Length + Model.Form.CoautorInternoResenas.Length)%> coautor(es) 
                        </span>
                        <span class="cvu"></span>
                    </a>
                </h4>
                <span id="coautores_area">
				<% Html.RenderPartial("_ShowCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoResenas, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_ShowCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoResenas, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoResenas, CoautoresInternos = Model.Form.CoautorInternoResenas }); %>
                <p>
                    <label>Investigador(a)</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InvestigadorNombre) %></span>
					<label class="right">Posici&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PosicionCoautor)%>&nbsp;</span>
                </p>
                </span>
                
                <% Html.RenderPartial("_ShowEstadoProducto", Model.Form.ShowFields); %>
                
                <% if (Model.Form.TipoResena == 2){ %>
                    <h4>Referencia de la obra rese&ntilde;ada</h4>
                    <% Html.RenderPartial("_ShowObraResenada", Model.Form); %>
                <% } %>
                <h4>Datos de la revista</h4>
                <% Html.RenderPartial("_ShowRevista", Model.Form.ShowFields); %>
                
                <% if (Model.Form.EstadoProducto == 3){ %> 
                    <p>
                        <label>Volumen</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Volumen)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>N&uacute;mero</label>
                        <span class="valor"><%= Html.Encode(Model.Form.Numero)%>&nbsp;</span>
                    </p>
                    <p>
                        <label>De la p&aacute;gina</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaginaInicial)%>&nbsp;</span> 
                    </p>
                    <p>    
                        <label>A la p&aacute;gina</label>
                        <span class="valor"><%= Html.Encode(Model.Form.PaginaFinal)%>&nbsp;</span> 
                    </p>
                <% } %>
                 
                <p>    
                    <label>Pa&iacute;s</label>
                    <span class="valor"><%= Html.Encode(Model.Form.PaisNombre)%>&nbsp;</span> 
                </p>

                <h4>&aacute;rea del conocimiento</h4>
                <h5>El Colef</h5>
                <p>
                    <label>L&iacute;nea tem&aacute;tica institucional</label>
                        <span class="valor">
                            <%= Html.Encode(Model.Form.AreaTematica.LineaTematicaNombre) %>&nbsp;
                        </span>
                </p>
                <p>
                    <label>&Aacute;rea tem&aacute;tica institucional</label>
                        <span class="valor">
                            <%= Html.Encode(Model.Form.AreaTematica.Nombre) %>&nbsp;
                        </span>
                </p>
               
                <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                <% Html.RenderPartial("_ShowPalabrasClave", Model.Form.ShowFields); %>
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                <p class="submit">
                    <%=Html.ActionLink<ResenaController>(x => x.Index(), "Regresar") %>
                </p>
            </div><!--end campos-->
        </div><!--end forma-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>