<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorinternoList">

    <% if (Model.AutoresInternos != null && Model.AutoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresInternos.Length; i++) { %>
	        <div class="sublista" id="autorinterno_<%=Html.Encode(Model.AutoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteAutorInterno", null, new{id = Model.ModelId, investigadorId = Model.AutoresInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.AutoresInternos[i].NombreAutor)%>
	                <%=Html.Hidden("AutorInterno[" + i + "].InvestigadorId", Model.AutoresInternos[i].InvestigadorId)%>
	                <% if(!Model.AutorSeOrdenaAlfabeticamente){ %>
	                    <span>
                            Posici&oacute;n <%=Html.Encode(Model.AutoresInternos[i].Posicion)%>
                            <%=Html.Hidden("AutorInterno[" + i + "].Posicion", Model.AutoresInternos[i].Posicion)%>
                        </span>
                    <% } %>
                    <%=Html.Hidden("AutorInterno[" + i + "].AutorSeOrdenaAlfabeticamente", Model.AutorSeOrdenaAlfabeticamente)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div></div>
    <% } %>

</div><!--end minilista-->