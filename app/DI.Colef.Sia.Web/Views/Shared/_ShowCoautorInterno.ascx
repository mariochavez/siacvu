﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorinternoList">

    <% if (Model.CoautoresInternos != null && Model.CoautoresInternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresInternos.Length; i++) { %>
	        <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.CoautoresInternos[i].InvestigadorId) %>">
	            <h6>
	                <%=Html.Encode(Model.CoautoresInternos[i].NombreCoautor)%>
	                <% if(!Model.CoautorSeOrdenaAlfabeticamente){ %>
	                    <span>
                            Posici&oacute;n <%=Html.Encode(Model.CoautoresInternos[i].Posicion)%>
                        </span>
                    <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } %>

</div><!--end minilista-->