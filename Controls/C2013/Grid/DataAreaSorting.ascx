<%@ Control Language="C#" AutoEventWireup="true" Inherits="Report.Controls.C2013.Grid.DataAreaSorting" %>
<asp:Repeater runat="server" ID="repSortStyle">
    <HeaderTemplate>
        <colgroup>
            <col class="ms-crm-List-CheckBoxColumn" width="18">
            <col class="ms-crm-List-RowIconColumn" width="16">
    </HeaderTemplate>
    <ItemTemplate>
        <col class="<%# GenerateCss(Eval("FieldName")) %>" name="<%# Eval("FieldName") %>" width="<%# WidthCalc(Eval("Width")) %>">
    </ItemTemplate>
    <FooterTemplate>
        <col>
        <col style="display: none" name="queueitemid">
        </colgroup>
    </FooterTemplate>
</asp:Repeater>
