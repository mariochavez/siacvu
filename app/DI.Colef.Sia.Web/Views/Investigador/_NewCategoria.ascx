<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Categoria</label>
    <%=Html.DropDownList("CategoriaInvestigador.Categoria", Model.Categorias.CreateSelectList<CategoriaForm>("Id", "Nombre"),
"Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("CategoriaInvestigador.Categoria")%>
</p>
<p>                       
    <label>Fecha</label>
    <%=Html.TextBox("CategoriaInvestigador.Fecha", Model.CategoriaInvestigador.Fecha, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("CategoriaInvestigador.Fecha")%>
</p>