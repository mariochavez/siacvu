<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<FormaParticipacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <div id="message" class="<% if(TempData["message"] != null) { %>message<% } else if(TempData["error"] != null) { %>errormessage<% } %>"><%=Html.Encode(TempData["message"])%></div>
    <br />
    <div id="datalist">   
        <div class="btn_container">
		    <span class="btn btn_medium_brown">
			    <%=Html.ActionLink<FormaParticipacionController>(x => x.New(), "+ Crear Forma de Participacion") %>
		    </span>
	    </div>
        <br />
        <div class="table_title">Formas de Participacion</div>
        <table>
             <% if(Model.List == null || Model.List.Length == 0) { %>
                <tr>
                    <td>No hay Formas de Participacion definidas</td>
                </tr>
            <% } else { %>
                <% foreach (var formaParticipacion in Model.List) { %>
                    <tr class="highlight">
				        <td class="button" width="46">
					        <div class="floatr btn_container">
						        <span class="btn btn_small_white">
							        <%=Html.ActionLink<FormaParticipacionController>(x => x.Edit(formaParticipacion.Id), "Editar") %>
						        </span>
					        </div>
				        </td>                
                        <td class="single" width="70%">
                            <%=Html.Encode(formaParticipacion.Nombre) %>
                            <div class="meta_info">Modificado el <%=Html.Encode(formaParticipacion.Modificacion) %></div>
                        </td>
                        <td id="accion_<%=Html.Encode(formaParticipacion.Id) %>" class="button" width="140">
                            <div class="floatr btn_container">
                            <% if (formaParticipacion.Activo) { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Desactivar", "Deactivate", new { id = formaParticipacion.Id }, new { @class = "remote put" })%>
                                </span>
                            <% } else { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Activar", "Activate", new { id = formaParticipacion.Id }, new { @class = "remote put" })%>
                                </span>
                            <% } %>
                            </div>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </table>
    </div>    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
