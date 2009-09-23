<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Estatus</label>
    <%=Html.DropDownList("EstadoInvestigador.Estado", Model.Estados.CreateSelectList<EstadoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoInvestigador.Estado")%>
</p>
<p>                        
    <label>Fecha</label>
    <%=Html.TextBox("EstadoInvestigador.Fecha", Model.EstadoInvestigador.Fecha, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("EstadoInvestigador.Fecha")%>
</p>