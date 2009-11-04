<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Cargo</label>
    <%=Html.DropDownList("CargoInvestigador.Cargo", Model.Cargos.CreateSelectList<CargoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("CargoInvestigador.Cargo")%>
</p>
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
    <label>Direcci&oacute;n regional:</label>
    <%=Html.DropDownList("CargoInvestigador.DireccionRegional", Model.DireccionesRegionales.CreateSelectList<DireccionRegionalForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("CargoInvestigador.DireccionRegional")%>
</p>