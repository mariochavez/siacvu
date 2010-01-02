<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorinternoList">

    <% if (Model.CoautoresInternos != null && Model.CoautoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresInternos.Length; i++) { %>
	        <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.CoautoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <a href="<%=Url.Action("deletecoautorinterno", null, new{id = Model.ModelId, investigadorId = Model.CoautoresInternos[i].InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.CoautoresInternos[i].NombreCoautor)%>
	                <%=Html.Hidden("CoautorInterno[" + i + "].InvestigadorId", Model.CoautoresInternos[i].InvestigadorId)%>
	                <% if(!Model.CoautoresInternos[i].CoautorSeOrdenaAlfabeticamente){ %>
	                    <span>
                            Posici&oacute;n <%=Html.Encode(Model.CoautoresInternos[i].Posicion)%>
                            <%=Html.Hidden("CoautorInterno[" + i + "].Posicion", Model.CoautoresInternos[i].Posicion)%>
                        </span>
                    <% } %>
                    <%=Html.Hidden("CoautorInterno[" + i + "].CoautorSeOrdenaAlfabeticamente", Model.CoautoresInternos[i].CoautorSeOrdenaAlfabeticamente)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div></div>
    <% } %>

</div><!--end minilista-->