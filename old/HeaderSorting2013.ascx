<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderSorting2013.ascx.cs"
    Inherits="CampaignsReport.HeaderSorting2013" %>
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
        <tr style="height: 20px">
            <asp:Repeater runat="server" ID="repCols" OnItemCommand="repCols_ItemCommand" OnItemDataBound="repCols_ItemDataBound">
                <HeaderTemplate>
                    <td style="height: 20px; padding: 0px;">
                        <input type="checkbox" class="ms-crm-HeaderCheckBox" id="Checkbox1" tabindex="0"
                            style="" title="Select/clear&#32;all&#32;records&#32;on&#32;this&#32;page">
                    </td>
                    <td>
                        <img id="bar_line" src="/_imgs/imagestrips/transparent_spacer2013.gif" class="ms-crm-ImageStrip-bar_line"
                            alt="">
                    </td>
                </HeaderTemplate>
                <ItemTemplate>
                    <th scope="col" field="name" fieldname="name" entityname="account" renderertype="Crm.PrimaryField"
                        class="ms-crm-List-Sortable" displaylabel="Account Name">
                        <table class="ms-crm-List-Sortable" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td class="ms-crm-List-Sortable">
                                        <asp:LinkButton ID="LinkHeaderButton" TabIndex="0" ToolTip='<%# Eval("Title") %>'
                                            runat="server">
                                            <nobr class="ms-crm-DataCell"><asp:Label ID="lblListName" CssClass="ms-crm-List-Sortable" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                       <asp:Image ImageUrl ="/_imgs/imagestrips/transparent_spacer2013.gif"  ID="imgSortType" runat="server" CssClass="ms-crm-ImageStrip-dropdown" /></nobr>
                                        </asp:LinkButton>
                                    </td>
                                    <td class="ms-crm-FilterPopupContainerTD">
                                        <table cellspacing="0" cellpadding="0" class="ms-crm-FilterPopupContainer" style="display: none">
                                            <tr>
                                                <td nowrap align="left">
                                                    <ul class="ms-crm-MenuBar-Left" style="margin-top: 0px">
                                                        <li class="ms-crm-FilterPopupMenu" tabindex="-1" menu="mnustringFilterPopupcrmGridaccountname"
                                                            id="stringFilterPopupcrmGridaccountname" attributexml="&lt;attributeinfo&gt;&lt;result&#32;value=&quot;name&quot;&#32;datatype=&quot;nvarchar&quot;&#32;maxlength=&#39;160&#39;&gt;Account&#32;Name&lt;/result&gt;&lt;lookupicons&gt;&lt;/lookupicons&gt;&lt;/attributeinfo&gt;"
                                                            relationshipname="" isfromfiltermenu="true" isfromrelatedentity="False" filtermenutype="string"
                                                            gridid="crmGrid" attributetype="nvarchar" attributename="name" columnname="name"
                                                            entityname="account" attributeformat="text" xml_filter="&lt;Menu&#32;title=&quot;StringFilterPopupMenu&quot;&#32;menuId=&quot;stringFilterPopupcrmGridaccountname&quot;&gt;&lt;MenuItem&#32;id=&quot;_MIcrmGridaccountnameResetFilter&quot;&#32;type=&quot;ResetFilter&quot;&#32;display=&quot;Reset&#32;Filter&quot;&#32;isenabled=&quot;True&quot;&#32;iconPath=&quot;/_imgs/grid/disablereset.png&quot;&#32;/&gt;&lt;MenuItem&#32;type=&quot;space&quot;&#32;display=&quot;spacer&quot;&#32;/&gt;&lt;MenuItem&#32;id=&quot;_MIcrmGridaccountnameSortAsc&quot;&#32;type=&quot;SortAsc&quot;&#32;display=&quot;Sort&#32;A&#32;to&#32;Z&quot;&#32;isenabled=&quot;True&quot;&#32;iconPath=&quot;/_imgs/grid/asc.png&quot;&#32;/&gt;&lt;MenuItem&#32;id=&quot;_MIcrmGridaccountnameSortDesc&quot;&#32;type=&quot;SortDesc&quot;&#32;display=&quot;Sort&#32;Z&#32;to&#32;A&quot;&#32;isenabled=&quot;True&quot;&#32;iconPath=&quot;/_imgs/grid/desc.png&quot;&#32;/&gt;&lt;MenuItem&#32;type=&quot;space&quot;&#32;display=&quot;spacer&quot;&#32;/&gt;&lt;MenuItem&#32;id=&quot;_MIcrmGridaccountnameIsNotNull&quot;&#32;type=&quot;IsNotNull&quot;&#32;display=&quot;Contains&#32;Data&quot;&#32;isenabled=&quot;True&quot;&#32;iconPath=&quot;/_imgs/imagestrips/transparent_spacer2013.gif&quot;&#32;/&gt;&lt;MenuItem&#32;id=&quot;_MIcrmGridaccountnameIsNull&quot;&#32;type=&quot;IsNull&quot;&#32;display=&quot;Contains&#32;No&#32;Data&quot;&#32;isenabled=&quot;True&quot;&#32;iconPath=&quot;/_imgs/imagestrips/transparent_spacer2013.gif&quot;&#32;/&gt;&lt;MenuItem&#32;type=&quot;space&quot;&#32;display=&quot;spacer&quot;&#32;/&gt;&lt;MenuItem&#32;id=&quot;_MIcrmGridaccountnameCustomFilters&quot;&#32;type=&quot;CustomFilters&quot;&#32;display=&quot;Custom&#32;Filter...&quot;&#32;isenabled=&quot;True&quot;&#32;iconPath=&quot;/_imgs/imagestrips/transparent_spacer2013.gif&quot;&#32;/&gt;&lt;/Menu&gt;">
                                                            <div class="ms-crm-FilterPopupMenu-Label">
                                                                <a href="javascript:void(0)" class="ms-crm-FilterPopupMenu-Label" tabindex="0">
                                                                    <div class="ms-crm-Menu-FilterImgWrapper">
                                                                        <img src="/_imgs/imagestrips/transparent_spacer2013.gif?ver=-1057465603" alt="" id="mnuDown"
                                                                            class="ms-crm-Menu-ButtonFilter ms-crm-ImageStrip-dropdown"></div>
                                                                </a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
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
                <img alt="" crmgrid="crmGrid" class="ms-crm-List-ResizeBar ms-crm-ImageStrip-resize"
                    src="/_imgs/imagestrips/transparent_spacer2013.gif?ver=-1057465603" id="crmGrid_resize_accountprimarycontactidcontactcontactid.emailaddress1">
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
