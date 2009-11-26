<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<div id="usuario">
    <p><span class="usuario"><%=Html.Encode(Page.User.Identity.Name) %></span> / 
        <%=Html.ActionLinkForAreas<FormacionAcademicaController>(x => x.Index(), "Formaci&oacute;n acad&eacute;mica")%> / 
        <%=Html.ActionLinkForAreas<ExperienciaProfesionalController>(x => x.Index(), "Experiencia profesional") %> / 
        <%=Html.ActionLinkForAreas<ApoyoConacytController>(x => x.Index(), "Apoyo CONACYT") %> / 
        <%=Html.ActionLinkForAreas<IdiomasInvestigadorController>(x => x.Index(), "Idiomas") %> / 
        <%=Html.ActionLinkForAreas<InvestigadorController>(x => x.Perfil(), "Perfil") %> / <%=Html.ActionLink("Cerrar Sesión", "Destroy", "Session")%>
    </p>
</div><!--end usuario-->