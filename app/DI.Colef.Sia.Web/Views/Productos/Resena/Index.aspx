<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ResenaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <div id="datalist">   
        <div class="btn_container">
		    <span class="btn btn_medium_brown">
			    <%=Html.ActionLink<ResenaController>(x => x.New(), "+ Crear Reseña") %>
		    </span>
	    </div>
        <br />
        <div class="table_title">Reseñas</div>
        <table>
             <% if(Model.List == null || Model.List.Length == 0) { %>
                <tr>
                    <td>No hay reseñas definidas</td>
                </tr>
            <% } else { %>
                <% foreach (var reseña in Model.List) { %>
                    <tr class="highlight">
				        <td class="button" width="46">
					        <div class="floatr btn_container">
						        <span class="btn btn_small_white">
							        <%=Html.ActionLink<ResenaController>(x => x.Edit(reseña.Id), "Editar") %>
						        </span>
					        </div>
				        </td>                
                        <td class="single" width="70%">
                            <%=Html.Encode(reseña.NombreRevista) %>
                            <div class="meta_info">Modificado el <%=Html.Encode(reseña.Modificacion) %></div>
                        </td>
                        <td id="accion_<%=Html.Encode(reseña.Id) %>" class="button" width="140">
                            <div class="floatr btn_container">
                            <% if (reseña.Activo) { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Desactivar", "Deactivate", new { id = reseña.Id }, new { @class = "remote put" })%>
                                </span>
                            <% } else { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Activar", "Activate", new { id = reseña.Id }, new { @class = "remote put" })%>
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
