<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" 
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<ParticipacionMedioForm>>" %>
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
		<p>Para modificar la participacion en medio utilice los siguientes campos para realizar cambios dentro del sistema.</p>
	</div><!--end introduccion-->	
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_EditSidebar"); %>
        </div><!--end asistente-->
    </div><!--end barra-->
</asp:Content>


<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">
    
	    <div id="forma">
            <% Html.RenderPartial("_Message"); %>
            <br />
            <% using (Html.BeginForm("Update", "ParticipacionMedio")){ %>
		        <%=Html.AntiForgeryToken() %>
                <%=Html.Hidden("Id", Model.Form.Id) %>

                <% Html.RenderPartial("_DatosParticipacionMedio", Model.Form); %>
        				
                <p class="submit">
                    <%=Html.SubmitButton("Guardar", "Guardar Cambios") %> &oacute; <%=Html.ActionLink<ParticipacionMedioController>(x => x.Index(), "Regresar")%>
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
