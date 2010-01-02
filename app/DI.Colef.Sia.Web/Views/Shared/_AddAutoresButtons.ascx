<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label></label>
    <%= Html.CheckBox("AutorSeOrdenaAlfabeticamente", Model.AutorSeOrdenaAlfabeticamente)%> ¿Los autores se ordenan alfab&eacute;ticamente? 
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>
<div id="autorNew" class="minilistaboton">
	<p>
		<span>
    		<%=Html.ActionLink("+ Agregar investigador interno", "NewAutorInterno", new { Id = Model.ModelId, esAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }, new { id="NewAutorInternoLink", @class = "remote get" })%>
		</span>
		<span>
		    <%=Html.ActionLink("+ Agregar investigador externo", "NewAutorExterno", new { Id = Model.ModelId, esAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }, new { id = "NewAutorExternoLink", @class = "remote get" })%>
		</span>
	</p>
</div><!--end minilistaboton-->

<div id="autorForm" class="display:hidden;"></div>