<%@ Control Language="C#" AutoEventWireup="true"  Inherits="Report.Controls.C2013.Grid.StatusBar" %>
<tr class="ms-crm-List-StatusBar">
    <td>
        <table id="gridStatusBarCustom" class="ms-crm-List-StatusBar" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td id="crmGrid_RecordSelectInfoCustom" class="ms-crm-List-StatusBar-Label" nowrap>
                        <span id="crmGrid_FirstItemCustom"><%= CurrentPaging.ToString() %></span> - <span id="crmGrid_LastItemCustom"><%= MaxPaging.ToString() %></span><span
                            style="display: inline" id="crmGrid_TotalCountInfoCustom">&nbsp;of <span id="crmGrid_ItemsTotalCustom">
                                <%= CurrentDataCount.ToString() %></span></span><span id="crmGrid_ItemsSelectedInfoCustom">&nbsp;(<span id="crmGrid_ItemsSelectedCustom">1</span>
                                    selected)</span><span style="visibility: hidden" id="crmGrid_RecordSelectEndMarker">M</span>
                    </td>
                    <td id="crmGrid_PageInfo" class="ms-crm-List-Paging" nowrap>
                        <a style="cursor: auto" id="fastRewind" class="toolbarbutton" disabled tabindex="0"
                            target="_self">
                        <%--    <img id="page_FL0" class="ms-crm-ImageStrip-page_FL0" alt="" align="absMiddle" src="/_imgs/imagestrips/transparent_spacer.gif"
                                temptooltip="Load First Page"></a>--%>
                        <asp:LinkButton ID="LinkButton1" CssClass="toolbarbutton" OnClick="NextPage_Click" CommandName="prev"
                            runat="server">
                                    <img id="page_L0" class="<%= PagePreviousStyle()  %>" disabled hspace="6" alt="" align="absMiddle"
                                        src="/_imgs/imagestrips/transparent_spacer.gif" temptooltip="Load Previous Page"></asp:LinkButton>
                        Page<span id="_PageNum"><%= CurrentPaging.ToString() %></span>
                        <asp:LinkButton ID="lnkNextPage" CssClass="toolbarbutton" OnClick="NextPage_Click" CommandName="next"
                            runat="server"><img id="page_R0"
                              class="<%= PageNextStyle()  %>"  hspace="6" alt="Load Next Page"  align="absMiddle" src="/_imgs/imagestrips/transparent_spacer.gif" temptooltip="Load Next Page"></asp:LinkButton>
                    </td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
