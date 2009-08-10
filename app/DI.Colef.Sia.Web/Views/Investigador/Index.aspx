<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
    <% Html.RenderPartial("_Message"); %>
    <br />
    <div id="datalist">
        <div> 
            <div class="floatr btn_container">
                <span class="inputSearchField">
                    <% using (Html.BeginForm("Search", null, FormMethod.Post, new { Id = "SearchForm"} )) { %>
                        <%=Html.Hidden("SearchId") %>
                    <% } %>
                    <%=Html.TextBox("SearchValue", "Buscar ...",
                        new { @class = "clearField inputSearch" })%>
                </span>
		        <span class="btn btn_small_white">
			        <%=Html.ActionLink("Editar", "Search", null, new { @class = "autoComplete", rel = "#SearchValue" })%>
		        </span>
	        </div>
            <div class="floatl btn_container">
		        <span class="btn btn_medium_brown">
			        <%=Html.ActionLink<InvestigadorController>(x => x.New(), "+ Crear Investigador") %>
		        </span>
	        </div>
	    </div>  
        <br />
        <div class="table_title">Investigadores</div>
        <table>
             <% if(Model.List == null || Model.List.Length == 0) { %>
                <tr>
                    <td>No hay investigadores definidos</td>
                </tr>
            <% } else { %>
                <% foreach (var investigador in Model.List) { %>
                    <tr class="highlight">
				        <td class="button" width="46">
					        <div class="floatr btn_container">
						        <span class="btn btn_small_white">
							        <%=Html.ActionLink<InvestigadorController>(x => x.Edit(investigador.Id), "Editar")%>
						        </span>
					        </div>
				        </td>                
                        <td class="single" width="75%">
                            <%=Html.Encode(investigador.Nombre)%>
                            <div class="meta_info">Modificado el <%=Html.Encode(investigador.Modificacion)%></div>
                        </td>
                        <td id="accion_<%=Html.Encode(investigador.Id) %>" class="button" width="140">
                            <div class="floatr btn_container">
                            <% if (investigador.Activo) { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Desactivar", "Deactivate", new { id = investigador.Id }, new { @class = "remote put" })%>
                                </span>
                            <% } else { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Activar", "Activate", new { id = investigador.Id }, new { @class = "remote put" })%>
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
