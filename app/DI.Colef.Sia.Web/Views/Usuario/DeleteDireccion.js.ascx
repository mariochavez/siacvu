<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>

var html = '
    <div id="direccionEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>Este usuario no tiene Direcci&oacute;n asignada</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#direccion_<%=Html.Encode(Model) %>').remove();

deleteElement(html, '#direccionList div[id^=direccion_]', '#direccionList');

setupSublistRows();
