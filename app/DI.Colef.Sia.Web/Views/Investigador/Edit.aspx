<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<InvestigadorForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2><%=Html.Encode(Model.Title) %></h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
	<div id="introduccion">
		<p>Favor de llenar los siguientes campos para dar de alta un nuevo investigador dentro del sistema.</p>
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
    
	    <div id="forma">
	    
            <% Html.RenderPartial("_Message"); %>
            <br />
            <% using (Html.BeginForm("Update", "Investigador")) { %>
                <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>

		        <p>
			        <label>Usuario</label>
			        <%=Html.Encode(Model.Form.Nombre) %>
		        </p>
		        <p>
			        <label>Fecha de Ingreso</label>
			        <%=Html.TextBox("FechaIngreso", Model.Form.FechaIngreso, new { @class="datetime input100-requerido", maxlength = 10 })%>
			        <span>(Formato dd/mm/yyyy)</span>
			        <%=Html.ValidationMessage("FechaIngreso")%>
		        </p>
		        <h4>Estados</h4>
			        <% Html.RenderPartial("_EditEstado", Model.Form); %>
		        <h4>Grado</h4>
		        <p>
			        <% Html.RenderPartial("_EditGrado", Model.Form); %>
		        </p>
		        <h4>Categoria</h4>
		        <p>
			        <% Html.RenderPartial("_EditCategoria", Model.Form); %>
		        </p>
		        <h4>Cargo</h4>
		        <p>
			        <% Html.RenderPartial("_EditCargo", Model.Form); %>
		        </p>
		        <h4>SNI</h4>
		        <p>
			        <% Html.RenderPartial("_EditSni", Model.Form); %>
		        </p>                                          

                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar Cambios") %> &oacute; <%=Html.ActionLink<InvestigadorController>(x => x.Index(), "Regresar")%>
                </p>
                            
            <% } %>
            
	    </div><!--end forma-->	
    		
    </div><!--end textos-->
        
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>
