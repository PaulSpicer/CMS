<%@ Page Title="CMS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CMSModify.aspx.cs" Inherits="CMS.CMSModify" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/Content/css/foundation.css">
    <link rel="stylesheet" type="text/css" href="/Content/css/CMS.css">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <h1>Add / Edit Record</h1>
    <div id="ModFormContainer">
    <form method="post">
        <input type="hidden" name="Id" value="<% =recordId %>" />
        <input type="hidden" name="ActionType" value="<% =actionType%>" />
        <input type="hidden" name="Table" value="<% =table %>" />
        <%if (table=="PageLinks") { %>Heading: <input type="text" name="Heading" value="<% =defHeading %>" /> <%} ; %>
        <%if (table=="Specials") { %>Title: <input type="text" name="Title" value="<% =defTitle %>" /> <%} ; %>
        <%if (table=="Products") { %>Name: <input type="text" name="Name" value="<% =defName %>" /> <%} ; %>
        Image Path: <input type="text" name="ImagePath" value="<% =defImagePath %>" />
        <%if (table=="Specials" || table=="PageLinks") { %>Description: <input type="text" name="Description" value="<% =defDescription %>" /> <%} ; %>
        <%if (table=="PageLinks") { %>Button Text: <input type="text" name="ButtonText" value="<% =defButtonText %>" /> <%} ; %>
        <%if (actionType=="Create") { %><input type="submit" name="Create" value="Create New Record"/> <%} ; %>
        <%if (actionType=="Edit") { %><input type="submit" name="Update" value="Update Record" /> <%} ; %>
    </form>
    <div id="backText">
        <a href="CMS">Return to CMS</a>
    </div>
    </div>
</asp:Content>
