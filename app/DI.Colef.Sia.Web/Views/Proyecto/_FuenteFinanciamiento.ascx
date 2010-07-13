<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label></label>
    ¿Proyecto con recursos complementarios? <%=Html.CheckBox("ConRecursos", Model.ConRecursos)%>
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>

<div id="ProyectoConRecursos">
    <p>
        <label></label>
        ¿Cuenta con convenio? <%=Html.CheckBox("ConConvenio", Model.ConConvenio)%>
        <br /><label></label><span>(Marque en caso positivo)</span>
    </p>
    <p class="Convenio_Fields">
        <label>Nombre del convenio</label>
        <%=Html.DropDownList("Convenio", Model.Convenios.CreateSelectList<ConvenioForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido cascade", rel=Url.Action("ChangeConvenio") })%>
        <%=Html.ValidationMessage("Convenio")%>
    </p>
    <p class="Convenio_Fields">
        <label>Fecha de la firma del contrato</label>
        <span id="span_fechafirma" class="valor"><%=Html.Encode(Model.ConvenioFechaFirma)%>&nbsp;</span>
    </p>
    <p class="Convenio_Fields">
        <label>Fecha de conclusi&oacute;n</label>
        <span id="span_fechaconclusion" class="valor"><%=Html.Encode(Model.ConvenioFechaConclusion)%>&nbsp;</span>
    </p>
    <p class="Convenio_Fields">
        <label>Término de referencia</label>
        <span id="span_terminoreferencia" class="valor"><%=Html.Encode(Model.ConvenioTerminoReferencia)%>&nbsp;</span>
    </p>
    <p class="Convenio_Fields">
        <label>Producto comprometido</label>
        <span id="span_productocomprometido" class="valor"><%=Html.Encode(Model.ConvenioProductoComprometido)%>&nbsp;</span>
    </p>
    <p>
        <label>Sector de financiamiento</label>
        <%=Html.DropDownList("SectorFinanciamiento", Model.SectoresFinanciamientos.CreateSelectList<SectorForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("SectorFinanciamiento")%>
    </p>
    <p id="SectorFinanciamiento_Field">
        <label>Fondo del CONACyT</label>
        <%=Html.DropDownList("FondoConacyt", Model.FondosConacyt.CreateSelectList<FondoConacytForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("FondoConacyt")%>
    </p>
</div>