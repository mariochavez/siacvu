<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<TipoParticipanteForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <div id="message" class="<% if(TempData["message"] != null) { %>message<% } else if(TempData["error"] != null) { %>errormessage<% } %>"><%=Html.Encode(TempData["message"])%></div>
    <br />
    <div id="datalist">   
        <div>
            <div class="floatr btn_container">
                <% Html.RenderPartial("_Search"); %>
	        </div>
            <div class="btn_container">
		        <span class="btn btn_medium_brown">
			        <%=Html.ActionLink<TipoParticipanteController>(x => x.New(), "+ Crear Tipo Participante") %>
		        </span>
	        </div>
	    </div>
        <br />
        <div class="table_title">Participantes</div>
        <table>
             <% if(Model.List == null || Model.List.Length == 0) { %>
                <tr>
                    <td>No hay Participantes definidos</td>
                </tr>
            <% } else { %>
                <% foreach (var tipoParticipante in Model.List) { %>
                    <tr class="highlight">
				        <td class="button" width="46">
					        <div class="floatr btn_container">
						        <span class="btn btn_small_white">
							        <%=Html.ActionLink<TipoParticipanteController>(x => x.Edit(tipoParticipante.Id), "Editar") %>
						        </span>
					        </div>
				        </td>                
                        <td class="single" width="70%">
                            <%=Html.Encode(tipoParticipante.Nombre) %>
                            <div class="meta_info">Modificado el <%=Html.Encode(tipoParticipante.Modificacion) %></div>
                        </td>
                        <td id="accion_<%=Html.Encode(tipoParticipante.Id) %>" class="button" width="140">
                            <div class="floatr btn_container">
                            <% if (tipoParticipante.Activo) { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Desactivar", "Deactivate", new { id = tipoParticipante.Id }, new { @class = "remote put" })%>
                                </span>
                            <% } else { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Activar", "Activate", new { id = tipoParticipante.Id }, new { @class = "remote put" })%>
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
