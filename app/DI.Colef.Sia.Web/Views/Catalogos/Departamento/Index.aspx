<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<DepartamentoForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    
    <table>
		<tr>
				<th>Nombre</th>
				<th>Acciones</th>
        </tr>
        
        <% if(Model.List == null || Model.List.Length == 0) { %>
            <tr>
                <td colspan="2">No hay departamentos definidos</td>
            </tr>
        <% } else { %>
            <% foreach (var departamento in Model.List) { %>
                <tr>
						<td><%= departamento.Nombre %></td>
			                    <td id="accion_<%= Html.Encode(departamento.Id) %>">
                        <% if (departamento.Activo) { %>
                            <%=Html.ActionLink("Desactivar", "Deactivate", new { id  = departamento.Id }, new { @class = "remote put" })%>
                        <% } else { %>
                            <%=Html.ActionLink("Activar", "Activate", new{ id = departamento.Id}, new { @class = "remote put" })%>
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
