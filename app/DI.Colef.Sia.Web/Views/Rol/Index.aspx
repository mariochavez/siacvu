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
                    <td id="accion_<%=Html.Encode(rol.Id) %>">
                        <% if (rol.Activo) { %>
                            <%=Html.ActionLink("Desactivar", "Deactivate", new { id = rol.Id }, new { @class = "remote put" })%>
                        <% } else { %>
                            <%=Html.ActionLink("Activar", "Activate", new { id = rol.Id }, new { @class = "remote put" })%>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        <% } %>
    </table>
    
<script type="text/javascript">
    $(document).ready(function() {
        setUpRemoteLinks();
    });
</script>
</asp:Content>
