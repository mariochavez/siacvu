<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ResenaForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Favor de llenar los siguientes campos para dar de alta una nueva reseña dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_NewSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
    
	    <% Html.RenderPartial("_Message"); %>    
	    <div id="forma">	

            <% using (Html.BeginForm("Create", "Resena")) { %>
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>
                
                <h4>Datos de la publicaci&oacute;n</h4>
                <p>
                    <label>Nombre de la publicaci&oacute;n</label>
                    <%=Html.TextArea("NombreProducto", Model.Form.NombreProducto, 3, 35, new { @class = "input420-bold-requerido", maxlength = 200 })%>
                    <%=Html.ValidationMessage("NombreProducto")%>
                </p>                
                <p>
                    <label>Tipo de publicaci&oacute;n</label>
                    <%=Html.DropDownList("TipoResena", Model.Form.TiposResenas.CreateSelectList<TipoResenaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
                    <%=Html.ValidationMessage("TipoResena")%>
                </p>
                
                <h4>Coautores</h4>
			    <% Html.RenderPartial("_EditCoautorInterno", new CoautorForm { CoautoresInternos = Model.Form.CoautorInternoResenas, ModelId = Model.Form.Id } ); %>
                <% Html.RenderPartial("_EditCoautorExterno", new CoautorForm { CoautoresExternos = Model.Form.CoautorExternoResenas, ModelId = Model.Form.Id } ); %>
                
                <p>
                    <label>Autores</label>
                    <span id="totalcoautores" class="valor"><%=Html.Encode(Model.Form.TotalAutores) %></span>
                    <span class="cvu"></span>
                </p>
                <p>
	                <label>Posici&oacute;n del autor</label>
                    <%=Html.TextBox("PosicionAutor", Model.Form.PosicionAutor, new { @class = "input100", maxlength = 3 })%>
	                <span class="cvu"></span>
	                <%=Html.ValidationMessage("PosicionAutor")%>
                </p>
                
                <div id="resenaBibliografica_field">
                    <h4>Referencia de la obra reseñada</h4>
                    <p>
	                    <label>Nombre del libro</label>
                        <%=Html.TextBox("TituloLibro", Model.Form.TituloLibro, new { @class = "input420-requerido", maxlength = 100 })%>
	                    <%=Html.ValidationMessage("TituloLibro")%>
                    </p>
                    
                    <% Html.RenderPartial("_EditAutor", Model.Form); %>
                    <% Html.RenderPartial("_DatosResena", Model.Form); %>
                </div>
                
                <h4>Referencia bibliogr&aacute;fica</h4>
				<% Html.RenderPartial("_ReferenciaBibliografica", Model.Form); %>
                
                <h4>Complementaria CVU</h4>
                <% Html.RenderPartial("_DatosOpcionales", Model.Form); %>
        		
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar cambios") %> &oacute; <%=Html.ActionLink<ResenaController>(x => x.Index(), "Regresar")%>
                </p>
            <% } %>
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
        resenaSetup();
    });
</script>
</asp:Content>
