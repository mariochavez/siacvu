<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorexternoList">

    <% if (Model.AutoresExternos != null && Model.AutoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresExternos.Length; i++) { %>
	        <div class="sublista" id="autorexterno_<%=Html.Encode(Model.AutoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.AutoresExternos[i].NombreCompleto)%>
	                <span>
	                    <% if (Model.AutoresExternos[i].InstitucionId != 0) {%>
                            Instituci&oacute;n <%=Html.Encode(Model.AutoresExternos[i].InstitucionNombre)%>
                        <% } %>
                        <% if(!Model.AutorSeOrdenaAlfabeticamente){ %>
                            Posici&oacute;n <%=Html.Encode(Model.AutoresExternos[i].Posicion)%>
                        <% } %>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } %>
	
</div><!--end minilista-->