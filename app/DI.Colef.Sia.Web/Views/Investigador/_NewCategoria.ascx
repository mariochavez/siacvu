<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            Categoria:<em>*</em>
        </td>
        <td>
            <%=Html.DropDownList("CategoriaInvestigador.Categoria", Model.Categorias.CreateSelectList<CategoriaForm>("Id", "Nombre"),
    "Seleccione ...")%>
            <%=Html.ValidationMessage("CategoriaInvestigador.Categoria")%>
        </td>
    </tr>
    <tr>
        <td class="label">                        
            Fecha:<em>*</em>
        </td>
        <td>
            <%=Html.TextBox("CategoriaInvestigador.Fecha", Model.CategoriaInvestigador.Fecha, new { @class = "datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("CategoriaInvestigador.Fecha")%>
        </td>
    </tr>                                
</table>