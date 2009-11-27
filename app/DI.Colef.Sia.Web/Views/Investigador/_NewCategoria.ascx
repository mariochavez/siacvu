<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Categoria</label>
    <%=Html.DropDownList("CategoriaInvestigador.Categoria", Model.Categorias.CreateSelectList<CategoriaForm>("Id", "Nombre"),
"Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span> 
    <%=Html.ValidationMessage("CategoriaInvestigador.Categoria")%>
</p>
<p>                       
    <label>Periodo</label>
    <%=Html.TextBox("CategoriaInvestigador.FechaInicial", Model.CategoriaInvestigador.FechaInicial, new { @class = "datetime input100-requerido", maxlength = 10 })%> a 
    <%=Html.TextBox("CategoriaInvestigador.FechaFinal", Model.CategoriaInvestigador.FechaFinal, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span> 
    <%=Html.ValidationMessage("CategoriaInvestigador.FechaInicial")%>
    <%=Html.ValidationMessage("CategoriaInvestigador.FechaFinal")%>
</p>