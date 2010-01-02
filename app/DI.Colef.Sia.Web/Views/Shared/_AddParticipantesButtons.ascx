<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label></label>
    <%= Html.CheckBox("ParticipanteSeOrdenaAlfabeticamente", Model.ParticipanteSeOrdenaAlfabeticamente)%> ¿Los participantes se ordenan alfab&eacute;ticamente? 
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>
<div id="participanteNew" class="minilistaboton">
	<p>
		<span>
    		<%=Html.ActionLink("+ Agregar investigador interno", "NewParticipanteInterno", new { Id = Model.ModelId, esAlfabeticamente = Model.ParticipanteSeOrdenaAlfabeticamente }, new { id="NewParticipanteInternoLink", @class = "remote get" })%>
		</span>
		<span>
		    <%=Html.ActionLink("+ Agregar investigador externo", "NewParticipanteExterno", new { Id = Model.ModelId, esAlfabeticamente = Model.ParticipanteSeOrdenaAlfabeticamente }, new { id = "NewParticipanteExternoLink", @class = "remote get" })%>
		</span>
	</p>
</div><!--end minilistaboton-->

<div id="participanteForm" class="display:hidden;"></div>