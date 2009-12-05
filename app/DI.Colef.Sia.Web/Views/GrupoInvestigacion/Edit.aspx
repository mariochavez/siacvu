<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<GrupoInvestigacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Para modificar el grupo de investigaci&oacute;n utilice los siguientes campos para realizar cambios dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
        <% Html.RenderPartial("_Message"); %>
        <div id="forma">
            <% using (Html.BeginForm("Update", "GrupoInvestigacion")) { %>
            <%=Html.AntiForgeryToken() %>
            <%=Html.Hidden("Id", Model.Form.Id) %>
            
            <p>
                <label>Nombre del grupo de investigaci&oacute;n</label>
                <%=Html.TextBox("NombreGrupoInvestigacion", Model.Form.NombreGrupoInvestigacion, new { @class = "input420-bold-requerido", maxlength = 100 })%>
                <span class="cvu"></span>
                <%=Html.ValidationMessage("NombreGrupoInvestigacion")%>
            </p>
            <p>
                <label>Fecha de creaci&oacute;n</label>
                <%=Html.TextBox("FechaCreacion", Model.Form.FechaCreacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
                <span class="cvu"></span>
                <span>(Formato dd/mm/yyyy)</span>
                <%=Html.ValidationMessage("FechaCreacion")%>
            </p>
            
            <% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Sectores = Model.Form.Sectores, Organizaciones = Model.Form.Organizaciones, Niveles = Model.Form.Niveles, IsShowForm = false }); %>
            
            <h4>&nbsp;</h4>
            <p>
                <label>¿Es Usted el l&iacute;der?</label>
                <%= Html.CheckBox("Lider", Model.Form.Lider) %>
                <span class="cvu"></span>
                <%=Html.ValidationMessage("Lider")%>
            </p>
            <p id="siLider">
                <label>Nombre</label>
                <span class="valor"><%= Html.Encode(Model.Form.Nombre)%></span>
                <span class="cvu"></span>
            </p>
            
            <h4>Miembros</h4>
            <% Html.RenderPartial("_EditMiembroExterno", Model.Form); %>
            
            <h4>&nbsp;</h4>
            <% Html.RenderPartial("_EstructuraFuncional", Model.Form); %>
            
            <p class="submit">
                <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<GrupoInvestigacionController>(x => x.Index(), "Regresar") %>
            </p>
            <% } %>
        </div><!--end forma-->
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        grupoInvestigacionSetup();
    });
</script>
</asp:Content>