<%@ Page Title="CMS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="CMS.aspx.cs" Inherits="CMS._CMS"%>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/Content/css/foundation.css">
    <link rel="stylesheet" type="text/css" href="/Content/css/CMS.css">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <script src="content/js/what-input.js"></script>
    <script src="content/js/jquery.js"></script>
    <script src="content/js/foundation.js"></script>
    <script src="content/js/app.js"></script>

    <div id="backText">
        <a href="/">Return to Site</a>
    </div>

    <h1>Important Pages</h1>
    <asp:Repeater ID="rptPageLinks" runat="server">
        <HeaderTemplate>
            <table>
                <tr class="tableHeading">
                    <td>Heading</td>
                    <td>Image Path</td>
                    <td>Image Preview</td>
                    <td>Description</td>
                    <td>Button Text</td>
                    <td>Controls</td>
                </tr>      
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:Label ID="lbl_PageLinks_Heading" runat="server" Text='<%# Eval("Heading")%>' /></td>
                <td><asp:Label ID="lbl_PageLinks_ImagePath" runat="server" Text='<%# Eval("ImagePath")%>' /></td>
                <td><asp:Image ID="img_PageLinks_ImagePreview" runat="server" ImageUrl='<%# Eval("ImagePath")%>' /></td>
                <td><asp:Label ID="lbl_PageLinks_Description" runat="server" Text='<%# Eval("Description")%>' /></td>
                <td><asp:Label ID="lbl_PageLinks_ButtonText" runat="server" Text='<%# Eval("ButtonText")%>' /></td>
                <td>
                    <form id="mainElements<%# Eval("ID") %>" method="post" onsubmit="return confirm('Do you really want to delete this entry?');"> 
                        <input type="hidden" name="Table" value="PageLinks" />
                        <input type="hidden" name="Record" value="<%# Eval("ID") %>" />
                        <input type="submit" name="PostType" value="Delete"/>
                    </form>
                    <a href="CMSModify?Table=PageLinks&ActionType=Edit&id=<%# Eval("ID") %>">Edit</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
             </table>
            <form action="CMSModify" method="get">
                <input type="hidden" name="Table" value="PageLinks" />
                <input type="submit" name="ActionType" value="Create" />
            </form>
        </FooterTemplate>
    </asp:Repeater>

    <h1>Special Offers</h1>

    <asp:Repeater ID="rptSpecials" runat="server">
        <HeaderTemplate>
            <table>
                <tr class="tableHeading">
                    <td>Title</td>
                    <td>Image Path</td>
                    <td>Image Preview</td>
                    <td>Description</td>
                    <td>Controls</td>
                </tr>      
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:Label ID="lbl_Specials_Title" runat="server" Text='<%# Eval("Title")%>' /></td>
                <td><asp:Label ID="lbl_Specials_ImagePath" runat="server" Text='<%# Eval("ImagePath")%>' /></td>
                <td><asp:Image ID="lbl_Specials_ImagePreview" runat="server" ImageUrl='<%# Eval("ImagePath")%>' /></td>
                <td><asp:Label ID="lbl_Specials_Description" runat="server" Text='<%# Eval("Description")%>' /></td>               
                <td>
                    <form id="Specials<%# Eval("ID") %>" method="post" onsubmit="return confirm('Do you really want to delete this entry?');"> 
                        <input type="hidden" name="Table" value="Specials" />
                        <input type="hidden" name="Record" value="<%# Eval("ID") %>" />
                        <input type="submit" name="PostType" value="Delete"/>
                    </form>
                    <a href="CMSModify?Table=Specials&ActionType=Edit&id=<%# Eval("ID") %>">Edit</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
             </table>
             <form action="CMSModify" method="get">
                <input type="hidden" name="Table" value="Specials" />
                <input type="submit" name="ActionType" value="Create" />
            </form>
        </FooterTemplate>
    </asp:Repeater>

    <h1>Product Categories</h1>


    <asp:Repeater ID="rptProducts" runat="server">
        <HeaderTemplate>
            <table>
                <tr class="tableHeading">
                    <td>Name</td>
                    <td>Image Path</td>
                    <td>Image Preview</td>
                    <td>Controls</td>
                </tr>      
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:Label ID="lbl_Products_Name" runat="server" Text='<%# Eval("Name")%>' /></td>
                <td><asp:Label ID="lbl_Products_ImagePath" runat="server" Text='<%# Eval("ImagePath")%>' /></td>
                <td><asp:Image ID="lbl_Products_ImagePreview" runat="server" ImageUrl='<%# Eval("ImagePath")%>' /></td>       
                <td>
                    <form id="productCategory<%# Eval("ID") %>" method="post" onsubmit="return confirm('Do you really want to delete this entry?');"> 
                        <input type="hidden" name="Table" value="Products" />
                        <input type="hidden" name="Record" value="<%# Eval("ID") %>" />
                        <input type="submit" name="PostType" value="Delete"/>
                    </form>
                    <a href="CMSModify?Table=Products&ActionType=Edit&id=<%# Eval("ID") %>">Edit</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
             </table>
             <form action="CMSModify" method="get">
                <input type="hidden" name="Table" value="Products" />
                <input type="submit" name="ActionType" value="Create" />
            </form>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>
