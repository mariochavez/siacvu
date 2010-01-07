<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label></label>
    <%= Html.CheckBox(Model.CheckboxName, Model.CheckboxValue, new { @class = "order", rel = Model.Rel })%> ¿Los investigadores se ordenan alfab&eacute;ticamente? 
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>
<div id="<%=Html.Encode(Model.SubFormName)%>New" class="minilistaboton">
	<p>
		<span>
    		<%=Html.ActionLink("+ Agregar investigador interno", Model.UrlActionInterno, new { Id = Model.ModelId, esAlfabeticamente = Model.CheckboxValue }, new { id = Model.Link1Id, @class = "remote get" })%>
		</span>
		<span>
		    <%=Html.ActionLink("+ Agregar investigador externo", Model.UrlActionExterno, new { Id = Model.ModelId, esAlfabeticamente = Model.CheckboxValue }, new { id = Model.Link2Id, @class = "remote get" })%>
		</span>
	</p>
</div><!--end minilistaboton-->

<div id="<%=Html.Encode(Model.SubFormName)%>Form" class="display:hidden;"></div>