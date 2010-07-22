<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<GrupoInvestigacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2> <%=Html.ProductoEditTitle(TipoProductoEnum.GrupoInvestigacion) %></h2>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p> <%=Html.ProductoEditMessage(TipoProductoEnum.GrupoInvestigacion) %></p>
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
            <%=Html.Hidden("Contexto", "grupoInvestigacion", new { url = Url.Action("Glosario")}) %>
            
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
                <span>(Formato dd/mm/aaaa)</span>
                <%=Html.ValidationMessage("FechaCreacion")%>
            </p>
            
            <% Html.RenderPartial("_Show2doNivel", new ShowFieldsForm { Sectores = Model.Form.Sectores, Organizaciones = Model.Form.Organizaciones, Niveles = Model.Form.Niveles, IsShowForm = false }); %>
            
            <h4>&nbsp;</h4>
            <p>
                <label>¿Es Usted el l&iacute;der?</label>
                <%= Html.CheckBox("Lider", Model.Form.Lider) %>
                <span class="cvu"></span>
                <br /><label></label><span>(Marque en caso positivo)</span>
            </p>
            <p id="siLider">
                <label>Nombre</label>
                <span class="valor"><%= Html.Encode(Model.Form.InvestigadorNombre)%></span>
                <span class="cvu"></span>
            </p>
            <p>
                <label>Nombre del lider</label>
                <%= Html.TextBox("NombreLider", Model.Form.NombreLider, new { @class = "input420", maxlength = 60} ) %>
            </p>            
            <h4>
                <a href="#coautores_area" class="collapsable <%=Html.CollapsePanelClass(Model.Form.MiembroExternoGrupoInvestigaciones.Length + Model.Form.MiembroInternoGrupoInvestigaciones.Length) %>">
                    <span class="ui-icon ui-icon-circle-arrow-s"></span>
                    Miembro(s) del <span id="coautores" class="titulovalor">Grupo de Investigaci&oacute;n</span>
                    <span>
                        <%=Html.Encode(Model.Form.MiembroExternoGrupoInvestigaciones.Length + Model.Form.MiembroInternoGrupoInvestigaciones.Length)%>
                        miembro(s) </span><span class="cvu"></span></a>
            </h4>
           <span id="coautores_area">
                <% Html.RenderPartial("_AddButtons", new ShowFieldsForm { ModelId = Model.Form.Id, CheckboxName = "CoautorSeOrdenaAlfabeticamente", CheckboxValue = Model.Form.CoautorSeOrdenaAlfabeticamente, Rel = "NewCoautorInternoLink, NewCoautorExternoLink", SubFormName = "coautor", UrlActionExterno = "NewCoautorExterno", UrlActionInterno = "NewCoautorInterno", Link1Id = "NewCoautorInternoLink", Link2Id = "NewCoautorExternoLink" }); %>
				<% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.MiembroInternoGrupoInvestigaciones, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.MiembroExternoGrupoInvestigaciones, ModelId = Model.Form.Id, CoautorSeOrdenaAlfabeticamente = Model.Form.CoautorSeOrdenaAlfabeticamente }); %>
	            <% Html.RenderPartial("_CoautorEmptyListMessage", new CoautorForm { CoautoresExternos = Model.Form.MiembroExternoGrupoInvestigaciones, CoautoresInternos = Model.Form.MiembroInternoGrupoInvestigaciones }); %>
	            
				<% Html.RenderPartial("_AutorEntry", Model.Form); %>
           </span>
            
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