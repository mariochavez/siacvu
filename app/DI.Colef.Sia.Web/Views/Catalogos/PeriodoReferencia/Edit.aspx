<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<PeriodoReferenciaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <% using (Html.BeginForm("Update", "PeriodoReferencia", new { Id = Model.Form.Id })) { %>
        <% Html.RenderPartial("_Form"); %>
    <% } %>
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
