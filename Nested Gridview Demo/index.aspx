<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Nested_Gridview_Demo.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 21px;
        }
    </style>
    <script language="javascript" type="text/javascript">

function divexpandcollapse(divname) {

var div = document.getElementById(divname);

var img = document.getElementById('img' + divname);

if (div.style.display == "none") {

div.style.display = "inline";

img.src = "minus.gif";

} else {

div.style.display = "none";

img.src = "plus.gif";

}

}
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="2" style="text-align: center">
                    <asp:Label ID="Label_Heading" runat="server" Text="Nested GridView Demo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                  <asp:GridView ID="GridView_Parent" runat="server" DataKeyNames="CountryId" Width="300px" AutoGenerateColumns="False" OnRowDataBound="GridView_Parent_RowDataBound" GridLines="None" BorderStyle="Solid" BorderWidth="1px"  BorderColor="#DF5015">

<HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />

<RowStyle BackColor="#E1E1E1" />

<AlternatingRowStyle BackColor="White" />

<HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />

<Columns>

<asp:TemplateField ItemStyle-Width="20px">

<ItemTemplate>

<a href="JavaScript:divexpandcollapse('div<%# Eval("CountryID") %>');">

<img id="imgdiv<%# Eval("CountryID") %>" width="9px" border="0" src="plus.gif" />

</a>

</ItemTemplate>

</asp:TemplateField>

<asp:BoundField DataField="CountryId" HeaderText="CountryId" HeaderStyle-HorizontalAlign="Left" />

<asp:BoundField DataField="CountryName" HeaderText="CountryName" HeaderStyle-HorizontalAlign="Left" />

<asp:TemplateField>

<ItemTemplate>

<tr>

<td colspan="100%">

<div id="div<%# Eval("CountryID") %>" style="display: none; position: relative; left: 15px; overflow: auto">

<asp:GridView ID="GridView_Child" runat="server" AutoGenerateColumns="false" BorderStyle="Double"  BorderColor="#df5015" GridLines="None" Width="250px">

<HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />

<RowStyle BackColor="#E1E1E1" />

<AlternatingRowStyle BackColor="White" />

<HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />

<Columns>

<asp:BoundField DataField="StateID" HeaderText="StateID" HeaderStyle-HorizontalAlign="Left" />

<asp:BoundField DataField="StateName" HeaderText="StateName" HeaderStyle-HorizontalAlign="Left" />

</Columns>

</asp:GridView>

</div>

</td>

</tr>

</ItemTemplate>

</asp:TemplateField>

</Columns>

</asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
