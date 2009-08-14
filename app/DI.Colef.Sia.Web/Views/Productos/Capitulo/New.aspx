<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<CapituloForm>>" %>

<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>
<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %></h2>
</asp:Content>
<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder"
    runat="server">
    <div id="introduccion">
        <p>
            Favor de llenar los siguientes campos para dar de alta un nuevo capitulo dentro
            del sistema.
        </p>
    </div>
    <!--end introduccion-->
</asp:Content>
<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder"
    runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>
                Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_NewSidebar"); %>
        </div>
        <!--end asistente-->
    </div>
    <!--end barra-->
</asp:Content>
<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="textos">
    <div id="forma">
        <% Html.RenderPartial("_Message"); %>
        <br />
        <% using (Html.BeginForm("Create", "Capitulo"))
           { %>
        <%=Html.AntiForgeryToken() %>
        <%=Html.Hidden("Id", Model.Form.Id) %>        
        
        <% Html.RenderPartial("_DatosCapitulo", Model.Form); %>
        <p>
        <h4>Coautores Internos</h4>
        <% Html.RenderPartial("_EditCoautorInterno", Model.Form); %>
        </p>
        <p>
        <h4>Coautores Externos</h4>
        <% Html.RenderPartial("_EditCoautorExterno", Model.Form); %>
        </p>
        <h4>Referencia Bibliografica</h4>
        <% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
        <p>
        <h4>Responsables Internos del libro</h4>
        <% Html.RenderPartial("_EditResponsableInterno", Model.Form); %>
        </p>
        <p>
        <h4>Responsables Externos del libro</h4>
        <% Html.RenderPartial("_EditResponsableExterno", Model.Form); %>
        </p>        
        
        <% Html.RenderPartial("_ResponsablesLibro", Model.Form); %>        
        
        <h4>Opcionales</h4>
        <% Html.RenderPartial("_DatosOpcionales", Model.Form); %>
        
        <p class="submit">
            <%=Html.SubmitButton("Guardar", "Guardar Cambios") %> &oacute; <%=Html.ActionLink<CapituloController>(x => x.Index(), "Regresar") %>
        </p>
        <% } %>
    </div>
    <!--end forma-->
</div>
<!--end textos-->

<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>

</asp:Content>
