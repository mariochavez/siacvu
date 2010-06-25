<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>

var html = '
    <div id="telefonoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>Este usuario no tiene telefonos asignados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#telefono_<%=Html.Encode(Model) %>').remove();

deleteElement(html, '#telefonoList div[id^=telefono_]', '#telefonoList');

setupSublistRows();
