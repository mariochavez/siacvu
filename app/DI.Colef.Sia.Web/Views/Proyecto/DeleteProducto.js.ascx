<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProductoGeneradoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>


var html = '
    <div id="productogeneradoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay productos generados registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#productogenerado_<%=Html.Encode(Model.Id) %>').remove();

deleteElement(html, '#productogeneradoList div[id^=productogenerado_]', '#productogeneradoList');

setupSublistRows();