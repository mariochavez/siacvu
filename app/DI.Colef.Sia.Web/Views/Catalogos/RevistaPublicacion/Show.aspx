<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true"
    Inherits="System.Web.Mvc.ViewPage<GenericViewData<RevistaPublicacionForm>>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DI.Colef.Sia.Web.Controllers" %>

<asp:Content ID="titleContent" ContentPlaceHolderID="TituloPlaceHolder" runat="server">
    <h2>
        <%=Html.Encode(Model.Title) %>
    </h2>
</asp:Content>

<asp:Content ID="introductionContent" ContentPlaceHolderID="IntroduccionPlaceHolder" runat="server">
    <div id="introduccion">
        <p>
            Aqu&iacute; se muestra la informaci&oacute;n detallada de la revista de publicaci&oacute;n como est&aacute; en el sistema.
		</p>
    </div><!--end introduccion-->
</asp:Content>

<asp:Content ID="sidebarContent" ContentPlaceHolderID="SidebarContentPlaceHolder" runat="server">
    <div id="barra">
        <div id="asistente">
            <h3>Asistente de secci&oacute;n</h3>
            <% Html.RenderPartial("_ShowSidebar"); %>
        </div><!--end asistente-->

    </div><!--end barra-->
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="textos">

        <div id="forma">
            <div id="campos">
                <h4>Datos generales de la revista</h4>
                <p>
                    <label>Nombre de la revista</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Titulo)%>&nbsp;</span>
                </p>
                <p>
                    <label>Instituci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.InstitucionNombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>Departamento acad&eacute;mico</label>
                    <span class="valor"><%=Html.Encode(Model.Form.DepartamentoAcademico)%>&nbsp;</span>
                </p>
                <p>
                    <label>ISSN</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Issn)%>&nbsp;</span>
                </p>
                <p>
                    <label>Contacto de la revista</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Contacto)%>&nbsp;</span>
                </p>
                <p>
                    <label>E-mail</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Email)%>&nbsp;</span>
                </p>
                <p>
                    <label>P&aacute;gina web</label>
                    <span class="valor"><%=Html.Encode(Model.Form.PaginaWeb)%>&nbsp;</span>
                </p>                
                <p>
                    <label>Tel&eacute;fono y/o Fax</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Telefono)%>&nbsp;</span>
                </p>
                <h4>Caracter&iacute;sticas de la revista</h4>
                <p>
                    <label>Tipo de arbitraje</label>
                    <span class="valor"><%=HumanizeHelper.TipoRevista(Model.Form.TipoRevista)%>&nbsp;</span>
                </p>
                <p>
                    <label>Clasificaci&oacute;n en el SIEVA</label>
                    <span class="valor"><%=HumanizeHelper.ClasificacionSieva(Model.Form.ClasificacionSieva)%>&nbsp;</span>
                </p>
                <p>
                    <label>Descripci&oacute;n de la revista</label>
                    <span class="valor"><%=Html.Encode(Model.Form.DescripcionRevista)%>&nbsp;</span>
                </p>
                <p>
                    <label>Factor de impacto</label>
                    <span class="valor"><%=Html.Encode(Model.Form.FactorImpacto)%>&nbsp;</span>
                </p>
                <p>
                    <label>Formato de la revista</label>
                    <span class="valor"><%=HumanizeHelper.FormatoRevista(Model.Form.FormatoRevista)%>&nbsp;</span>
                </p>
                <p>
                    <label>Periodicidad</label>
                    <span class="valor"><%=HumanizeHelper.Periodicidad(Model.Form.Periodicidad)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Aacute;rea de investigaci&oacute;n</label>
                    <span class="valor"><%=Html.Encode(Model.Form.AreaInvestigacionNombre)%>&nbsp;</span>
                </p>
                
                <h4>&Iacute;ndices a los que pertenece la revista</h4>
                <p>
                    <label>&Iacute;ndice 1</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Indice1Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Iacute;ndice 2</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Indice2Nombre)%>&nbsp;</span>
                </p>
                <p>
                    <label>&Iacute;ndice 3</label>
                    <span class="valor"><%=Html.Encode(Model.Form.Indice3Nombre)%>&nbsp;</span>
                </p>
                
                <p class="submit">
                    <%= Html.ActionLink<RevistaPublicacionController>(x => x.Index(), "Regresar") %>
                </p>
             </div><!--end campos-->
        </div><!--end lista-->

    </div><!--end textos-->
    
<script type="text/javascript">
    $(document).ready(function() {
        setupDocument();
    });
</script>
</asp:Content>