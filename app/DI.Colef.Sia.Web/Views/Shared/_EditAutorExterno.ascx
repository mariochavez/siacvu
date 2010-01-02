<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorexternoList">

    <% if (Model.AutoresExternos != null && Model.AutoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresExternos.Length; i++) { %>
	        <div class="sublista" id="autorexterno_<%=Html.Encode(Model.AutoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteAutorExterno", null, new{ id = Model.ModelId, investigadorExternoId = Model.AutoresExternos[i].InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.AutoresExternos[i].NombreCompleto)%>
	                <%=Html.Hidden("AutorExterno[" + i + "].InvestigadorExternoId", Model.AutoresExternos[i].InvestigadorExternoId)%>
	                <span>
	                    <% if (Model.AutoresExternos[i].InstitucionId != 0) {%>
                            Instituci&oacute;n <%=Html.Encode(Model.AutoresExternos[i].InstitucionNombre)%>
                            <%=Html.Hidden("AutorExterno[" + i + "].InstitucionId", Model.AutoresExternos[i].InstitucionId)%>
                        <% } %>
                        <% if(!Model.AutorSeOrdenaAlfabeticamente){ %>
                            Posici&oacute;n <%=Html.Encode(Model.AutoresExternos[i].Posicion)%>
                            <%=Html.Hidden("AutorExterno[" + i + "].Posicion", Model.AutoresExternos[i].Posicion)%>                 
                        <% } %>
                        <%=Html.Hidden("AutorExterno[" + i + "].AutorSeOrdenaAlfabeticamente", Model.AutorSeOrdenaAlfabeticamente)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div></div>
    <% } %>
	
</div><!--end minilista-->