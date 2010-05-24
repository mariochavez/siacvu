<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DecisionesInteligentes.Colef.Sia.Web.Controllers.Models.BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>
<div class="minilista fileUpload" id="fileQueue">
    <h5>Documentos y/o comprobantes</h5>

    <% if (Model.Archivos != null && Model.Archivos.Length > 0) { %>
        <% for(int i = 0; i < Model.Archivos.Length; i++) { %>
	        <div class="sublista" id="archivo_<%=Html.Encode(Model.Archivos[i].Id) %>">
	            <h6>
	                <a href="<%=Url.Action("deletearchivo", null, new{ id = Model.Id, archivoId = Model.Archivos[i].Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.ActionLink(Html.Encode(Model.Archivos[i].Nombre), "Show", "Archivo", new { id = Model.Archivos[i].Id }, null) %>
                    <!-- <%=Html.ActionLinkForAreas<ArchivoController>(x => x.Show(Model.Archivos[i].Id), Html.Encode(Model.Archivos[i].Nombre))%> -->
	                <%=Html.Hidden("Archivo[" + i + "].Id", Model.Archivos[i].Id)%>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="archivoEmptyListForm">
            <h6><span>No hay archivos adjuntos</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
	
</div><!--end minilista-->

<div>
	<input type="file" name="uploadify" id="uploadify" />
</div>

