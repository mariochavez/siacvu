<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.ProductoShowTitle(TipoProductoEnum.Curso) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            <%=Html.ProductoShowMessage(TipoProductoEnum.Curso) %>
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
                <%--<h4>Datos del investigador</h4>
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
                        
                <h4>Datos del curso</h4>
                <p>
                    <label>Tipo de curso</label>
                    <span class="valor"><%= HumanizeHelper.TipoCurso(Model.Form.TipoCurso) %>&nbsp;</span>
                </p>
                
                <% if(Model.Form.TipoCurso == 1){ %>
                    <h4>Cursos en El Colef</h4>
                    <% Html.RenderPartial("_ShowCursoInvestigador", Model.Form); %>
                <% } %>
                
                <% if(Model.Form.TipoCurso == 2){ %>
                    <h4>Cursos en instituciones externas</h4>
                    <% Html.RenderPartial("_ShowCursoExterno", Model.Form); %>
                <% } %>
                <h4>&aacute;rea del conocimiento</h4>
               
            	<% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                
                <% Html.RenderPartial("_ShowArchivo", Model.Form); %>
                
                <p class="submit">
                    <%=Html.ActionLink<CursoController>(x => x.Index(), "Regresar") %>
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