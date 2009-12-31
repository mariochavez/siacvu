<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<div id="coautorNew" class="minilistaboton">
	<p>
		<span>
    		<%=Html.ActionLink("+ Agregar investigador interno", "NewCoautorInterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
		</span>
		<span>
		    <%=Html.ActionLink("+ Agregar investigador externo", "NewCoautorExterno", new { Id = Model.ModelId }, new { @class = "remote get" })%>
		</span>
	</p>
</div><!--end minilistaboton-->

<div id="coautorForm" class="display:hidden;"></div>