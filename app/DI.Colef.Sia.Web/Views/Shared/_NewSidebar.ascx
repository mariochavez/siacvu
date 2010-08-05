<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
    <p>Los campos marcados con <%=Html.Image(ResolveUrl("~/Content/Images/asistente-requerido-icon.gif"))%> son requeridos de ser llenados.</p>
	<p>En el caso de los campos que tienen la indicaci&oacute;n <%=Html.Image(ResolveUrl("~/Content/Images/buscar-requerido-icon.gif"))%>, son campos que conforme se vayan capturando van a ofrecer una opci&oacute;n de captura.</p>
	<p>Para los campos que pertenecen al Conacyt, est&aacute;n indicados con <%=Html.Image(ResolveUrl("~/Content/Images/cvu.gif"))%></p>
	<p>Una vez llenados los campos presione el bot&oacute;n de <strong>Guardar cambios</strong> para finalizar el alta de este elemento.</p>
	<p>Si desea deshacer los campos capturados, presione el enlace <strong>Regresar</strong> para volver a la secci&oacute;n de administraci&oacute;n.</p>