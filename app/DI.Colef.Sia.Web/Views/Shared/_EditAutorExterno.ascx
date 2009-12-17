<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="autorexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.AutoresExternos != null && Model.AutoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.AutoresExternos.Length; i++) { %>
	        <div class="sublista" id="autorexterno_<%=Html.Encode(Model.AutoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteAutorExterno", null, new{ id = Model.ModelId, investigadorExternoId = Model.AutoresExternos[i].InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.AutoresExternos[i].NombreCompleto)%>
	                <%=Html.Hidden("AutorExterno[" + i + "].InvestigadorExternoId", Model.AutoresExternos[i].InvestigadorExternoId)%>
	                <% if (Model.AutoresExternos[i].InstitucionId != 0) {%>
	                    <span>
                            Instituci&oacute;n <%=Html.Encode(Model.AutoresExternos[i].InstitucionNombre)%>
                            <%=Html.Hidden("AutorExterno[" + i + "].InstitucionId", Model.AutoresExternos[i].InstitucionId)%>
                        </span>
                    <% } %>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="autorexternoEmptyListForm">
            <h6><span>No hay autores externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="autorexternoNew" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Agregar autor externo", "NewAutorExterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->
	
</div><!--end minilista-->

<div id="autorexternoForm" class="display:hidden;"></div>
