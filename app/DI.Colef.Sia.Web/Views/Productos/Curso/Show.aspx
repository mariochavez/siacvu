<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CursoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del curso como est&aacute; en el sistema.
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
                    <span class="valor"><%= Html.Encode(Model.Form.DepartamentoNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Sede</label>
                    <span class="valor"><%= Html.Encode(Model.Form.SedeNombre)%>&nbsp;</span>
                </p>
                        
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
                
                <% if (Model.Form.SubdisciplinaId != 0) { %>
            	    <% Html.RenderPartial("_ShowSubdisciplina", Model.Form.ShowFields); %>
                <% } %>
                
                <p>
                    <label>Obra publicada</label>
                    <span class="valor">
                        <%if(!String.IsNullOrEmpty(Model.Form.ComprobanteCursoNombre)) { %> 
                            <%=Html.ActionLink<ArchivoController>(x => x.Show(Model.Form.ComprobanteCursoId), Model.Form.ComprobanteCursoNombre, new { target = "_blank" })%> 
                        <% } else { %>
                            &nbsp;
                        <% } %>
                    </span><br />
                </p>
                
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