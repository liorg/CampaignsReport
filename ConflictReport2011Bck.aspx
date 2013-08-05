<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConflictReport2011Bck.aspx.cs"
    Inherits="Report.UI.GridReport.ConflictReport2011Bck" %>

<%@ Register TagPrefix="hs" TagName="HeaderSorting" Src="~/Controls/C2011/Grid/HeaderSorting.ascx" %>
<%@ Register TagPrefix="sb" TagName="StatusBar" Src="~/Controls/C2011/Grid/StatusBar.ascx" %>
<%@ Register TagPrefix="das" TagName="DataAreaSorting" Src="~/Controls/C2011/Grid/DataAreaSorting.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; CHARSET=utf-8">
    <title></title>
    <link href="/crm2011/1033/fonts.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/global.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/theme.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/controls.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/select.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/menu.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/notifications.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/CompositeControl.css" rel="stylesheet" type="text/css" />
    <link href="/crm2011/1033/appgrid.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <script src="/scripts/ConflictReport.js" type="text/javascript"></script>
</head>
<body class="stage">
    <form id="form1" runat="server">
    <table class="stdTable" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td style="height: 0%">
                </td>
            </tr>
            <tr height="55">
                <td>
                    <table width="100%" cellpadding="1" cellspacing="1">
                        <tr>
                            <td colspan="5" valign="top" align="center">
                                <b>Conflict Report for campaign :
                                    <asp:Label runat="server" ID="lblNameCamp"></asp:Label></b>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="10%">
                                <asp:Label ID="Label1" runat="server" Text="Proposed Start Date"></asp:Label>
                            </td>
                            <td width="20%">
                                <input id="datepickerProposedStartDate" type="text" runat="server" />
                                <asp:RequiredFieldValidator ID="datepickerProposedStartDateRequired" runat="server"
                                    ControlToValidate="datepickerProposedStartDate" ErrorMessage="Proposed Start Date s mandatory please complete the data and run the report again."
                                    ToolTip="Proposed Start Date is required." ValidationGroup="datepickerGroup">*</asp:RequiredFieldValidator>
                            </td>
                            <td valign="top" width="10%">
                                <asp:Label ID="Label2" runat="server" Text="Proposed End Date"></asp:Label>
                            </td>
                            <td width="20%">
                                <input id="datepickerProposedEndDate" type="text" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="datepickerProposedEndDate"
                                    ErrorMessage="Proposed End Date s mandatory please complete the data and run the report again."
                                    ToolTip="Proposed End Date is required." ValidationGroup="datepickerGroup">*</asp:RequiredFieldValidator>
                            </td>
                            <td width="40%" valign="top">
                                <asp:Button runat="server" Text="Run Report" ID="ExecuteBtn" Style="width: 80px;"
                                    ValidationGroup="datepickerGroup" OnClick="ExecuteBtnClick" />
                                <input type="button" value="Clear" title="Clear" style="width: 80px;" onclick="ClearField()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="stdTable">
                    <span id="crmGrid_visualizationCompositeControl">
                        <table id="crmGrid" class="ms-crm-ListControl" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <div style="height: 99.9%">
                                            <table class="ms-crm-ListArea" cellspacing="0" cellpadding="0">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div style="overflow-x: hidden; width: 100%; margin-left: 0px" id="fixedrow">
                                                                <hs:HeaderSorting OnFieldNameSortingEventHandler="FieldNameSortingChange" runat="server"
                                                                    ID="sHeaderSorting"></hs:HeaderSorting>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr height="100%" valign="top">
                                                        <td>
                                                            <div id="crmGrid_divDataBody" class="ms-crm-List-DataBody">
                                                                <table class="ms-crm-ListArea" cellspacing="0" cellpadding="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td id="tdDataArea" valign="top">
                                                                                <div id="crmGrid_divDataArea" class="ms-crm-List-DataAreaNoOverFlowX">
                                                                                    <div>
                                                                                        <asp:ListView ID="CampaignsConflitListView" runat="server" OnItemDataBound="CampaignsConflitListViewDataBound">
                                                                                            <LayoutTemplate>
                                                                                                <table style="border-bottom-style: none; border-left-style: none; border-collapse: collapse;
                                                                                                    border-top-style: none; border-right-style: none" id="gridBodyTable" class="ms-crm-List-Data"
                                                                                                    tabindex="0" border="1" cellspacing="0" summary="This list contains 50 Campign Conflict Contacts Item records."
                                                                                                    cellpadding="1">
                                                                                                    <das:DataAreaSorting ID="sDataAreaSorting" runat="server"></das:DataAreaSorting>
                                                                                                    <tbody>
                                                                                                        <tr runat="server" id="itemPlaceholder" class="ms-crm-List-Row" />
                                                                                                </table>
                                                                                            </LayoutTemplate>
                                                                                            <ItemTemplate>
                                                                                                <tr id="row" class="ms-crm-List-Row" runat="server">
                                                                                                </tr>
                                                                                            </ItemTemplate>
                                                                                        </asp:ListView>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <sb:StatusBar runat="server" ID="sStatusbar" OnPagingEventHandler="PagingChange">
                                                                        </sb:StatusBar>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </span>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
