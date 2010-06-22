<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorinternoList">

    <% if (Model.AutoresInternos != null && Model.AutoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresInternos.Length; i++) { %>
	        <div class="sublista" id="autorinterno_<%=Html.Encode(Model.AutoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.AutoresInternos[i].NombreAutor)%>
	                <% if(!Model.AutorSeOrdenaAlfabeticamente){ %>
	                    <span>
                            Posici&oacute;n <%=Html.Encode(Model.AutoresInternos[i].Posicion)%>
                        </span>
                    <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } %>

</div><!--end minilista-->