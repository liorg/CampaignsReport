<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="~/Controls/C2011/Grid/StatusBar.ascx.cs"
    Inherits="Report.Controls.C2011.Grid.StatusBar" %>
<tr class="ms-crm-List-StatusBar">
    <td>
        <table id="gridStatusBar" class="ms-crm-List-StatusBar" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td id="crmGrid_RecordSelectInfo" class="ms-crm-List-StatusBar-Label" nowrap>
                        <span id="crmGrid_FirstItem">
                            <%= CurrentPaging.ToString() %></span> - <span id="crmGrid_LastItem">
                                <%= MaxPaging.ToString() %></span><span style="display: inline" id="crmGrid_TotalCountInfo">&nbsp;of
                                    <span id="crmGrid_ItemsTotal">
                                        <%= CurrentDataCount.ToString() %></span></span><span id="crmGrid_ItemsSelectedInfo">&nbsp;(<span
                                            id="crmGrid_ItemsSelected">1</span> selected)</span><span style="visibility: hidden"
                                                id="crmGrid_RecordSelectEndMarker">M</span>
                    </td>
                    <td id="crmGrid_PageInfo" class="ms-crm-List-Paging" nowrap>
                        <a style="cursor: auto" id="fastRewind" class="toolbarbutton" disabled tabindex="0"
                            target="_self">
                     <%--       <img id="page_FL0" class="ms-crm-ImageStrip-page_FL0" alt="" align="absMiddle" src="/_imgs/imagestrips/transparent_spacer.gif"
                                temptooltip="Load First Page"></a>--%>
                        <asp:LinkButton ID="LinkButton1" CssClass="toolbarbutton" OnClick="NextPage_Click"
                            CommandName="prev" runat="server">
                                    <img id="page_L0" class="<%= PagePreviousStyle()  %>" 
                                     disabled hspace="6" alt="" align="absMiddle"
                                        src="/_imgs/imagestrips/transparent_spacer.gif" temptooltip="Load Previous Page"></asp:LinkButton>
                        Page<span id="_PageNum"><%= CurrentPaging.ToString() %></span>
                        <%-- <a style="cursor: hand" id="_nextPageImg" class="toolbarbutton" tabindex="0" href="javascript:onclick();" target="_self">
                            <img id="page_R0" class="ms-crm-ImageStrip-page_R1" hspace="6" alt="Load Next Page"  align="absMiddle" src="/_imgs/imagestrips/transparent_spacer.gif" temptooltip="Load Next Page"></a>&nbsp;
                        --%>
                        <asp:LinkButton ID="lnkNextPage" CssClass="toolbarbutton" OnClick="NextPage_Click"
                            CommandName="next" runat="server"><img id="page_R0"   class="<%= PageNextStyle()  %>"  hspace="6" alt="Load Next Page"  align="absMiddle" src="/_imgs/imagestrips/transparent_spacer.gif" temptooltip="Load Next Page"></asp:LinkButton>
                    </td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
