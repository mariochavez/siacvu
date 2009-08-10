<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<NivelEstudioForm>>" %>
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
			    <%=Html.ActionLink<NivelEstudioController>(x => x.New(), "+ Crear Nivel de Estudio") %>
		    </span>
	    </div>
        <br />
        <div class="table_title">Nivel de Estudios</div>
        <table>
             <% if(Model.List == null || Model.List.Length == 0) { %>
                <tr>
                    <td>No hay niveles de estudio definidos</td>
                </tr>
            <% } else { %>
                <% foreach (var nivelEstudio in Model.List) { %>
                    <tr class="highlight">
				        <td class="button" width="46">
					        <div class="floatr btn_container">
						        <span class="btn btn_small_white">
							        <%=Html.ActionLink<NivelEstudioController>(x => x.Edit(nivelEstudio.Id), "Editar") %>
						        </span>
					        </div>
				        </td>                
                        <td class="single" width="70%">
                            <%=Html.Encode(nivelEstudio.Nombre) %>
                            <div class="meta_info">Modificado el <%=Html.Encode(nivelEstudio.Modificacion) %></div>
                        </td>
                        <td id="accion_<%=Html.Encode(nivelEstudio.Id) %>" class="button" width="140">
                            <div class="floatr btn_container">
                            <% if (nivelEstudio.Activo) { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Desactivar", "Deactivate", new { id = nivelEstudio.Id }, new { @class = "remote put" })%>
                                </span>
                            <% } else { %>
                                <span class="btn btn_small_white">
                                    <%=Html.ActionLink("Activar", "Activate", new { id = nivelEstudio.Id }, new { @class = "remote put" })%>
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
