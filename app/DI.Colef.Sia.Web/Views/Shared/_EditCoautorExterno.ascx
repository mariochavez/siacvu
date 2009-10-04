<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="coautorexternoList">
    <h5>Investigador Externo</h5>

    <% if (Model.CoautoresExternos != null && Model.CoautoresExternos.Length > 0) { %>
        <% for(int i = 0; i < Model.CoautoresExternos.Length; i++) { %>
	        <div class="sublista" id="coautorexterno_<%=Html.Encode(Model.CoautoresExternos[i].InvestigadorExternoId) %>">
	            <h6>
	                <%=Html.Encode(Model.CoautoresExternos[i].InvestigadorExternoNombre)%>
	                <%=Html.Hidden("CoautorExterno[" + i + "].InvestigadorExternoId_New", Model.CoautoresExternos[i].InvestigadorExternoId)%>
	                <span>
                        <strong>Posici&oacute;n</strong> <%=Html.Encode(Model.CoautoresExternos[i].Posicion)%>
                        <%=Html.Hidden("CoautorExterno[" + i + "].Posicion", Model.CoautoresExternos[i].Posicion)%>
                        <strong>Instituci&oacute;n</strong> <%=Html.Encode(Model.CoautoresExternos[i].InstitucionNombre)%>
                        <%=Html.Hidden("CoautorExterno[" + i + "].InstitucionId_New", Model.CoautoresExternos[i].InstitucionId)%>
                    </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="coautorexternoEmptyList_form">
            <h6><span>No hay coautores externos registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="coautorexterno_new" class="minilistaboton">
		<p>
			<span>
	    		<%=Html.ActionLink("+ Nuevo coautor externo", "NewCoautorExterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->

<div id="coautorexterno_form" class="display:hidden;"></div>