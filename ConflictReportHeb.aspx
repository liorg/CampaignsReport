<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConflictReportHeb.aspx.cs" Inherits="Report.UI.GridReport.ConflictReportHeb" %>

<%@ Register TagPrefix="hs" TagName="HeaderSorting" Src="~/Controls/C2013/Grid/HeaderSorting2013.ascx" %>
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
    <script src="scripts/rowclick.js"></script>
    <link href="crm2013/classicStyle2013/1037/menucore.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/fonts.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/global.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/theme.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/controls.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/select.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/menu.css" rel="stylesheet" type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/CompositeControl.css" rel="stylesheet"
        type="text/css" />
    <link href="/crm2013/classicStyle2013/1037/appgrid.css" rel="stylesheet" type="text/css" />
 
    <script src="scripts/ConflictReport.js" type="text/javascript"></script>
    <style type="text/css">
        .gridMenuBar
        {
            top: 0px;
            height: 25px;
            position: absolute;
            width: 100%;
        }
        .tableContainer
        {
            height: 34px;
            position: absolute;
            top: 0px;
            width: 100%;
        }
        div.stdTable
        {
            width: 100%;
        }
        .ms-crm-CC-grid-All-0-LR
        {
            left: 0px;
            right: 0px;
        }
    </style>
</head>
<body class="stage">
    <form id="form1" runat="server">
    <div class="stdTable">
       
        <div class="gridMenuBar">
            <div class="ms-crm-appgridmenubar" id="crmMenuBar">
                <div class="ms-crm-GridActionBar" id="crmMenuBarmnuBar" type="menuBar">
                    <ul class="ms-crm-MenuBar-Left">
                        <li tabindex="-1" title="צור פריט תבנית דואר אלקטרוני חדש" class="ms-crm-Menu ms-crm-Menu-Read"
                            id="_MBCreateNewTemplate" onclick="eval(this.getAttribute('action'))" action="CreateNewTemplate();">
                            <span tabindex="-1" class="ms-crm-Menu-Label"><a tabindex="0" class="ms-crm-Menu-Label"
                                onclick="return false;" href="javascript:onclick();" target="_self">
                                <img tabindex="-1" class="ms-crm-Menu-ButtonFirst" id="" alt="צור פריט תבנית דואר אלקטרוני חדש"
                                    src="/_imgs/ico_16_2010.gif?ver=243798751" /><span tabindex="-1" class="ms-crm-MenuItem-TextLTR">חדש</span></a></span>
                        </li>
                        <li tabindex="-1" class="ms-crm-Menu-Spacer">&nbsp;<img src="_imgs/theme/Outlook14Silver/mnu_hSpacerGrid.png" />
                            &nbsp; </li>
                        <li tabindex="-1" title="הצג לפני הדפסה" class="ms-crm-Menu ms-crm-Menu-Read" id="_MBfindcrmGridPrint"
                            onclick="eval(this.getAttribute('action'))" action="$find('crmGrid').Print();"><span
                                tabindex="-1" class="ms-crm-Menu-Label"><a tabindex="0" class="ms-crm-Menu-Label"
                                    onclick="return false;" href="javascript:onclick();" target="_self">
                                    <img tabindex="-1" class="ms-crm-ImageStrip-16_print ms-crm-Menu-ButtonFirst" id="16_print"
                                        alt="הצג לפני הדפסה" src="/_imgs/imagestrips/transparent_spacer.gif" /><span tabindex="-1"
                                            style="display: none;">הצג לפני הדפסה</span></a></span> </li>
                        <li tabindex="-1" class="ms-crm-Menu-Spacer">&nbsp;<img src="_imgs/theme/Outlook14Silver/mnu_hSpacerGrid.png" />&nbsp;
                        </li>
                        <li tabindex="-1" title="מחק" class="ms-crm-Menu ms-crm-Menu-Read" id="_MBdoActioncrmGrid2010delete"
                            onclick="eval(this.getAttribute('action'))" action="doAction('crmGrid', '2010', 'delete');">
                            <span tabindex="-1" class="ms-crm-Menu-Label"><a tabindex="0" class="ms-crm-Menu-Label"
                                onclick="return false;" href="javascript:onclick();" target="_self">
                                <img tabindex="-1" class="ms-crm-ImageStrip-ico_16_delete ms-crm-Menu-ButtonFirst"
                                    id="ico_16_delete" alt="מחק" src="/_imgs/imagestrips/transparent_spacer.gif" /><span
                                        tabindex="-1" style="display: none;">מחק</span></a></span> </li>
                        <li tabindex="-1" class="ms-crm-Menu-Spacer">&nbsp;<img src="_imgs/theme/Outlook14Silver/mnu_hSpacerGrid.png" />&nbsp;
                        </li>
                        <li tabindex="-1" title="הפעל זרימת עבודה" class="ms-crm-Menu ms-crm-Menu-Read" id="OnDemandWorkflowGrid"
                            onclick="eval(this.getAttribute('action'))" action="launchOnDemandWorkflow('crmGrid', '2010', '')">
                            <span tabindex="-1" class="ms-crm-Menu-Label"><a tabindex="0" class="ms-crm-Menu-Label"
                                onclick="return false;" href="javascript:onclick();" target="_self">
                                <img tabindex="-1" class="ms-crm-Menu-ButtonFirst" id="Img1" alt="הפעל זרימת עבודה" src="/_imgs/ico/16_runworkflow.gif?ver=243798751" /><span
                                    tabindex="-1" class="ms-crm-MenuItem-TextLTR">הפעלת זרימת עבודה...</span></a></span>
                        </li>
                        <li tabindex="-1" title="התחל דו-שיח" class="ms-crm-Menu ms-crm-Menu-Read" id="RunInteractiveWorkflowGrid"
                            onclick="eval(this.getAttribute('action'))" action="runScript('crmGrid', '2010')">
                            <span tabindex="-1" class="ms-crm-Menu-Label"><a tabindex="0" class="ms-crm-Menu-Label"
                                onclick="return false;" href="javascript:onclick();" target="_self">
                                <img tabindex="-1" class="ms-crm-ImageStrip-startdialog16 ms-crm-Menu-ButtonFirst"
                                    id="startdialog16" alt="התחל דו-שיח" src="/_imgs/imagestrips/transparent_spacer.gif" /><span
                                        tabindex="-1" class="ms-crm-MenuItem-TextLTR">התחל דו-שיח</span></a></span>
                        </li>
                    </ul>
                    <ul class="ms-crm-MenuBar-Right">
                    </ul>
                </div>
            </div>
        </div>
        <div class="ms-crm-absolutePosition" style="top: 25px;">
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
                                                    <bb:RefreshButton2013 ID="refreshButton20131" runat="server" OnRefreshHandler="RefreshHandler" />
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
       var LOCID_IPADWINCLOSED = '\u200f\u200fאירעה שגיאה. חזור לדף הבית ונסה שוב.';
       var LOCID_FILTERS_NOT_SUPPORTED = '\u200f\u200fתצוגה זו אינה תומכת בסינון.';
       var LOCID_CANT_SAVE_FILTER = '\u200f\u200fאין אפשרות לשמור את המסנן בתצוגת מערכת.';
       var LOCID_AF_EQUALSCURRENTUSER = 'שווה למשתמש הנוכחי';
       var LOCID_AF_DOESNOTEQUALCURRENTUSER = 'לא שווה למשתמש הנוכחי';
       var LOCID_AF_EQUALSCURRENTUSERTEAMS = 'שווה לצוותים של המשתמש הנוכחי';
       var LOCID_UI_DIR = 'RTL';
       var LOCID_ACTION_UNSUPPORTED_ERROR = '\u200f\u200fאין תמיכה בפעולה זו.';
       var LOCID_UNSUPPORTED_RIBBONACTION = '\u200f\u200fפעולה זו אינה נתמכת בדפדפן שבו אתה משתמש.';
       var LOCID_LOOKUP_LABEL_FOR_EDIT = '\x7b0\x7d \x7b1\x7d';
       var LOCID_FIRST_WEEK_SELECT = 'FirstDay';
       var LOCID_DELETE_CONFIRM_ONE = '\u200f\u200fאם תמחק משאב זה והוא משמש בשירות, ייתכן שלא יהיו עוד די משאבים לתזמון השירות.';
       var LOCID_DELETE_CONFIRM_TWO = '\u200f\u200fהאם אתה בטוח שברצונך למחוק מתקן\x2fציוד זה\x3f';
       var LOCID_EMAIL_NORECORDS_MSG = '\u200f\u200fאין אפשרות לשלוח דואר אלקטרוני ישיר מאחר שלא הוחזרו רשומות עבור התצוגה הנוכחית. עליך לבחור תצוגה אחרת או רשומות כדי שתוכל לשלוח דואר אלקטרוני ישיר.';
       var LOCID_USERS_TOO_MANY = '\u200f\u200fבאפשרותך לבצע פעולה זו עבור משתמש אחד בלבד בכל פעם.';
       var LOCID_INCOM_TYPE_CAMP = '\u200f\u200fלא ניתן לבצע פעולה זו עבור פעילויות קמפיין.';
       var LOCID_INCOM_TYPE_EMAIL = '\u200f\u200fאין באפשרותך לבצע פעולה זו עבור פעילויות דואר אלקטרוני.';
       var LOCID_HETROGENEOUS_ACTIVITY = '\u200f\u200fניתן לבצע פעולה זו רק עבור פעילויות מאותו סוג.';
       var LOCID_EMPTY_GRID_MESSAGE = '\u200f\u200fכדי להפוך תוכן זה לזמין, שמור את הרשומה.';
       var LOCID_EMPTY_GRID_MESSAGE_REFRESH = '\u200f\u200fכדי להפוך תוכן זה לזמין, צור את הרשומה.';
       var LOCID_LOADING_GRID_DATA_REFRESH = 'טוען רשומות';
       var LOCID_GRID_TOO_MANY_RECORDS_IWF = 'ניתן לבחור רשומה אחת בלבד בכל פעם עבור פעולה זו.';
       var LOCID_MINICAMP_NORECORDS_MSG = '\u200f\u200fאין אפשרות ליצור קמפיין מהיר מכיוון שלא נמצאו רשומות בעמוד הנוכחי.';
       var LOCID_MINICAMP_TOOMANY_RECORDS = '\u200f\u200fאין באפשרותך ליצור קמפיין מהיר עבור יותר מרשימת שיווק אחת בכל פעם. נא בחר רשימת שיווק אחת בלבד.';
       var LOCID_MINICAMP_CANNOT_RUN = '\u200f\u200fאפשרות זו אינה זמינה עבור התצוגה הנוכחית. לא כל התצוגות יפעלו עם האפשרות עבור כל הרשומות בכל העמודים. בחר תצוגה אחרת או אפשרות אחרת של קמפיין מהיר ונסה שוב.';
       var LOCID_QC_CANNOT_RUN_ASSO = '\u200f\u200fאפשרות זו אינה זמינה עבור התצוגה הנוכחית. בחר אפשרות אחרת של קמפיין מהיר ונסה שוב.';
       var LOCID_MC_CANNOT_RUN_INACTLST = '\u200f\u200fאין אפשרות להפעיל קמפיינים מהירים ברשימת שיווק שאינה פעילה. הפעל את רשימת השיווק או בחר רשימת שיווק אחרת ונסה שוב.';
       var LOCID_DEDUPE_CANNOT_RUN = '\u200f\u200fאפשרות זו אינה זמינה עבור התצוגה הנוכחית. לא כל התצוגות יפעלו עם האפשרות עבור כל הרשומות בכל העמודים. בחר תצוגה אחרת או אפשרות אחרת לזיהוי כפילויות ונסה שוב.';
       var LOCID_GRID_UNSELECTED_CHECKBOX = 'הרשומה לא נבחרה.';
       var LOCID_GRID_SELECTED_CHECKBOX = 'הרשומה נבחרה.';
       var LOCID_GRID_NO_VIEW_NAME = 'לא זמין';
       var LOCID_GRID_EXACTTOTALCOUNT = '\x7b0\x7d';
       var LOCID_GRID_APPROXTOTALCOUNT = '\x7b0\x7d\x2b';
       var LOCID_INVITE_MULTIPLE = '\u200f\u200fMicrosoft Dynamics CRM Online אינו תומך כעת בהזמנות למשתמשים מרובים. בחר משתמשים בנפרד ונסה שוב.';
       var LOCID_PROMOTETOADMIN_MULTIPLE = '\u200f\u200fבאפשרותך לקדם למנהל מערכת משתמש אחד בכל עת. בחר משתמשים בנפרד ונסה שוב.';
       var LOCID_INVITE_NOTAVAILABLE_URL = 'https\x3a\x2f\x2fport.crm4.dynamics.com\x2fportal\x2fnotification\x2ffeaturenotification.aspx\x3ftype\x3dUserInviteFeatureOutage\x26showbackbtn\x3dFalse\x26showhomebtn\x3dFalse\x26showclosebtn\x3dTrue';
       var LOCID_BU_CANNOTDISABLE = '\u200f\u200fהמערכת זיהתה כי פעולה זו תבטל את ההפעלה של כל היחידות העסקיות ולכן אין אפשרות להמשיך אותה.';
       var LOCID_GRID_TOO_MANY_RECORDS_1 = '\u200f\u200fבאפשרותך לבחור שורה אחת בלבד.';
       var LOCID_DOWNLOADMAP_ERROR = '\u200f\u200fבאפשרותך להוריד מפת נתונים אחת בלבד בכל פעם.';
       var LOCID_DWNLDMAP_SLCT_ONERECORD = '\u200f\u200fבחר מפת נתונים לייצוא.';
       var LOCID_REMOTECOMMAND_ERROR = '\u200f\u200fאירעה שגיאה. \u200f\u200fנסה שוב לבצע פעולה זו. אם הבעיה נמשכת, בדוק אם קיימים פתרונות בקהילת Microsoft Dynamics CRM או פנה למנהל המערכת של Microsoft Dynamics CRM בארגון. לבסוף, תוכל לפנות אל התמיכה של Microsoft.';
       var LOCID_NON_SRS_FILTERSCHEDULE = '\u200f\u200fניתן לסנן או לתזמן דוחות של SQL Server Reporting Services בלבד.';
       var WEB_APP_URL = '';
       var READ_FORM_ENABLED = true;
       var HELP_SKU = 'LIVE';
       var IS_OUTLOOK_LAPTOP_CLIENT = false;
       var IS_OUTLOOK_14_CLIENT = false;
       var CLIENT_MAJOR_VERSION = 5;
       var GF_MAXRECORDS_LOOKUP = 300;
       var LOCID_LOADING_CRMGRID = '\u200f\u200fטוען תבנית דואר אלקטרוני רשומות...';
       var WEB_RESOURCE_ORG_VERSION_NUMBER = '\x7b635088729000003417\x7d';
       var _DebugOnScriptError = false;
       var ORG_UNIQUE_NAME = '36c4afbb62444e49a1013b262a40ad8e';
       var ORG_ID = '\x7b36C4AFBB-6244-4E49-A101-3B262A40AD8E\x7d';
       var USE_READ_FORM = false;
       var IS_PATHBASEDURLS = false;
       var USER_HELP_LCID = 1037;
       var USER_LANGUAGE_CODE = 1037;
       var IS_OUTLOOK_CLIENT = false;
       var IS_UEIP_ENABLED = true;
       var IS_ONLINE = true;
       var VERSION_STAMP = 243798751;
       var ISV_ADDITIONAL_AUTH = '';
       var FeatureControl = { "FCB.Refresh.Fall": true, "FCB.Refresh.Sales": true, "FCB.Refresh.Common": true, "FCB.Refresh.Service": true };
       var REQ_ID = 'e235e583-19a0-4bdd-bafb-d18c2490b049';
       var IS_LIVE = true;
       var IS_ONPREMISE = false;
       var IS_SPLA = false;
       var IS_CLAIMS = true;
       var UseTabletExperience = false;
       var _ErrorCodesIsvAborted = '0x80040265';
       var ScriptErrorReportingPreference = 1;
       var _bPresenceEnabled = true;
       var ORG_LANGUAGE_CODE = 1037;
       var ORG_FULLNAME_FORMAT = 1;
       var ORG_IS_APP_MODE = false;
       var SERVER_URL = 'https\x3a\x2f\x2forg36c4a.crm4.dynamics.com\x2f';
       var AUTHENTICATION_TYPE = 3;
       var CRM2007_WEBSERVICE_NS = 'http\x3a\x2f\x2fschemas.microsoft.com\x2fcrm\x2f2007\x2fWebServices';
       var CRM2007_CORETYPES_NS = 'http\x3a\x2f\x2fschemas.microsoft.com\x2fcrm\x2f2007\x2fCoreTypes';
       var CURRENT_THEME_TYPE = 'Outlook15White';
       var CURRENT_WEB_THEME = 'Default';
       var RefreshFormTheme = 'Outlook15White';
       var USER_ROLES = ['ea6adfc1-aee7-e211-8dc6-d48564519c20', 'd874dfc1-aee7-e211-8dc6-d48564519c20'];
       var USER_GUID = '\x7b3D4DB689-AFD5-4236-AFDB-2AA8AE751790\x7d';
       var ORG_DATE_START_DAY = 0;
       var USER_DATE_FORMATSTRING = 'dd\x2fMM\x2fyyyy';
       var USER_DATE_SEPARATOR = '\x2f';
       var USER_DATE_FORMATTED_FORMATSTRING = 'dd\x2fMM\x2fyyyy';
       var USER_DATE_START_DAY = 0;
       var USER_TIME_FORMAT = 'HH\x3amm';
       var USER_SHOW_WEEK_NUMBER = false;
       var ORG_TIMEZONE_OFFSET = 180;
       var __cultureInfo = { "dateTimeFormat": { "AMDesignator": "AM", "Calendar": { "MinSupportedDateTime": "\/Date(-62135596800000)\/", "MaxSupportedDateTime": "\/Date(253402300799999)\/", "AlgorithmType": 1, "CalendarType": 1, "Eras": [1], "TwoDigitYearMax": 2029, "IsReadOnly": false }, "DateSeparator": "/", "FirstDayOfWeek": 0, "CalendarWeekRule": 0, "FullDateTimePattern": "dddd dd MMMM yyyy HH:mm:ss", "LongDatePattern": "dddd dd MMMM yyyy", "LongTimePattern": "HH:mm:ss", "MonthDayPattern": "dd MMMM", "PMDesignator": "PM", "RFC1123Pattern": "ddd, dd MMM yyyy HH\u0027:\u0027mm\u0027:\u0027ss \u0027GMT\u0027", "ShortDatePattern": "dd/MM/yyyy", "ShortTimePattern": "HH:mm", "SortableDateTimePattern": "yyyy\u0027-\u0027MM\u0027-\u0027dd\u0027T\u0027HH\u0027:\u0027mm\u0027:\u0027ss", "TimeSeparator": ":", "UniversalSortableDateTimePattern": "yyyy\u0027-\u0027MM\u0027-\u0027dd HH\u0027:\u0027mm\u0027:\u0027ss\u0027Z\u0027", "YearMonthPattern": "MMMM yyyy", "AbbreviatedDayNames": ["יום א", "יום ב", "יום ג", "יום ד", "יום ה", "יום ו", "שבת"], "ShortestDayNames": ["א", "ב", "ג", "ד", "ה", "ו", "ש"], "DayNames": ["יום ראשון", "יום שני", "יום שלישי", "יום רביעי", "יום חמישי", "יום שישי", "שבת"], "AbbreviatedMonthNames": ["ינו", "פבר", "מרץ", "אפר", "מאי", "יונ", "יול", "אוג", "ספט", "אוק", "נוב", "דצמ", ""], "MonthNames": ["ינואר", "פברואר", "מרץ", "אפריל", "מאי", "יוני", "יולי", "אוגוסט", "ספטמבר", "אוקטובר", "נובמבר", "דצמבר", ""], "IsReadOnly": false, "NativeCalendarName": "לוח שנה גרגוריאני", "AbbreviatedMonthGenitiveNames": ["ינו", "פבר", "מרץ", "אפר", "מאי", "יונ", "יול", "אוג", "ספט", "אוק", "נוב", "דצמ", ""], "MonthGenitiveNames": ["ינואר", "פברואר", "מרץ", "אפריל", "מאי", "יוני", "יולי", "אוגוסט", "ספטמבר", "אוקטובר", "נובמבר", "דצמבר", ""] }, "eras": [1, "לספירה", null, 0], "name": "he-IL", "numberFormat": { "CurrencyDecimalDigits": 2, "CurrencyDecimalSeparator": ".", "IsReadOnly": false, "CurrencyGroupSizes": [3], "NumberGroupSizes": [3], "PercentGroupSizes": [3], "CurrencyGroupSeparator": ",", "CurrencySymbol": "₪", "NaNSymbol": "לא מספר", "CurrencyNegativePattern": 2, "NumberNegativePattern": 1, "PercentPositivePattern": 1, "PercentNegativePattern": 1, "NegativeInfinitySymbol": "אינסוף שלילי", "NegativeSign": "-", "NumberDecimalDigits": 2, "NumberDecimalSeparator": ".", "NumberGroupSeparator": ",", "CurrencyPositivePattern": 2, "PositiveInfinitySymbol": "אינסוף חיובי", "PositiveSign": "+", "PercentDecimalDigits": 2, "PercentDecimalSeparator": ".", "PercentGroupSeparator": ",", "PercentSymbol": "%", "PerMilleSymbol": "‰", "NativeDigits": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], "DigitSubstitution": 1 } };
       var HELP_SERVER_URL = 'http\x3a\x2f\x2frc.crm4.dynamics.com\x2frc\x2fredir\x2fcrm\x2f';
       var HELP_REDIRECT_AVAILABLE = true;
       var WEB_SERVER_HOST = 'org36c4a.crm4.dynamics.com';
       var WEB_SERVER_PORT = 443;
       var APPLICATION_VERSION = '5.0';
       var APPLICATION_FULL_VERSION = '5.0.9690.3417';
       var IMAGE_STRIPS_ENABLED = true;
       var DEF_SOL_ID = '\x7bfd140aaf-4df4-11dd-bd17-0019b9312238\x7d';
       var CRM_ONLINE_LEGAL_LINK = 'https\x3a\x2f\x2fport.crm4.dynamics.com\x2fportal\x2ffwdlink.aspx\x3ftarget\x3dlegal\x26orglcid\x3d1037\x26lc\x3d1037';
       var CRM_ONLINE_PRIVACY_LINK = 'https\x3a\x2f\x2fport.crm4.dynamics.com\x2fportal\x2ffwdlink.aspx\x3ftarget\x3dprivacy\x26msonline\x3dfalse\x26lc\x3d1037';
       var YAMMER_IS_INSTALLED = true;
       var YAMMER_IS_CONFIGURED_FOR_ORG = false;
       var YAMMER_APP_ID = 'e3HEvk9cqzVW4yyn8tIM3g';
       var YAMMER_NETWORK_NAME = '';
       var YAMMER_GROUP_ID = 0;
       var YAMMER_TOKEN_EXPIRED = false;
       var YAMMER_IS_CONFIGURED_FOR_USER = false;
       var YAMMER_HAS_CONFIGURE_PRIVILEGE = true;
       var YAMMER_POST_METHOD = 0;
       var YAMMER_YAMMEREMBED_WRPCTOKEN = 'iLQgDvcqEeKyUphL4XxH5PAj\x2bkRpoBPoCQ8ixjZBWqwidQIRRjEA3zx1QYr5Nxst';
       var YAMMER_YAMMEREMBED_TIMESTAMP = '635112931271183928';
       var MARKERS_CACHE_ID = 'e235e583-19a0-4bdd-bafb-d18c2490b049';
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
            loadScriptAdv('/crm2013/js/ScriptResx1037.js', '/crm2013/js/ScriptResx1037.js', false);

        }
        function WaitGlobalJSAndScriptResourceJsScriptsToLoad() {
            waitForJScriptsToLoad();
        }
        function LoadJsScripts() {
            loadScriptAdv('/crm2013/js/entitypropertiesutil.js', '/crm2013/js/entitypropertiesutil.js', false);
            loadScriptAdv('/crm2013/js/stage.js', '/crm2013/js/stage.js', false);
            loadScriptAdv('/crm2013/js/homepage.js', '/crm2013/js/homepage.js', false);
            loadScriptAdv('/crm2013/js/form.js', '/crm2013/js/form.js', false);
            loadScriptAdv('/crm2013/js/Navigator/map.js', '/crm2013/js/Navigator/map.js', false);
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


        }
        function WaitRemainingJsScriptsToLoad() {
            waitForJScriptsToLoad();
        }
        function InitControls() {
            Sys.Application.beginCreateComponents();
            crmCreate(Mscrm.GridSizeCalculator, { "subscribedEvents": [9] }, null, { "eventManager": "__Page_crmEventManager" }, $get('homepageTableCell'));
            crmCreate(Mscrm.PageManager, { "id": "crmPageManager", "mode": "iframe", "executeDeferredActionsOnDemand": false, "deferredActionList": [], "deferredActionParameters": [], "pageOnLoadScriptList": [], "rootElement": "" }, null, { "eventManager": "__Page_crmEventManager" }, null);
            crmCreate(Mscrm.EventManager, { "eventSubscribers": [], "childEventManagerIds": null, "parentEventManagerId": "", "id": "__Page_crmEventManager" }, null, {}, null);
            crmCreate(Mscrm.GridViewSelector, { "showNewVSControl": true, "showOriginalSelectBox": false, "viewEntityName": "account", "selectedSavedQuery": "{00000000-0000-0000-00AA-000010001001}", "selectedSavedQueryName": "My Active Accounts", "selectedSavedQueryType": "1039", "userSelectedDefaultView": "", "userOwnedView": "{00000000-0000-0000-00AA-000010001001}", "quickFindQuery": "{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}", "createPersonalViewEnabled": true, "systemViewsXml": "<savedqueries morerecords=\"0\" totalrecordcount=\"-1\" totalrecordcountlimitexceeded=\"0\" paging-cookie=\"&lt;cookie page=&quot;1&quot;&gt;&lt;name last=&quot;Quick Find Active Accounts&quot; first=&quot;Accounts Being Followed&quot; \/&gt;&lt;savedqueryid last=&quot;{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}&quot; first=&quot;{61273827-328E-E011-95AE-00155D9CFA03}&quot; \/&gt;&lt;\/cookie&gt;\"><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{61273827-328E-E011-95AE-00155D9CFA03}<\/savedqueryid><name>Accounts Being Followed<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{61273827-328E-E011-95AE-00155D9CFA02}<\/savedqueryid><name>Accounts I Follow<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{15C63745-0A6E-4322-8416-A62C84D90279}<\/savedqueryid><name>Accounts: Influenced Deals That We Won<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{CFBCD7AF-AEE5-4E45-8ECC-C040D4020581}<\/savedqueryid><name>Accounts: No Campaign Activities in Last 3 Months<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{C147F1F7-1D78-4D10-85BF-7E03B79F74FA}<\/savedqueryid><name>Accounts: No Orders in Last 6 Months<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{49FB9771-09E1-4E70-B193-198752493577}<\/savedqueryid><name>Accounts: Responded to Campaigns in Last 6 Months<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{00000000-0000-0000-00AA-000010001002}<\/savedqueryid><name>Active Accounts<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{00000000-0000-0000-00AA-000010001031}<\/savedqueryid><name>Inactive Accounts<\/name><\/savedquery><savedquery><isdefault name=\"Yes\">true<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{00000000-0000-0000-00AA-000010001001}<\/savedqueryid><name>My Active Accounts<\/name><\/savedquery><savedquery><isdefault name=\"No\">false<\/isdefault><isquickfindquery name=\"No\">false<\/isquickfindquery><savedqueryid>{D234426E-1F37-4944-9255-50E19B541C4C}<\/savedqueryid><name>My Connections<\/name><\/savedquery><savedquery><isdefault name=\"Yes\">true<\/isdefault><isquickfindquery name=\"Yes\">true<\/isquickfindquery><savedqueryid>{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}<\/savedqueryid><name>Quick Find Active Accounts<\/name><\/savedquery><\/savedqueries>", "userViewsXml": "", "systemViewsLabel": "System Views", "userViewsLabel": "My Views", "customViewsLabel": "Custom Views", "renderForPrint": false, "isActivitiesViewSelector": false, "activityList": [{ "Id": "00000000-0000-0000-0000-000000000000", "Name": "All Activities", "TypeCode": 4200, "TypeDisplayName": null, "TypeName": "activitypointer" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Task", "TypeCode": 4212, "TypeDisplayName": null, "TypeName": "task" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Fax", "TypeCode": 4204, "TypeDisplayName": null, "TypeName": "fax" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Phone Call", "TypeCode": 4210, "TypeDisplayName": null, "TypeName": "phonecall" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "E-mail", "TypeCode": 4202, "TypeDisplayName": null, "TypeName": "email" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Letter", "TypeCode": 4207, "TypeDisplayName": null, "TypeName": "letter" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Appointment", "TypeCode": 4201, "TypeDisplayName": null, "TypeName": "appointment" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Service Activity", "TypeCode": 4214, "TypeDisplayName": null, "TypeName": "serviceappointment" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Campaign Response", "TypeCode": 4401, "TypeDisplayName": null, "TypeName": "campaignresponse" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Campaign Activity", "TypeCode": 4402, "TypeDisplayName": null, "TypeName": "campaignactivity" }, { "Id": "00000000-0000-0000-0000-000000000000", "Name": "Recurring Appointment", "TypeCode": 4251, "TypeDisplayName": null, "TypeName": "recurringappointmentmaster" }], "selectOptionsXml": "<select  GridId=\"crmGrid\" quickFindQuery=\"{2D1187C4-23FE-4BB5-9647-43BB1C6DDBD1}\" id=\"crmGrid_SavedNewQuerySelector\" name=\"crmGrid_SavedNewQuerySelector\" class=\"ms-crm-SelectBox&#32;\" onchange=\"handleView(this,&#32;$find(&#39;crmGrid&#39;))\"><OPTGROUP  LABEL=\"System&#32;Views\" id=\"AppSystemViews\"><option value=\"{61273827-328E-E011-95AE-00155D9CFA03}\" Type=\"1039\">Accounts Being Followed<\/option><option value=\"{61273827-328E-E011-95AE-00155D9CFA02}\" Type=\"1039\">Accounts I Follow<\/option><option value=\"{15C63745-0A6E-4322-8416-A62C84D90279}\" Type=\"1039\">Accounts: Influenced Deals That We Won<\/option><option value=\"{CFBCD7AF-AEE5-4E45-8ECC-C040D4020581}\" Type=\"1039\">Accounts: No Campaign Activities in Last 3 Months<\/option><option value=\"{C147F1F7-1D78-4D10-85BF-7E03B79F74FA}\" Type=\"1039\">Accounts: No Orders in Last 6 Months<\/option><option value=\"{49FB9771-09E1-4E70-B193-198752493577}\" Type=\"1039\">Accounts: Responded to Campaigns in Last 6 Months<\/option><option value=\"{00000000-0000-0000-00AA-000010001002}\" Type=\"1039\">Active Accounts<\/option><option value=\"{00000000-0000-0000-00AA-000010001031}\" Type=\"1039\">Inactive Accounts<\/option><option value=\"{00000000-0000-0000-00AA-000010001001}\" Type=\"1039\" isUserOwned=\"true\">My Active Accounts<\/option><option value=\"{D234426E-1F37-4944-9255-50E19B541C4C}\" Type=\"1039\">My Connections<\/option><\/OPTGROUP><\/select>", "createPersonalViewLabel": "Create Personal View", "subscribedEvents": [62, 14, 47] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid_SavedNewQuerySelector'));
            crmCreate(Microsoft.Crm.CommandBar.MenuBarControl, {}, null, {}, $get('crmMenuBar'));
            crmCreate(Mscrm.CompositeControlResizeControl, { "subscribedEvents": [27, 26, 28, 9, 70, 53] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid_splitTD'));
            crmCreate(Mscrm.CompositeControl, { "subscribedEvents": [27, 26, 28, 9, 70, 53] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid_visualizationCompositeControl'));
            crmCreate(Mscrm.GridControl, { "subscribedEvents": [42, 4, 50, 38, 9] }, null, { "eventManager": "__Page_crmEventManager", "rootManager": "crmPageManager" }, $get('crmGrid'));
            crmCreate(Mscrm.RibbonData, { "serverInformation": { "CommandIds": ["|NoRelationship||Mscrm.DynamicMenu.NewActivity.task", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.fax", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.phonecall", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.email", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.letter", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.appointment", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.serviceappointment", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.campaignresponse", "|NoRelationship||Mscrm.DynamicMenu.NewActivity.recurringappointmentmaster", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.account", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.contact", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.lead", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.opportunity", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.competitor", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.incident", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.kbarticle", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.quote", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.salesorder", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.invoice", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.product", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.salesliterature", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.list", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.goal", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.metric", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.goalrollupquery", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.contract", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.service", "|NoRelationship||Mscrm.DynamicMenu.NewRecord.campaign", "|NoRelationship||Mscrm.BasicHomeTab", "|NoRelationship||Mscrm.Enabled", "|NoRelationship||Mscrm.DynamicMenu.NewActivity", "|NoRelationship||Mscrm.DynamicMenu.NewRecord", "|NoRelationship||Mscrm.ImportData", "|NoRelationship||Mscrm.OpenAdvancedFind", "|NoRelationship||Mscrm.OutlookHelp", "|NoRelationship||Mscrm.Ribbon.TabSwitch", "|NoRelationship||Mscrm.Ribbon.RootEvent", "|NoRelationship||Mscrm.Jewel", "account|NoRelationship|HomePageGrid|Mscrm.ReportsMenu.NoReportsAvailable", "account|NoRelationship|HomePageGrid|Mscrm.ReportsMenu.RunReport.Grid", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.MainTab", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.MainTab", "account|NoRelationship|HomePageGrid|Mscrm.Enabled", "account|NoRelationship|HomePageGrid|Mscrm.NewRecordFromGrid", "account|NoRelationship|HomePageGrid|Mscrm.EditSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.Activate", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.Deactivate", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DeleteSplitButtonCommand", "account|NoRelationship|HomePageGrid|Mscrm.DeleteSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.BulkDelete", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DetectDupes", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DetectDupesSelected", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.DetectDupesAll", "account|NoRelationship|HomePageGrid|Mscrm.AddEmailToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddConnectionGrid", "account|NoRelationship|HomePageGrid|Mscrm.AddConnectionToMeGrid", "account|NoRelationship|HomePageGrid|Mscrm.AddSelectedToQueue", "account|NoRelationship|HomePageGrid|Mscrm.AssignSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.ShareSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.CopyShortcutSelected.EnabledInIEBrowser", "account|NoRelationship|HomePageGrid|Mscrm.CopyShortcutSelected", "account|NoRelationship|HomePageGrid|Mscrm.CopyShortcutView", "account|NoRelationship|HomePageGrid|Mscrm.SendShortcutSelected.AlwaysEnabled", "account|NoRelationship|HomePageGrid|Mscrm.SendShortcutSelected", "account|NoRelationship|HomePageGrid|Mscrm.SendShortcutView", "account|NoRelationship|HomePageGrid|Mscrm.RunWorkflowSelected", "account|NoRelationship|HomePageGrid|Mscrm.RunInteractiveWorkflowSelected", "account|NoRelationship|HomePageGrid|Mscrm.ReportMenu.Grid", "account|NoRelationship|HomePageGrid|Mscrm.ReportsMenu.Populate.Grid", "account|NoRelationship|HomePageGrid|Mscrm.ExportToExcel", "account|NoRelationship|HomePageGrid|Mscrm.ImportDataSplitButton", "account|NoRelationship|HomePageGrid|Mscrm.ImportData", "account|NoRelationship|HomePageGrid|Mscrm.ExportDataTemplate", "account|NoRelationship|HomePageGrid|Mscrm.Filters", "account|NoRelationship|HomePageGrid|Mscrm.Filters.Query", "account|NoRelationship|HomePageGrid|Mscrm.OpenGridAdvancedFind", "account|NoRelationship|HomePageGrid|Mscrm.OutlookHelp", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.FollowCommand", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.UnfollowCommand", "account|NoRelationship|HomePageGrid|Mscrm.Ribbon.TabSwitch", "account|NoRelationship|HomePageGrid|Mscrm.Ribbon.RootEvent", "account|NoRelationship|HomePageGrid|Mscrm.Jewel", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.MergeRecords", "account|NoRelationship|HomePageGrid|Mscrm.AddSelectedToMarketingList", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.View", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.View", "account|NoRelationship|HomePageGrid|Mscrm.FiltersGroup", "account|NoRelationship|HomePageGrid|Mscrm.SaveAsDefaultGridView", "account|NoRelationship|HomePageGrid|Mscrm.CustomizePreviewPane", "account|NoRelationship|HomePageGrid|Mscrm.SaveToCurrentView", "account|NoRelationship|HomePageGrid|Mscrm.SaveAsNewView", "account|NoRelationship|HomePageGrid|Mscrm.NewPersonalView", "account|NoRelationship|HomePageGrid|Mscrm.RefreshGrid", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.Chart", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Chart", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Flyout", "account|NoRelationship|HomePageGrid|Mscrm.ChartsLayout.LeftRight", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Layout.Query.LeftRight", "account|NoRelationship|HomePageGrid|Mscrm.ChartsLayout.Top", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Layout.Query.Top", "account|NoRelationship|HomePageGrid|Mscrm.Charts.HomePage.Off", "account|NoRelationship|HomePageGrid|Mscrm.Charts.Query.Off", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.NewChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.CopyChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.EditChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.ImportChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.ExportChart", "account|NoRelationship|HomePageGrid|Mscrm.DeleteChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.RefreshChart", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.AssignVisualization", "account|NoRelationship|HomePageGrid|Mscrm.VisualizationTab.ShareVisualization", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.Related", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Related", "account|NoRelationship|HomePageGrid|Mscrm.AddFileToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddNoteToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddTaskToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.SendEmailToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddPhoneToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddLetterToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddFaxToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddAppointmentToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddRecurringAppointmentToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.AddServiceActivityToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.Grid.AddCustomActivity", "account|NoRelationship|HomePageGrid|Mscrm.DynamicMenu.Grid.AddActivity", "account|NoRelationship|HomePageGrid|Mscrm.MailMergeSelected", "account|NoRelationship|HomePageGrid|Mscrm.AddCampaignResponseToSelectedRecord", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Relationship", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Relationship.Opportunity", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Relationship.Customer", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.QuickCampaign", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.ACL.QuickCampaign.Selected", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.ACL.QuickCampaign.AllCurrentPage", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.ACL.QuickCampaign.AllAllPages", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.{!EntityLogicalName}.Developer", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Developer", "account|NoRelationship|HomePageGrid|Mscrm.DesignView", "account|NoRelationship|HomePageGrid|Mscrm.CreateView", "account|NoRelationship|HomePageGrid|Mscrm.CustomizeEntity", "account|NoRelationship|HomePageGrid|Mscrm.ManageViews", "account|NoRelationship|HomePageGrid|Mscrm.SaveFilterForSystemQuery", "account|NoRelationship|HomePageGrid|Mscrm.PublishEntity", "account|NoRelationship|HomePageGrid|Mscrm.PublishAll", "|NoRelationship||Mscrm.VisualizationTab.Command", "|NoRelationship||Mscrm.VisualizationTab.SaveChart", "|NoRelationship||Mscrm.VisualizationTab.SaveAndCloseChart", "|NoRelationship||Mscrm.VisualizationTab.CopyChart", "|NoRelationship||Mscrm.VisualizationTab.ChartsGroup", "|NoRelationship||Mscrm.VisualizationDesignerTab.ColumnFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.Column", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedColumn", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedColumn100", "|NoRelationship||Mscrm.VisualizationDesignerTab.BarFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.Bar", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedBar", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedBar100", "|NoRelationship||Mscrm.VisualizationDesignerTab.AreaFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.Area", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedArea", "|NoRelationship||Mscrm.VisualizationDesignerTab.Charts.StackedArea100", "|NoRelationship||Mscrm.VisualizationDesignerTab.LineChart", "|NoRelationship||Mscrm.VisualizationDesignerTab.PieChart", "|NoRelationship||Mscrm.VisualizationDesignerTab.FunnelChart", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Top3", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Top5", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.TopX", "|NoRelationship||Mscrm.VisualizationDesignerTab.BottomFlyout", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Bottom3", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Bottom5", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.BottomX", "|NoRelationship||Mscrm.VisualizationDesignerTab.TopBottom.Clear", "|NoRelationship||Mscrm.VisualizationTab.CloseDesigner", "|NoRelationship||Mscrm.VisualizationTools.Command", "|NoRelationship||Mscrm.Jewel.SaveMenu", "|NoRelationship||Mscrm.SavePrimary", "|NoRelationship||Mscrm.SaveAndClosePrimary", "|NoRelationship||Mscrm.SaveAndNewPrimary", "|NoRelationship||Mscrm.Jewel.FormProperties", "|NoRelationship||Mscrm.Jewel.PrintPreview", "|NoRelationship||Mscrm.ShowToolsMenu", "|NoRelationship||Mscrm.DuplicateDetection", "|NoRelationship||Mscrm.BulkDelete", "|NoRelationship||Mscrm.PersonalSettings", "|NoRelationship||Mscrm.LoadHelp", "|NoRelationship||Mscrm.HelpContents", "|NoRelationship||Mscrm.HelpAdminGuide", "|NoRelationship||Mscrm.HelpTroubleshooting", "|NoRelationship||Mscrm.HelpCrmLive", "|NoRelationship||Mscrm.HelpUpdatesOutlook", "|NoRelationship||Mscrm.HelpLegal", "|NoRelationship||Mscrm.HelpPrivacy", "|NoRelationship||Mscrm.HelpAbout", "|NoRelationship||Mscrm.Close"], "InitialTabId": "Mscrm.BasicHomeTab", "IsDefaultData": false, "TabList": [{ "TabId": "Mscrm.BasicHomeTab" }, { "TabId": "Mscrm.HomepageGrid.AllEntities.VisualizationTab" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.MainTab" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.View" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.Chart" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.Related" }, { "TabId": "EntityTemplateTab.account.NoRelationship.HomePageGrid.Mscrm.HomepageGrid.account.Developer" }], "TrimList": ["Mscrm.BasicHomeTab", "Mscrm.BasicHomeTab.OutlookHelp", "Mscrm.BasicHomeTab.Help", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.AddToQueue", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.MainTab.OutlookHelp", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.Help", "account|NoRelationship|HomePageGrid|Mscrm.HomepageGrid.account.CustomizePreviewPane", "Mscrm.Jewel.SaveMenu", "Mscrm.Jewel.FormProperties", "Mscrm.Jewel.Help.Updates", "Mscrm.Jewel.Help.Legal", "Mscrm.Jewel.Help.Privacy"] }, "subscribedEvents": [9, 29, 45, 38, 39], "id": "crmRibbonData" }, null, { "permanentlySelectedControl": "crmGrid", "eventManager": "__Page_crmEventManager" }, null);
            crmCreate(Microsoft.Crm.CommandBar.MenuBarControl, {}, null, {}, $get('crmMenuBarmnuBar'));
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
        var _homepageParameterInfo = [{ 'controlId': 'crmGrid_SavedNewQuerySelector', 'parameterName': 'viewid' }];
</script>
</body>
</html>
