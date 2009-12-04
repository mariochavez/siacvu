<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Puesto</label>
    <%=Html.DropDownList("CargoInvestigador.Puesto", Model.Puestos.CreateSelectList<PuestoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("CargoInvestigador.Puesto")%>
</p>
<p>
    <label>Departamento</label>
    <%=Html.DropDownList("CargoInvestigador.Departamento", Model.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("CargoInvestigador.Departamento")%>
</p>
<p>
    <label>Sede</label>
    <%=Html.DropDownList("CargoInvestigador.Sede", Model.Sedes.CreateSelectList<SedeForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("changesede") })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("CargoInvestigador.Sede")%>
</p>
<p>
    <label>Direcci&oacute;n regional:</label>
    <span id="span_direccionregional" class="valor">&nbsp;</span>
</p>