<%@ Control Language="C#" AutoEventWireup="true" 
    Inherits="Report.Controls.C2011.Grid.HeaderSorting" %>
<table id="crmGrid_gridBar" class="ms-crm-List-Header" cellspacing="0" summary="From each column header, you can sort and filter the records in that column."
    cellpadding="0">
    <asp:Repeater runat="server" ID="repWidth">
        <HeaderTemplate>
            <colgroup id="crmGrid_gridBarCols">
                <col class="ms-crm-List-NonDataColumnHeader" width="32">
                <col width="2">
        </HeaderTemplate>
        <ItemTemplate>
            <col class="ms-crm-List-DataColumnHeader" width="<%# Eval("Width") %>">
            <col width="2">
        </ItemTemplate>
        <FooterTemplate>
            <col style="display: none">
            <col>
            </colgroup>
        </FooterTemplate>
    </asp:Repeater>
    <tbody>
        <tr height="20">
            <asp:Repeater runat="server" ID="repCols" OnItemCommand="repCols_ItemCommand" OnItemDataBound="repCols_ItemDataBound">
                <HeaderTemplate>
                    <td>
                        <input style="height: 19px" id="chkAll" class="ms-crm-RowCheckBox" title="Select/clear all records on this page"
                            tabindex="0" value="" type="checkbox">
                    </td>
                    <td>
                        <img id="bar_line" class="ms-crm-ImageStrip-bar_line" alt="" src="/_imgs/imagestrips/transparent_spacer.gif">
                    </td>
                </HeaderTemplate>
                <ItemTemplate>
                    <th class="ms-crm-List-Sortable">
                        <table class="ms-crm-List-Sortable" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td class="ms-crm-List-Sortable">
                                        <asp:LinkButton ID="LinkHeaderButton" TabIndex="0" ToolTip='<%# Eval("Title") %>'
                                            runat="server">
                                            <nobr> <asp:Label ID="lblListName" CssClass="ms-crm-List-Sortable" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                       <asp:Image ImageUrl ="/_imgs/imagestrips/transparent_spacer.gif"  ID="imgSortType" runat="server" CssClass="ms-crm-ImageStrip-dropdown" /></nobr>
                                        </asp:LinkButton>
                                    </td>
                                    <td class="ms-crm-FilterPopupContainerTD">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </th>
                    <td>
                        <img class="ms-crm-List-ResizeBar ms-crm-ImageStrip-resize" alt="" src="/_imgs/imagestrips/transparent_spacer.gif">
                    </td>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
            <td>
            </td>
        </tr>
    </tbody>
</table>
