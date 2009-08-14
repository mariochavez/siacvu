<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Cargo</label>
    <%=Html.DropDownList("CargoInvestigador.Cargo", Model.Cargos.CreateSelectList<CargoForm>("Id", "Nombre"),
"Seleccione ...")%>
    <%=Html.ValidationMessage("CargoInvestigador.Cargo")%>
</p>
<p>
    <label>Fecha</label>
    <%=Html.TextBox("CargoInvestigador.Fecha", Model.CargoInvestigador.Fecha, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("CargoInvestigador.Fecha")%>
</p>
<p>
    <label>Departamento</label>
    <%=Html.DropDownList("CargoInvestigador.Departamento", Model.Departamentos.CreateSelectList<DepartamentoForm>("Id", "Nombre"),
"Seleccione ...")%>
    <%=Html.ValidationMessage("CargoInvestigador.Departamento")%>
</p>
<p>
    <label>Sede:</label>
    <%=Html.DropDownList("CargoInvestigador.Sede", Model.Sedes.CreateSelectList<SedeForm>("Id", "Nombre"),
"Seleccione ...")%>
    <%=Html.ValidationMessage("CargoInvestigador.Sede")%>
</p>