<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<RolForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    
    <table>
        <tr>
            <th>Rol</th>
            <th>Acciones</th>
        </tr>
        <% if(Model.List == null || Model.List.Length == 0) { %>
            <tr>
                <td colspan="2">No hay roles definidos</td>
            </tr>
        <% } else { %>
            <% foreach (var rol in Model.List) { %>
                <tr>
                    <td><%=Html.Encode(rol.Nombre) %></td>
                    <td>
                        <% if (rol.Activo) { %>
                            <%=Html.ActionLink<RolController>(c => c.Deactivate(), "Desactivar", new { Id = rol.Id })%>
                        <% } else { %>
                            <%=Html.ActionLink<RolController>(c => c.Activate(), "Activar", new { Id = rol.Id })%>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        <% } %>
    </table>
</asp:Content>
