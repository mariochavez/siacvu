<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ApoyoConacytForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
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
            Aqu&iacute; se muestra la informaci&oacute;n detallada del apoyo de CONACYT como est&aacute; en el sistema.
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
                    <label>No. de apoyo</label>
                    <%= Html.Encode(Model.Form.NoApoyo) == "" ? "<span>No hay número de apoyo registrado</span>" : Html.Encode(Model.Form.NoApoyo)%>
                </p>
                <p>
                    <label>Tipo de apoyo</label>
                    <%= Html.Encode(Model.Form.TipoApoyoNombre) == "" ? "<span>No hay tipo de apoyo registrado</span>" : Html.Encode(Model.Form.TipoApoyoNombre)%>
                </p>
                <p>
                    <label>Subprograma de CONACYT</label>
                    <%= Html.Encode(Model.Form.SubprogramaConacytNombre) == "" ? "<span>No hay subprograma de CONACYT registrado</span>" : Html.Encode(Model.Form.SubprogramaConacytNombre)%>
                </p>
                <p>
                    <label>Fecha inicial</label>
                    <%= Html.Encode(Model.Form.FechaInicial) == "" ? "<span>No hay fecha inicial registrada</span>" : Html.Encode(Model.Form.FechaInicial)%>
                </p>
                <p>
                    <label>Fecha final</label>
                    <%= Html.Encode(Model.Form.FechaFinal) == "" ? "<span>No hay fecha final registrada</span>" : Html.Encode(Model.Form.FechaFinal)%>
                </p>                
                <p>
	                <label>Palabra clave 1</label>
	                <%= Html.Encode(Model.Form.PalabraClave1) == "" ? "<span>No hay palabra clave 1 registrada</span>" : Html.Encode(Model.Form.PalabraClave1)%>    
                </p>
                <p>
	                <label>Palabra clave 2</label>
	                <%= Html.Encode(Model.Form.PalabraClave2) == "" ? "<span>No hay palabra clave 2 registrada</span>" : Html.Encode(Model.Form.PalabraClave2)%>    
                </p>
                <p>
	                <label>Palabra clave 3</label>
                    <%= Html.Encode(Model.Form.PalabraClave3) == "" ? "<span>No hay palabra clave 3 registrada</span>" : Html.Encode(Model.Form.PalabraClave3)%>    
                </p>
                
                <p class="submit">
                    <%=Html.ActionLink<ApoyoConacytController>(x => x.Index(), "Regresar") %>
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
