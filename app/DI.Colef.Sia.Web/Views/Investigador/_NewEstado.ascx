<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Estatus</label>
    <%=Html.DropDownList("EstadoInvestigador.Estado", Model.Estados.CreateSelectList<EstadoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>    
    <%=Html.ValidationMessage("EstadoInvestigador.Estado")%>
</p>
<p>                        
    <label>Fecha</label>
    <%=Html.TextBox("EstadoInvestigador.FechaInicial", Model.EstadoInvestigador.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span class="noeffect EstadoFechaFinal_Field"> a </span>
    <%=Html.TextBox("EstadoInvestigador.FechaFinal", Model.EstadoInvestigador.FechaFinal, new { @class = "datetime input100-requerido EstadoFechaFinal_Field", maxlength = 10 })%>
    
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("EstadoInvestigador.FechaInicial")%>
    <%=Html.ValidationMessage("EstadoInvestigador.FechaFinal")%>
</p>