<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CMS._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">

    <link rel="stylesheet" type="text/css" href="/Content/css/foundation.css">
    <link rel="stylesheet" type="text/css" href="/Content/css/site.css">

    <script src="content/js/what-input.js"></script>
    <script src="content/js/jquery.js"></script>
    <script src="content/js/foundation.js"></script>
    <script src="content/js/app.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    



    <!-- NAVIGATION  -->
    <nav class="navblock">
        <div class="grid-container">
            <div class="grid-x">
                <div class="cell small-6 medium-6 large-12">
                    <img src="Content/img/logo.png" />
                </div>
                <div class="cell small-6 menuMobile">
                    Menu
                    <img src="Content/img/menubutton.jpg"/>
                </div>
                <div class="cell large-8 menuBar">
                    <ul class="dropdown menu" data-dropdown-menu>
                        <li><a href="#">Our Products</a></li>
                        <li><a href="#">Where to Buy</a></li>
                        <li><a href="#">News & Reviews</a></li>
                        <li><a href="#">Help & Support</a></li>
                        <li><a href="#">My Account</a></li>
                    </ul>
                </div>
                <div class="cell small-12 medium-12 large-4">
                    <ul class="menu searchbar">
                        <li><input type="search" class="" placeholder="Search Here..."></li>
                        <li><button id="searchButton" type="button" style="background: url(Content/img/search_button.jpg)" class="button"></button></li>
                    </ul>
                </div>
            </div>
        </div>   
    </nav>


    <!-- TOP BANNER  -->
    <div class="grid-banner">
        <div class="cell">
            <picture>
                <source srcset="content/img/top_banner_Large.jpg" media="(min-width:64em)" />
                <img id="bannerimg" src="Content/img/top_banner_small.jpg" />
            </picture>
        </div>
    </div>


    <!-- MAIN LINKS SECTION  -->
    <asp:Repeater ID="rptMainElements" runat="server">
        <HeaderTemplate>
            <div class="grid-container">
            <div class="grid-x grid-margin-x">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="cell large-3 medium-6 small-12">
                <div>
                    <h1>
                    <asp:Label ID="lblHeadingMainElements" runat="server" Text='<%# Eval("Heading")%>' />
                    </h1>
                    </div>
                <div>
                    <asp:Image class="sectionImage" ID="imgMainElements" runat="server" ImageUrl='<%# Eval("ImagePath")%>' />
                </div>      
                <div>
                    <asp:Label class="mainDescription" ID="lblDescriptionMainElements" runat="server" Text='<%# Eval("Description")%>' />
                </div>
                <div>
                    <a href="#" class="button"><%# Eval("ButtonText")%></a>
                </div>                                              
            </div>            
        </ItemTemplate>
        <FooterTemplate>
            </div>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    

    <!-- SPECIAL OFFERS  -->
    <!-- TODO: MOBILE/TABLET IMAGES  -->
    <asp:Repeater ID="rptSpecialOffers" runat="server">
        <HeaderTemplate>
            <div class="grid-container specialOffersContainer">
            <div class="grid-x grid-margin-x">
                <div class="cell" id="specialOfferHeading">
                    <h1>Special Offers</h1>
                </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="cell large-4 medium-12 small-12">
                <div>
                    <asp:Image Class="sectionImage" ID="imgSpecialOffers" runat="server" ImageUrl='<%# Eval("ImagePath")%>' />
                </div>  
                <div class="specialOfferText">                    
                        <asp:Label ID="lblTitleSpecialOffers" runat="server" Text='<%# Eval("Title")%>' />                                      
                </div>    
                <div class="specialOfferTextBottom">
                    <strong>
                    <asp:Label ID="lblDescriptionSpecialOffers" runat="server" Text='<%# Eval("Description")%>' />
                    </strong>
                </div>                                         
            </div>            
        </ItemTemplate>
        <FooterTemplate>
            <div id="specialOffersButton">
                <a href="#" class="button">View All Offers</a>
            </div>
                        </div>
                        </div>
        </FooterTemplate>
    </asp:Repeater>


    <!-- PRODUCT CATEGORIES  -->
    <!-- TODO: Slick Implementation  -->

    <asp:Repeater ID="rptProductCategories" runat="server">
        <HeaderTemplate>
            <div class="grid-container">
                <h1 class="productHeading">
                    Product Categories
                </h1>
            <div class="grid-x grid-margin-x">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="cell large-3 medium-3 small-3">
                <div class="productImage">
                    <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("ImagePath")%>' />           
                </div>
                <div class="productCategoryText">
                    <asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("Name")%>' />
                </div>
            </div>
            
        </ItemTemplate>
        <FooterTemplate>
            </div>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <!-- FOOTER  -->
    <footer>
        <div class="grid-container">
             <div class="grid-x">
                 <div class="cell large-8 medium-12 small-12">
                     <div id="footerAddress">
                        
                     </div>
                    <div id="footerLinks">
                            Site Map / Terms / Privacy Policy / Site by 
                    </div>
                 </div>
                 <div class="cell large-4 medium-12 small-12">
                    <div id="footerTelephone">

                    </div>
                    <div id="footerEmail">

                    </div>
                     <div id="socialMediaLinks">
                         <img id="socialMimg" src="Content/img/socialmedia.png" />
                     </div>
                 </div>
            </div>        
        </div>
    </footer>
    <div id="cmslink"><a href="cms">CLICK FOR CMS</a></div>

</asp:Content>
