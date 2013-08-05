<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConflictReport2013Bck.aspx.cs" 
    Inherits="Report.UI.GridReport.ConflictReport2013Bck" %>

<%@ Register TagPrefix="hs" TagName="HeaderSorting" Src="~/Controls/C2013/Grid/HeaderSorting2013.ascx"%>
<%@ Register TagPrefix="sb" TagName="StatusBar" Src="~/Controls/C2013/Grid/StatusBar.ascx" %>
<%@ Register TagPrefix="das" TagName="DataAreaSorting" Src="~/Controls/C2013/Grid/DataAreaSorting.ascx" %>
<%@ Register TagPrefix="bb" TagName="RefreshButton2013" Src="~/Controls/C2013/Grid/RefreshButton2013.ascx" %>
<%@ Register TagPrefix="jb" TagName="JumpBar" Src="~/Controls/C2013/Grid/JumpBar.ascx" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; CHARSET=utf-8">
    <title></title>
    <script type='text/javascript' src='/crm2013/js/PageLoader.js'></script>
    <script type='text/javascript'>
        var LoadStartTime = new Date().getTime();
        function markRenderTime() {
            if (!document || !document.body || document.readyState !== 'complete') {
                window.setTimeout(markRenderTime, 0);
            }
            else {
                if (!window.PostRenderTime) {
                    window.PostRenderTime = (new Date()).getTime();
                }
            }
        }
        window.setTimeout(markRenderTime, 0);
                                
    </script>
    <link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <script src="scripts/ConflictReport.js" type="text/javascript"></script>
    <link href="/crm2013/classicStyleFF2013/1033/fonts.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/global.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/theme.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/controls.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/select.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/menu.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/CompositeControl.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyleFF2013/1033/appgrid.css" rel="stylesheet" type="text/css" />
    <script src="scripts/ConflictReport.js" type="text/javascript"></script>
</head>
<body class="stage">
    <form id="form1" runat="server">
       
    <div class="stdTable">
        <div>
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
        </div>
        <div id="homepageTableCell" class="ms-crm-absolutePosition" style="top: 90px;">
            <div class="ms-crm-IE7-Height-Fix-Dummy-Container">
                <div id="crmGrid_visualizationCompositeControl" style="height: 100%;">
                    <div id="crmGrid_compositeControl" style="height: 100%; width: 100%; position: relative;">
                        <div id="crmGrid_crmGridTD" class="ms-crm-CC-grid-All-0-LR">
                            <div class="ms-crm-IE7-Height-Fix-Dummy-Container">
                                <div style="width: 100%; height: 100%; position: relative; overflow: hidden;">
                                    <div id="crmGrid" class="ms-crm-ListControl" type="crmGrid">
                                        <div class="ms-crm-grid-body" style="bottom: 25px;">
                                            <div class="ms-crm-IE7-Height-Fix-Dummy-Container">
                                                <div style="height: 100%; position: relative" id="crmGrid_gridBodyContainer">
                                                 <bb:RefreshButton2013 ID="refreshButton20131" runat="server" OnRefreshHandler="RefreshHandler"  />
                                                    <div class="ms-crm-ListArea" style="position: relative">
                                                        <div style="height: 22px; overflow-x: hidden;">
                                                            <div id="fixedrow" class="ms-crm-ListArea-FixedRow">
                                                                <hs:HeaderSorting OnFieldNameSortingEventHandler="FieldNameSortingChange" runat="server"
                                                                    
                                                                    ID="sHeaderSorting"></hs:HeaderSorting>
                                                            </div>
                                                        </div>
                                                        <div class="ms-crm-grid-databodycontainer" style="top: 22px; bottom: 22px; vertical-align: top">
                                                            <div class="ms-crm-IE7-Height-Fix-Dummy-Container">
                                                                <div id="crmGrid_divDataBody" class="ms-crm-List-DataBody">
                                                                    <div id="crmGrid_divDataArea" expandable="0" class="ms-crm-List-DataArea">
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
                                                                        <div id="divMenu">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ms-crm-List-StatusBar" id="crmGrid_StatusBar">
                                                            <div>
                                                                <sb:StatusBar runat="server" ID="sStatusbar" OnPagingEventHandler="PagingChange">
                                                                </sb:StatusBar>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ms-crm-grid-footer">
                                          <jb:JumpBar ID="jumpBar1" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script type="text/javascript">
        var LOCID_IPADWINCLOSED = 'An error has occurred. Please return to the home page and try again.';
        var LOCID_ENTUTL_CONFIRMDEL = 'Deleting an entity cannot be reversed. All records for the entity, including notes related to the entity, will be deleted. If post plug-ins are set on record deletion, they will not run. To delete this entity, click OK. To cancel the deletion, click Cancel.';
        var LOCID_AF_EQUALSCURRENTUSER = 'Equals Current User';
        var LOCID_AF_DOESNOTEQUALCURRENTUSER = 'Does Not Equal Current User';
        var LOCID_AF_EQUALSCURRENTUSERTEAMS = 'Equals Current User\x27s Teams';
        var LOCID_VPD_NAMETEMPLATEWITHTOP = 'Top \x7b0\x7d\x3a \x7b1\x7d by \x7b2\x7d';
        var LOCID_VPD_NAMETEMPLATEWITHBOTTOM = 'Bottom \x7b0\x7d\x3a \x7b1\x7d by \x7b2\x7d';
        var LOCID_VPD_SERIESNAMETEMPLATE = '\x7b0\x7d';
        var LOCID_VPD_MULSERIESNAMETEMPLATE = '\x7b0\x7d, \x7b1\x7d';
        var LOCID_VPD_CATEGORYNAMETEMPLATE = '\x7b0\x7d';
        var LOCID_VPD_MULCATEGRYNAMETEMPLATE = '\x7b0\x7d and \x7b1\x7d';
        var LOCID_VPD_ELLIPSISNAMETEMPLATE = '\x7b0\x7d ...';
        var LOCID_VPD_TOPICON_TOOLTIP_TOP = 'Displays top \x7b0\x7d \x7b1\x7d records.';
        var LOCID_VPD_TOPICON_TOOLTIP_BOTTOM = 'Displays bottom \x7b0\x7d \x7b1\x7d records.';
        var LOCID_VPD_TEXTBOXALERT = 'The specified value is invalid. Specify a numeric value that is greater than or equal to 1.';
        var LOCID_CHART_ICON_TOOLTIP = 'Current chart type\x3a \x7b0\x7d. Click here to change the chart type.';
        var LOCID_COLUMN_CHART = 'Column';
        var LOCID_STACKEDCOLUMN_CHART = 'Stacked Column';
        var LOCID_STACKEDCOLUMN100_CHART = '100\x25 Stacked Column';
        var LOCID_BAR_CHART = 'Bar';
        var LOCID_STACKEDBAR_CHART = 'Stacked Bar';
        var LOCID_STACKEDBAR100_CHART = '100\x25 Stacked Bar';
        var LOCID_AREA_CHART = 'Area';
        var LOCID_STACKEDAREA_CHART = 'Stacked Area';
        var LOCID_STACKEDAREA100_CHART = '100\x25 Stacked Area';
        var LOCID_LINE_CHART = 'Line';
        var LOCID_PIE_CHART = 'Pie';
        var LOCID_FUNNEL_CHART = 'Funnel';
        var LOCID_TOPBOTTOM_ICON = 'Apply Top\x2fBottom Rule';
        var LOCID_TOP_ICON = 'Top \x7b0\x7d items';
        var LOCID_BOTTOM_ICON = 'Bottom \x7b0\x7d items';
        var LOCID_UI_DIR = 'LTR';
        var LOCID_ACTION_UNSUPPORTED_ERROR = 'This action is not supported.';
        var LOCID_UNSUPPORTED_RIBBONACTION = 'This action is not supported on the browser that you are using.';
        var LOCID_LOOKUP_LABEL_FOR_EDIT = '\x7b0\x7d \x7b1\x7d';
        var LOCID_FIRST_WEEK_SELECT = 'FirstDay';
        var LOCID_DELETE_CONFIRM_ONE = 'If you delete this resource and it is used in a service, then the service may no longer have enough resources to be scheduled.';
        var LOCID_DELETE_CONFIRM_TWO = 'Are you sure you want to delete this facility\x2fequipment\x3f';
        var LOCID_EMAIL_NORECORDS_MSG = 'Direct e-mail cannot be sent because no records were returned for the current view. You need to select a different view or record\x28s\x29 to be able to send direct e-mail.';
        var LOCID_USERS_TOO_MANY = 'You can only perform this action for one user at a time.';
        var LOCID_INCOM_TYPE_CAMP = 'You cannot perform this action for campaign activities.';
        var LOCID_INCOM_TYPE_EMAIL = 'You cannot perform this action for e-mail activities.';
        var LOCID_HETROGENEOUS_ACTIVITY = 'You can only perform this action for activities of the same type.';
        var LOCID_EMPTY_GRID_MESSAGE = 'To enable this content, save the record.';
        var LOCID_EMPTY_GRID_MESSAGE_REFRESH = 'To enable this content, create the record.';
        var LOCID_LOADING_GRID_DATA_REFRESH = 'Loading records';
        var LOCID_GRID_TOO_MANY_RECORDS_IWF = 'You can select only one record at a time for this action.';
        var LOCID_MINICAMP_NORECORDS_MSG = 'Quick Campaign cannot be created because no records were found on the current page.';
        var LOCID_MINICAMP_TOOMANY_RECORDS = 'You cannot create a Quick Campaign for more than one marketing list at a time.  Please select only one marketing list.';
        var LOCID_MINICAMP_CANNOT_RUN = 'This option is not available for the current view. Not all views will work with the option For All Records on All Pages. Select a different view or a different Quick Campaign option and try again.';
        var LOCID_QC_CANNOT_RUN_ASSO = 'This option is not available for the current view. Select a different Quick Campaign option and try again.';
        var LOCID_MC_CANNOT_RUN_INACTLST = 'Quick campaigns cannot be run on a Marketing List that is inactive. Activate the Marketing List or select a different Marketing List, and try again.';
        var LOCID_DEDUPE_CANNOT_RUN = 'This option is not available for the current view. Not all views will work with the option For All Records on All Pages. Select a different view or a different Duplicate Detection option and try again.';
        var LOCID_GRID_UNSELECTED_CHECKBOX = 'The record is not selected.';
        var LOCID_GRID_SELECTED_CHECKBOX = 'The record is selected.';
        var LOCID_GRID_NO_VIEW_NAME = 'Not Available';
        var LOCID_GRID_EXACTTOTALCOUNT = '\x7b0\x7d';
        var LOCID_GRID_APPROXTOTALCOUNT = '\x7b0\x7d\x2b';
        var LOCID_BU_CANNOTDISABLE = 'It has been detected that this operation would deactivate all remaining business units and cannot proceed.';
        var LOCID_GRID_TOO_MANY_RECORDS_1 = 'You can select only 1 row.';
        var LOCID_DOWNLOADMAP_ERROR = 'You can only download one data map at a time.';
        var LOCID_DWNLDMAP_SLCT_ONERECORD = 'Select a data map to export.';
        var LOCID_REMOTECOMMAND_ERROR = 'An error has occurred. Try this action again. If the problem continues, check the Microsoft Dynamics CRM Community for solutions or contact your organization\x27s Microsoft Dynamics CRM Administrator. Finally, you can contact Microsoft Support.';
        var LOCID_NON_SRS_FILTERSCHEDULE = 'Only SQL Server Reporting Services reports can be filtered or scheduled.';
        var WEB_APP_URL = '';
        var READ_FORM_ENABLED = false;
        var HELP_SKU = 'OP';
        var IS_OUTLOOK_LAPTOP_CLIENT = false;
        var IS_OUTLOOK_14_CLIENT = false;
        var CLIENT_MAJOR_VERSION = 5;
        var _currentTypeCode = 1;
        var _ISFLATUIPAGE = true;
        var GF_MAXRECORDS_LOOKUP = 300;
        var LOCID_LOADING_CRMGRID = 'Loading Account records...';
        var CAN_CUSTOMIZE_VISUALIZATION = true;
        var WEB_RESOURCE_ORG_VERSION_NUMBER = '\x7b634878475480000000\x7d';
        var _DebugOnScriptError = false;
        var ORG_UNIQUE_NAME = 'Contoso';
        var ORG_ID = '\x7b2EFF826E-6D28-E211-ABB5-00155DA8FB3A\x7d';
        var USE_READ_FORM = true;
        var IS_PATHBASEDURLS = true;
        var USER_HELP_LCID = 1033;
        var USER_LANGUAGE_CODE = 1033;
        var IS_OUTLOOK_CLIENT = false;
        var IS_UEIP_ENABLED = true;
        var IS_ONLINE = true;
        var VERSION_STAMP = -1057465603;
        var ISV_ADDITIONAL_AUTH = '';
        var FeatureControl = { "FCB.Refresh.Fall": true, "FCB.Refresh.Sales": true, "FCB.Refresh.Common": true, "FCB.Refresh.Service": true };
        var REQ_ID = '3c21bc68-1cda-4458-80f1-62e471a4cfd4';
        var IS_LIVE = false;
        var IS_ONPREMISE = true;
        var IS_SPLA = false;
        var IS_CLAIMS = false;
        var _ErrorCodesIsvAborted = '0x80040265';
        var ScriptErrorReportingPreference = 1;
        var _bPresenceEnabled = true;
        var ORG_LANGUAGE_CODE = 1033;
        var ORG_FULLNAME_FORMAT = 1;
        var ORG_IS_APP_MODE = false;
        var SERVER_URL = 'http\x3a\x2f\x2fdynamics01\x2fContoso';
        var AUTHENTICATION_TYPE = 0;
        var CRM2007_WEBSERVICE_NS = 'http\x3a\x2f\x2fschemas.microsoft.com\x2fcrm\x2f2007\x2fWebServices';
        var CRM2007_CORETYPES_NS = 'http\x3a\x2f\x2fschemas.microsoft.com\x2fcrm\x2f2007\x2fCoreTypes';
        var CURRENT_THEME_TYPE = 'Outlook15White';
        var CURRENT_WEB_THEME = 'Default';
        var USER_ROLES = ['5cc30182-6d28-e211-abb5-00155da8fb3a'];
        var USER_GUID = '\x7bD2D40182-6D28-E211-ABB5-00155DA8FB3A\x7d';
        var ORG_DATE_START_DAY = 0;
        var USER_DATE_FORMATSTRING = 'M\x2fd\x2fyyyy';
        var USER_DATE_SEPARATOR = '\x2f';
        var USER_DATE_FORMATTED_FORMATSTRING = 'M\x2fd\x2fyyyy';
        var USER_DATE_START_DAY = 0;
        var USER_TIME_FORMAT = 'h\x3amm tt';
        var USER_SHOW_WEEK_NUMBER = false;
        var ORG_TIMEZONE_OFFSET = -480;
        var __cultureInfo = { "dateTimeFormat": { "AMDesignator": "AM", "Calendar": { "MinSupportedDateTime": "\/Date(-62135568000000)\/", "MaxSupportedDateTime": "\/Date(253402300799999)\/", "AlgorithmType": 1, "CalendarType": 1, "Eras": [1], "TwoDigitYearMax": 2029, "IsReadOnly": false }, "DateSeparator": "/", "FirstDayOfWeek": 0, "CalendarWeekRule": 0, "FullDateTimePattern": "dddd, MMMM dd, yyyy h:mm:ss tt", "LongDatePattern": "dddd, MMMM dd, yyyy", "LongTimePattern": "h:mm:ss tt", "MonthDayPattern": "MMMM dd", "PMDesignator": "PM", "RFC1123Pattern": "ddd, dd MMM yyyy HH\u0027:\u0027mm\u0027:\u0027ss \u0027GMT\u0027", "ShortDatePattern": "M/d/yyyy", "ShortTimePattern": "h:mm tt", "SortableDateTimePattern": "yyyy\u0027-\u0027MM\u0027-\u0027dd\u0027T\u0027HH\u0027:\u0027mm\u0027:\u0027ss", "TimeSeparator": ":", "UniversalSortableDateTimePattern": "yyyy\u0027-\u0027MM\u0027-\u0027dd HH\u0027:\u0027mm\u0027:\u0027ss\u0027Z\u0027", "YearMonthPattern": "MMMM, yyyy", "AbbreviatedDayNames": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], "ShortestDayNames": ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"], "DayNames": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], "AbbreviatedMonthNames": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""], "MonthNames": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""], "IsReadOnly": false, "NativeCalendarName": "Gregorian Calendar", "AbbreviatedMonthGenitiveNames": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""], "MonthGenitiveNames": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""] }, "eras": [1, "A.D.", null, 0], "name": "en-US", "numberFormat": { "CurrencyDecimalDigits": 2, "CurrencyDecimalSeparator": ".", "IsReadOnly": false, "CurrencyGroupSizes": [3], "NumberGroupSizes": [3], "PercentGroupSizes": [3], "CurrencyGroupSeparator": ",", "CurrencySymbol": "$", "NaNSymbol": "NaN", "CurrencyNegativePattern": 0, "NumberNegativePattern": 1, "PercentPositivePattern": 0, "PercentNegativePattern": 0, "NegativeInfinitySymbol": "-Infinity", "NegativeSign": "-", "NumberDecimalDigits": 2, "NumberDecimalSeparator": ".", "NumberGroupSeparator": ",", "CurrencyPositivePattern": 0, "PositiveInfinitySymbol": "Infinity", "PositiveSign": "+", "PercentDecimalDigits": 2, "PercentDecimalSeparator": ".", "PercentGroupSeparator": ",", "PercentSymbol": "%", "PerMilleSymbol": "‰", "NativeDigits": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], "DigitSubstitution": 1} };
        var HELP_SERVER_URL = '';
        var HELP_REDIRECT_AVAILABLE = false;
        var WEB_SERVER_HOST = 'dynamics01';
        var WEB_SERVER_PORT = 80;
        var APPLICATION_VERSION = '5.0';
        var APPLICATION_FULL_VERSION = '5.0.9690.3201';
        var IMAGE_STRIPS_ENABLED = true;
        var DEF_SOL_ID = '\x7bfd140aaf-4df4-11dd-bd17-0019b9312238\x7d';
        var MARKERS_CACHE_ID = '3c21bc68-1cda-4458-80f1-62e471a4cfd4';
        var _sWebServicesNamespace = 'http\x3a\x2f\x2fschemas.microsoft.com\x2fcrm\x2f2009\x2fWebServices';
        var ERRORCODE_ETM = '0x8004A001';
        var EDIT_PRELOAD = true;
        var _aWrpcTokens = {};
        var initialFormXml = '';
        var APP_SOLUTION_ID = '';
    </script>
    <script type="text/javascript">
        window.initActionQueueParams = {};
        function SetPLTMarker() {
            if (!window.PostRenderTime) { window.PostRenderTime = (new Date()).getTime(); }
        }
        function LoadGlobalJSAndScriptResourceJS() {
            loadScriptAdv('/crm2013/js/global.js', '/crm2013/js/global.js', false);
            loadScriptAdv('/crm2013/js/ScriptResx.js', '/crm2013/js/ScriptResx.js', false);

        }
        function WaitGlobalJSAndScriptResourceJsScriptsToLoad() {
            waitForJScriptsToLoad();
        }
        function LoadJsScripts() {
            loadScriptAdv('/crm2013/js/entitypropertiesutil.js', '/crm2013/js/entitypropertiesutil.js', false);
            loadScriptAdv('/crm2013/js/stage.js', '/crm2013/js/stage.js', false);
            loadScriptAdv('/crm2013/js/homepage.js', '/crm2013/js/homepage.js', false);
            loadScriptAdv('/crm2013/js/form.js', '/crm2013/js/form.js', false);
            loadScriptAdv('/crm2013/js/select.js', '/crm2013/js/select.js', false);
            loadScriptAdv('/crm2013/js/GridControl.js', '/crm2013/js/GridControl.js', false);
            loadScriptAdv('/crm2013/js/HintText.js', '/crm2013/js/HintText\HintText.js', false);
            loadScriptAdv('/crm2013/js/GlowingImage.js', '/crm2013/js/GlowingImage.js', false);
            loadScriptAdv('/crm2013/js/commandbar.js', '/crm2013/js/commandbar.js', false);
            loadScriptAdv('/crm2013/js/compositecontrol.js', '/crm2013/js/compositecontrol.js', false);
            loadScriptAdv('/crm2013/js/MenuSelector.js', '/crm2013/js/MenuSelector.js', false);
            loadScriptAdv('/crm2013/js/GridFilters.js', '/crm2013/js/GridFilters.js', false);
            loadScriptAdv('/crm2013/js/lookup.js', '/crm2013/js/lookup.js', false);
            loadScriptAdv('/crm2013/js/lookupbehavior.js', '/crm2013/js/lookupbehavior.js', false);
            loadScriptAdv('/crm2013/js/checkbox.js', '/crm2013/js/checkbox.js', false);
            loadScriptAdv('/crm2013/js/visualizationactions.js', '/crm2013/js/visualizationactions.js', false);
            loadScriptAdv('/crm2013/js/visualizationpane.js', '/crm2013/js/visualizationpane.js', false);
            loadScriptAdv('/crm2013/js/TextInputBehavior.js', '/crm2013/js/TextInputBehavior.js', false);
            loadScriptAdv('/crm2013/js/Ribbon_main_system_library.js', '/crm2013/js/Ribbon_main_system_library.js', false);
            loadScriptAdv('/crm2013/js/RibbonLayout.js', '/crm2013/js/RibbonLayout.js', false);
            loadScriptAdv('/crm2013/js/ribbon.js', '/crm2013/js/ribbon.js', false);
            loadScriptAdv('/crm2013/js/\RibbonActions.js', '/crm2013/js/RibbonActions.js', false);
            loadScriptAdv('/crm2013/js/presence.js', '/crm2013/js/presence.js', false);
            loadScriptAdv('/crm2013/js/action.js', '/crm2013/js/action.js', false);
            loadScriptAdv('/crm2013/js/addrelated.js', '/crm2013/js/addrelated.js', false);

        }
        function WaitRemainingJsScriptsToLoad() {
            waitForJScriptsToLoad();
        }
        function InitControls() {
            Sys.Application.beginCreateComponents();
            crmCreate(Mscrm.GridSizeCalculator, { "subscribedEvents": [9] }, null, { "eventManager": "__Page_crmEventManager" }, $get('homepageTableCell'));
            crmCreate(Mscrm.PageManager, { "id": "crmPageManager", "mode": "iframe", "executeDeferredActionsOnDemand": false, "deferredActionList": [], "deferredActionParameters": [], "pageOnLoadScriptList": [], "rootElement": "" }, null, { "eventManager": "__Page_crmEventManager" }, null);
            crmCreate(Mscrm.EventManager, { "eventSubscribers": [], "childEventManagerIds": null, "parentEventManagerId": "", "id": "__Page_crmEventManager" }, null, {}, null);
            crmCreate(Mscrm.GridViewSelector, { "showNewVSControl": true, "showOriginalSelectBox": false, "viewEntityName": "account", "selectedSavedQuery": "{00000000-0000-0000-00AA-000010001001}", "selectedSavedQueryName": "My Active Accounts", "selectedSavedQueryType": "1039", "userSelectedDefaultView": "", "userOwnedView": "{00000000-0000-0000-00AA-000010001001}", "quickFindQuery": "{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}", "createPersonalViewEnabled": true, "systemViewsXml": "<savedqueries morerecords=\"0\" totalrecordcount=\"-1\" totalrecordcountlimitexceeded=\"0\" paging-cookie=\"&lt;cookie page=&quot;1&quot;&gt;&lt;name last=&quot;Quick Find Active Accounts&quot; first=&quot;Accounts Being Followed&quot; \/&gt;&lt;savedqueryid last=&quot;{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}&quot; first=&quot;{61273827-328E-E011-95AE-00155D9CFA03}&quot; \/&gt;&lt;\/cookie&gt;\"><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{61273827-328E-E011-95AE-00155D9CFA03}<\/savedqueryid><name>Accounts Being Followed<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{61273827-328E-E011-95AE-00155D9CFA02}<\/savedqueryid><name>Accounts I Follow<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{15C63745-0A6E-4322-8416-A62C84D90279}<\/savedqueryid><name>Accounts: Influenced Deals That We Won<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{CFBCD7AF-AEE5-4E45-8ECC-C040D4020581}<\/savedqueryid><name>Accounts: No Campaign Activities in Last 3 Months<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{C147F1F7-1D78-4D10-85BF-7E03B79F74FA}<\/savedqueryid><name>Accounts: No Orders in Last 6 Months<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{49FB9771-09E1-4E70-B193-198752493577}<\/savedqueryid><name>Accounts: Responded to Campaigns in Last 6 Months<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{00000000-0000-0000-00AA-000010001002}<\/savedqueryid><name>Active Accounts<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{00000000-0000-0000-00AA-000010001031}<\/savedqueryid><name>Inactive Accounts<\/name><\/savedquery><savedquery><isdefault name=\"Yes\">true<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{00000000-0000-0000-00AA-000010001001}<\/savedqueryid><name>My Active Accounts<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{D234426E-1F37-4944-9255-50E19B541C4C}<\/savedqueryid><name>My Connections<\/name><\/savedquery><savedquery><isdefault name=\"Yes\">true<\/isdefault><isquickfindquery name=\"Yes\">true<\/isquickfindquery><savedqueryid>{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}<\/savedqueryid><name>Quick Find Active Accounts<\/name><\/savedquery><\/savedqueries>", "userViewsXml": "", "systemViewsLabel": "System Views", "userViewsLabel": "My Views", "customViewsLabel": "Custom Views", "renderForPrint": false, "isActivitiesViewSelector": false, "activityList": [{ "Id": "00000000-0000-0000-0000-000000000000", "Name": "All Activities", "TypeCode": 4200, "TypeDisplayName": null, "TypeName": "activitypointer" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Task", "TypeCode": 4212, "TypeDisplayName": null, "TypeName": "task" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Fax", "TypeCode": 4204, "TypeDisplayName": null, "TypeName": "fax" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Phone Call", "TypeCode": 4210, "TypeDisplayName": null, "TypeName": "phonecall" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "E-mail", "TypeCode": 4202, "TypeDisplayName": null, "TypeName": "email" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Letter", "TypeCode": 4207, "TypeDisplayName": null, "TypeName": "letter" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Appointment", "TypeCode": 4201, "TypeDisplayName": null, "TypeName": "appointment" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Service Activity", "TypeCode": 4214, "TypeDisplayName": null, "TypeName": "serviceappointment" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Campaign Response", "TypeCode": 4401, "TypeDisplayName": null, "TypeName": "campaignresponse" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Campaign Activity", "TypeCode": 4402, "TypeDisplayName": null, "TypeName": "campaignactivity" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Recurring Appointment", "TypeCode": 4251, "TypeDisplayName": null, "TypeName": "recurringappointmentmaster"}], "selectOptionsXml": "<select  GridId=\"crmGrid\" quickFindQuery=\"{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}\" id=\"crmGrid_SavedNewQuerySelector\" name=\"crmGrid_SavedNewQuerySelector\" class=\"ms-crm-SelectBox&#32;\" onchange=\"handleView(this,&#32;$find(&#39;crmGrid&#39;))\"><OPTGROUP  LABEL=\"System&#32;Views\" id=\"AppSystemViews\"><option value=\"{61273827-328E-E011-95AE-00155D9CFA03}\" Type=\"1039\">Accounts Being Followed<\/option><option value=\"{61273827-328E-E011-95AE-00155D9CFA02}\" Type=\"1039\">Accounts I Follow<\/option><option value=\"{15C63745-0A6E-4322-8416-A62C84D90279}\" Type=\"1039\">Accounts: Influenced Deals That We Won<\/option><option value=\"{CFBCD7AF-AEE5-4E45-8ECC-C040D4020581}\" Type=\"1039\">Accounts: No Campaign Activities in Last 3 Months<\/option><option value=\"{C147F1F7-1D78-4D10-85BF-7E03B79F74FA}\" Type=\"1039\">Accounts: No Orders in Last 6 Months<\/option><option value=\"{49FB9771-09E1-4E70-B193-198752493577}\" Type=\"1039\">Accounts: Responded to Campaigns in Last 6 Months<\/option><option value=\"{00000000-0000-0000-00AA-000010001002}\" Type=\"1039\">Active Accounts<\/option><option value=\"{00000000-0000-0000-00AA-000010001031}\" Type=\"1039\">Inactive Accounts<\/option><option value=\"{00000000-0000-0000-00AA-000010001001}\" Type=\"1039\" isUserOwned=\"true\">My Active Accounts<\/option><option value=\"{D234426E-1F37-4944-9255-50E19B541C4C}\" Type=\"1039\">My Connections<\/option><\/OPTGROUP><\/select>", "createPersonalViewLabel": "Create Personal View", "subscribedEvents": [62, 14, 47] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid_SavedNewQuerySelector'));
            crmCreate(Microsoft.Crm.CommandBar.MenuBarControl, {}, null, {}, $get('mnuBar1'));
            crmCreate(Mscrm.CompositeControlResizeControl, { "subscribedEvents": [27, 26, 28, 9, 70, 53] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid_splitTD'));
            crmCreate(Mscrm.CompositeControl, { "subscribedEvents": [27, 26, 28, 9, 70, 53] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid_visualizationCompositeControl'));
            crmCreate(Mscrm.GridControl, { "subscribedEvents": [42, 4, 50, 38, 9] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid'));

            crmCreate(Mscrm.RibbonData, { "serverInformation": { "CommandIds": ["|NoRelationship||Mscrm.DynamicMenu.NewActivity.task", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.fax", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.phonecall", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.email", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.letter", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.appointment", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.serviceappointment", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.campaignresponse", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.recurringappointmentmaster", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.account", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.contact", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.lead", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.opportunity", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.competitor", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.incident", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.kbarticle", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.quote", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.salesorder", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.invoice", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.product", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.salesliterature", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.list", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.goal", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.metric", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.goalrollupquery", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.contract", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.service", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.campaign", "|NoRelationship||Mscrm.BasicHomeTab", "|NoRelationship||Mscrm.Enabled", "|NoRelationship||Mscrm.DynamicMenu.NewActivity", "|NoRelationship||Mscrm.DynamicMenu.NewRecord", "|NoRelationship||Mscrm.ImportData", "|NoRelationship||Mscrm.OpenAdvancedFind", "|NoRelationship||Mscrm.OutlookHelp", "|NoRelationship||Mscrm.Ribbon.TabSwitch", "|NoRelationship||Mscrm.Ribbon.RootEvent", "|NoRelationship||Mscrm.Jewel", "account|NoRelationship|HomePageGrid|Mscrm.ReportsMenu.NoReportsAvailable", "account|NoRelationship|HomePageGrid|Mscrm.ReportsMenu.RunReport.Grid", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.MainTab", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.MainTab", "account|NoRelationship|HomePageGrid|Mscrm.Enabled", "account|NoRelationship|HomePageGrid|Mscrm.NewRecordFromGrid", "account|NoRelationship|HomePageGrid|Mscrm.EditSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.Activate", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.Deactivate", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DeleteSplitButtonCommand", "account|NoRelationship|HomePageGrid|Mscrm.DeleteSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.BulkDelete", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DetectDupes", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DetectDupesSelected", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DetectDupesAll", "account|NoRelationship|HomePageGrid|Mscrm.AddEmailToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddConnectionGrid", "account|NoRelationship|HomePageGrid|Mscrm.AddConnectionToMeGrid", "account|NoRelationship|HomePageGrid|Mscrm.AddSelectedToQueue", "account|NoRelationship|HomePageGrid|Mscrm.AssignSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.ShareSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.CopyShortcutSelected.EnabledInIEBrowser", "account|NoRelationship|HomePageGrid|Mscrm.CopyShortcutSelected", "account|NoRelationship|HomePageGrid|Mscrm.CopyShortcutView", "account|NoRelationship|HomePageGrid|Mscrm.SendShortcutSelected.AlwaysEnabled", "account|NoRelationship|HomePageGrid|Mscrm.SendShortcutSelected", "account|NoRelationship|HomePageGrid|Mscrm.SendShortcutView", "account|NoRelationship|HomePageGrid|Mscrm.RunWorkflowSelected", "account|NoRelationship|HomePageGrid|Mscrm.RunInteractiveWorkflowSelected", "account|NoRelationship|HomePageGrid|Mscrm.ReportMenu.Grid", "account|NoRelationship|HomePageGrid|Mscrm.ReportsMenu.Populate.Grid", "account|NoRelationship|HomePageGrid|Mscrm.ExportToExcel", "account|NoRelationship|HomePageGrid|Mscrm.ImportDataSplitButton", "account|NoRelationship|HomePageGrid|Mscrm.ImportData", "account|NoRelationship|HomePageGrid|Mscrm.ExportDataTemplate", "account|NoRelationship|HomePageGrid|Mscrm.Filters", "account|NoRelationship|HomePageGrid|Mscrm.Filters.Query", "account|NoRelationship|HomePageGrid|Mscrm.OpenGridAdvancedFind", "account|NoRelationship|HomePageGrid|Mscrm.OutlookHelp", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.FollowCommand", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.UnfollowCommand", "account|NoRelationship|HomePageGrid|Mscrm.Ribbon.TabSwitch", "account|NoRelationship|HomePageGrid|Mscrm.Ribbon.RootEvent", "account|NoRelationship|HomePageGrid|Mscrm.Jewel", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.MergeRecords", "account|NoRelationship|HomePageGrid|Mscrm.AddSelectedToMarketingList", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.View", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.View", "account|NoRelationship|HomePageGrid|Mscrm.FiltersGroup", "account|NoRelationship|HomePageGrid|Mscrm.SaveAsDefaultGridView", "account|NoRelationship|HomePageGrid|Mscrm.CustomizePreviewPane", "account|NoRelationship|HomePageGrid|Mscrm.SaveToCurrentView", "account|NoRelationship|HomePageGrid|Mscrm.SaveAsNewView", "account|NoRelationship|HomePageGrid|Mscrm.NewPersonalView", "account|NoRelationship|HomePageGrid|Mscrm.RefreshGrid", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.Chart", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Chart", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Flyout", "account|NoRelationship|HomePageGrid|Mscrm.ChartsLayout.LeftRight", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Layout.Query.LeftRight", "account|NoRelationship|HomePageGrid|Mscrm.ChartsLayout.Top", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Layout.Query.Top", "account|NoRelationship|HomePageGrid|Mscrm.Charts.HomePage.Off", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Query.Off", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.NewChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.CopyChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.EditChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.ImportChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.ExportChart", "account|NoRelationship|HomePageGrid|Mscrm.DeleteChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.RefreshChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.AssignVisualization", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.ShareVisualization", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.Related", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Related", "account|NoRelationship|HomePageGrid|Mscrm.AddFileToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddNoteToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddTaskToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.SendEmailToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddPhoneToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddLetterToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddFaxToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddAppointmentToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddRecurringAppointmentToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddServiceActivityToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.Grid.AddCustomActivity", "account|NoRelationship|HomePageGrid|Mscrm.DynamicMenu.Grid.AddActivity", "account|NoRelationship|HomePageGrid|Mscrm.MailMergeSelected", "account|NoRelationship|HomePageGrid|Mscrm.AddCampaignResponseToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Relationship", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Relationship.Opportunity", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Relationship.Customer", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.QuickCampaign", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.ACL.QuickCampaign.Selected", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.ACL.QuickCampaign.AllCurrentPage", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.ACL.QuickCampaign.AllAllPages", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.Developer", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Developer", "account|NoRelationship|HomePageGrid|Mscrm.DesignView", "account|NoRelationship|HomePageGrid|Mscrm.CreateView", "account|NoRelationship|HomePageGrid|Mscrm.CustomizeEntity", "account|NoRelationship|HomePageGrid|Mscrm.ManageViews", "account|NoRelationship|HomePageGrid|Mscrm.SaveFilterForSystemQuery", "account|NoRelationship|HomePageGrid|Mscrm.PublishEntity", "account|NoRelationship|HomePageGrid|Mscrm.PublishAll", "|NoRelationship||Mscrm.VisualizationTab.Command", "|NoRelationship||Mscrm.VisualizationTab.SaveChart", "|NoRelationship||Mscrm.VisualizationTab.SaveAndCloseChart", "|NoRelationship||Mscrm.VisualizationTab.CopyChart", "|NoRelationship||Mscrm.VisualizationTab.ChartsGroup", "|NoRelationship||Mscrm.VisualizationDesignerTab.ColumnFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.Column", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedColumn", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedColumn100", "|NoRelationship||Mscrm.VisualizationDesignerTab.BarFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.Bar", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedBar", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedBar100", "|NoRelationship||Mscrm.VisualizationDesignerTab.AreaFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.Area", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedArea", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedArea100", "|NoRelationship||Mscrm.VisualizationDesignerTab.LineChart", "|NoRelationship||Mscrm.VisualizationDesignerTab.PieChart", "|NoRelationship||Mscrm.VisualizationDesignerTab.FunnelChart", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Top3", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Top5", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.TopX", "|NoRelationship||Mscrm.VisualizationDesignerTab.BottomFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Bottom3", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Bottom5", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.BottomX", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Clear", "|NoRelationship||Mscrm.VisualizationTab.CloseDesigner", "|NoRelationship||Mscrm.VisualizationTools.Command", "|NoRelationship||Mscrm.Jewel.SaveMenu", "|NoRelationship||Mscrm.SavePrimary", "|NoRelationship||Mscrm.SaveAndClosePrimary", "|NoRelationship||Mscrm.SaveAndNewPrimary", "|NoRelationship||Mscrm.Jewel.FormProperties", "|NoRelationship||Mscrm.Jewel.PrintPreview", "|NoRelationship||Mscrm.ShowToolsMenu", "|NoRelationship||Mscrm.DuplicateDetection", "|NoRelationship||Mscrm.BulkDelete", "|NoRelationship||Mscrm.PersonalSettings", "|NoRelationship||Mscrm.LoadHelp", "|NoRelationship||Mscrm.HelpContents", "|NoRelationship||Mscrm.HelpAdminGuide", "|NoRelationship||Mscrm.HelpTroubleshooting", "|NoRelationship||Mscrm.HelpCrmLive", "|NoRelationship||Mscrm.HelpUpdatesOutlook", "|NoRelationship||Mscrm.HelpLegal", "|NoRelationship||Mscrm.HelpPrivacy", "|NoRelationship||Mscrm.HelpAbout", "|NoRelationship||Mscrm.Close"], "InitialTabId": "Mscrm.BasicHomeTab", "IsDefaultData": false, "TabList": [{ "TabId": "Mscrm.BasicHomeTab" }, { "TabId": "Mscrm.HomepageGrid.AllEntities.VisualizationTab" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.MainTab" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.View" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.Chart" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.Related" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.Developer" }], "TrimList": ["Mscrm.BasicHomeTab", "Mscrm.BasicHomeTab.OutlookHelp", "Mscrm.BasicHomeTab.Help", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.AddToQueue", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.MainTab.OutlookHelp", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Help", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.CustomizePreviewPane", "Mscrm.Jewel.SaveMenu", "Mscrm.Jewel.FormProperties", "Mscrm.Jewel.Help.Updates", "Mscrm.Jewel.Help.Legal", "Mscrm.Jewel.Help.Privacy"] }, "subscribedEvents": [9, 29, 45, 38, 39], "id": "crmRibbonData" }, null, { "permanentlySelectedControl": "crmGrid", "eventManager": "__Page_crmEventManager" }, null);

            Sys.Application.endCreateComponents();

        }
        function InitPageManager() {
            Sys.Application.findComponent('crmPageManager').applicationLoadHandler();
        }
        window.initActionQueueParams[InitPageManager] = { doNotUseSetTimeout: true };
        function InitWrpcTokens() {
        }
        registerEvents(window, 'load', function () {
            applyActionQueue([
                                SetPLTMarker,
                                LoadGlobalJSAndScriptResourceJS,
                                WaitGlobalJSAndScriptResourceJsScriptsToLoad,
                                LoadJsScripts,
                                WaitRemainingJsScriptsToLoad,
                                InitControls,
                                InitPageManager,
                                InitWrpcTokens
                                ]);
        });
        registerEvents(window, 'unload', function () { window.onresize = null; window.onerror = null; window.onload = null; });
    </script>
    <script type="text/javascript">
        var _homepageParameterInfo = [{ 'controlId': 'crmGrid_SavedNewQuerySelector', 'parameterName': 'viewid'}];
    </script>
</body>
</html>
