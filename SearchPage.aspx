<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchPage.aspx.cs" Inherits="SearchPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style.default.css" type="text/css" />
<link rel="stylesheet" href="css/isotope.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.min.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="js/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {

        //Replaces data-rel attribute to rel.
        //We use data-rel because of w3c validation issue
        jQuery('a[data-rel]').each(function () {
            jQuery(this).attr('rel', jQuery(this).data('rel'));
        });

        jQuery("#medialist a").colorbox();

    });
    jQuery(window).load(function () {
        jQuery('#medialist').isotope({
            itemSelector: 'li',
            layoutMode: 'fitRows'
        });

        if (jQuery('#GridView1').length) {
            jQuery('#rightMenu').show();
        }
        else
        {
            jQuery('#rightMenu').hide();
        }
        // Media Filter
        jQuery('#mediafilter a').click(function () {

            var filter = (jQuery(this).attr('href') != 'all') ? '.' + jQuery(this).attr('href') : '*';
            jQuery('#medialist').isotope({ filter: filter });

            jQuery('#mediafilter li').removeClass('current');
            jQuery(this).parent().addClass('current');

            return false;
        });
    });

   
</script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        </style>
</head>
<body>
        
<div class="mainwrapper">
    
    <div class="header">
        <div class="logo">
            <a href="#"><h1 style ="color:#FFFFFF">HOUSING</h1></a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <%--<li class="odd">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="count">4</span>
                        <span class="head-icon head-message"></span>
                        <span class="headmenu-label">Messages</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-header">Messages</li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Jack</strong> <small class="muted"> - 19 hours ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Daniel</strong> <small class="muted"> - 2 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Jane</strong> <small class="muted"> - 3 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Tanya</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Lee</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li class="viewmore"><a href="messages.html">View More Messages</a></li>
                    </ul>
                </li>
                <li>
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <span class="count">10</span>
                    <span class="head-icon head-users"></span>
                    <span class="headmenu-label">New Users</span>
                    </a>
                    <ul class="dropdown-menu newusers">
                        <li class="nav-header">New Users</li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb1.png" alt="" class="userthumb" />
                                <strong>Draniem Daamul</strong>
                                <small>April 20, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb2.png" alt="" class="userthumb" />
                                <strong>Shamcey Sindilmaca</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb3.png" alt="" class="userthumb" />
                                <strong>Nusja Paul Nawancali</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb4.png" alt="" class="userthumb" />
                                <strong>Rose Cerona</strong>
                                <small>April 18, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb5.png" alt="" class="userthumb" />
                                <strong>John Doe</strong>
                                <small>April 16, 2013</small>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="odd">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <span class="count">1</span>
                    <span class="head-icon head-bar"></span>
                    <span class="headmenu-label">Statistics</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-header">Statistics</li>
                        <li><a href=""><span class="icon-align-left"></span> New Reports from <strong>Products</strong> <small class="muted"> - 19 hours ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> New Statistics from <strong>Users</strong> <small class="muted"> - 2 days ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> New Statistics from <strong>Comments</strong> <small class="muted"> - 3 days ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> Most Popular in <strong>Products</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> Most Viewed in <strong>Blog</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li class="viewmore"><a href="charts.html">View More Statistics</a></li>
                    </ul>
                </li>--%>
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="images/photos/thumb1.png" alt="" />
                        <div class="userinfo">
                            <h5>Prateek Srivastava <small>- prat_sri@yahoo.com</small></h5>
                            <ul>
                                <li><a href="#">Edit Profile</a></li>
                                <li><a href="#">Account Settings</a></li>
                                <li><a href="#">Sign Out</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul><!--headmenu-->
        </div>
    </div>
    
    <div class="leftpanel">
        
        <div class="leftmenu">        
            <ul class="nav nav-tabs nav-stacked">
            	<li class="nav-header">Navigation</li>
                <li><a href="SearchPage.aspx"><span class="iconfa-laptop"></span> Search Property</a></li>
                <li><a href="AreaAnalysis.aspx"><span class="iconfa-hand-up"></span> Area Analysis</a></li>
                <li><a href="SearchHistory.aspx"><span class="iconfa-hand-up"></span> Previous History</a></li>                   
            </ul>
        </div><!--leftmenu-->
        
    </div><!-- leftpanel -->
    <form id ="form1" runat="server">
         <div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Search Property</li>
            
            
        </ul>
        
        <div class="pageheader">            
            <div class="pageicon"><span class="iconfa-laptop"></span></div>
            <div class="pagetitle">
                <h5>find your suitable properties</h5>
                <h1>Property Finder</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
                <div class="mediamgr">
            	<div class="mediamgr_left">
                	<div class="mediamgr_head">
                    	<ul class="mediamgr_menu">
                        	<li>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                
                                </asp:DropDownList>
                        	</li>
                            <li>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                
                                </asp:DropDownList>
                            </li>
                            <li class="marginleft15 filesearch">
                                <asp:TextBox ID="TextBox3" runat="server" class="filekeyword"></asp:TextBox>
                            		
                                
                            </li>
                            <li class="right newfilebtn">
                                <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" OnClick="Button1_Click"/>
                                </li>
                        </ul>
                        <span class="clearall"></span>
                    </div><!--mediamgr_head-->
                    
                    <div class="mediamgr_category">
                    <%--<ul id="mediafilter">
                        	<li class="current"><a href="all">All</a></li>
                            <li><a href="image">Images</a></li>
                            <li><a href="video">Video</a></li>
                            <li><a href="audio">Audio</a></li>
                            <li><a href="doc">Documents</a></li>
                            <li class="right"><span class="pagenuminfo">Showing 1 - 20 of 69</span></li>
                        </ul>--%>
                    </div><!--mediamgr_category-->
                    
                    <div class="mediamgr_content">
                        
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="lkBtn1" runat="server" Value='<%# Eval("Property_ID") %>'/>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Longitude") %>' />
                                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("Latitude") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/map.jpg" Width ="60" Height="60"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table class="auto-style1">
                                            <tr>
                                                <td colspan="3">
                                                    <h1>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# string.Format("~/SearchDetail.aspx?Id={0}&Longitude={1}&Latitude={2}",
                    HttpUtility.UrlEncode(Eval("Property_ID").ToString()), HttpUtility.UrlEncode(Eval("Longitude").ToString()), HttpUtility.UrlEncode(Eval("Latitude").ToString())) %>'
                    Text='<%#Eval("Description") %>' />                                                        
                                                        <%--<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# Eval("'Property_id','Longitude'","~/SearchDetail.aspx?Id={0}&Longitude={1}" )%>'><%#Eval("Description") %></asp:LinkButton>--%>
                                                    </h1>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td align="right">
                                                    <b><asp:Label ID="Label3" runat="server" Text='<%#Eval("Price") %>'></asp:Label></b>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/rupee.jpg" Width="15" Height="15"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Locality :</b><asp:Label ID="Label2" runat="server" Text='<%#Eval("Locality") %>'></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td align="right">
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("createdDTTM") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                            </Columns>
                            
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            
                        </asp:GridView>
<%--                    	
                        <ul id="medialist" class="listfile">
                        	<li class="image">
                              <a href="ajax/image.html"><img src="images/thumbs/image1.png" alt="" /></a>
                            	<span class="filename">Image1.jpg</span>
                           </li>
                        	<li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image2.png" alt="" /></a>
                            	<span class="filename">Image2.jpg</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial1.pdf</span>
                            </li>
                            <li class="video">
                                <a href="ajax/video.html"><img src="images/thumbs/video.png" alt="" /></a>
                            	<span class="filename">Movie1.avi</span>
                            </li>
                            <li class="audio">
                                <a href="ajax/audio.html"><img src="images/thumbs/audio.png" alt="" /></a>
                            	<span class="filename">Song1.mp3</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial2.pdf</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial3.pdf</span>
                            </li>
                            <li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image3.png" alt="" /></a>
                            	<span class="filename">Image1.jpg</span>
                            </li>
                        	<li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image4.png" alt="" /></a>
                            	<span class="filename">Image2.jpg</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html" data-rel="doc"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutoria4.pdf</span>
                            </li>
                            <li class="video">
                                <a href="ajax/video.html"><img src="images/thumbs/video.png" alt="" /></a>
                            	<span class="filename">Movie1.avi</span>
                            </li>
                            <li class="audio">
                                <a href="ajax/audio.html"><img src="images/thumbs/audio.png" alt="" /></a>
                            	<span class="filename">Song1.mp3</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial5.pdf</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial6.pdf</span>
                            </li>
                            <li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image5.png" alt="" /></a>
                            	<span class="filename">Image1.jpg</span>
                            </li>
                        	<li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image6.png" alt="" /></a>
                            	<span class="filename">Image2.jpg</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial.pdf</span>
                            </li>
                            <li class="video">
                                <a href="ajax/video.html"><img src="images/thumbs/video.png" alt="" /></a>
                            	<span class="filename">Movie1.avi</span>
                            </li>
                            <li class="audio">
                                <a href="ajax/audio.html"><img src="images/thumbs/audio.png" alt="" /></a>
                            	<span class="filename">Song1.mp3</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial1.pdf</span>
                            </li>
                        </ul>
                        --%>
                        <br class="clearall" />
                        
                    </div><!--mediamgr_content-->
                    
                </div><!--mediamgr_left -->
                
                <div class="mediamgr_right" id="rightMenu">
                	<div class="mediamgr_rightinner">
                        <h4>Filter Search</h4>
                        <ul class="menuright">
                            <li>
                                <table class="table responsive">
                                    <th>Price</th>

                                    
                                    <tr>
                                        <td>
                                            Min Area
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtMinArea" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Max Price
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtMaxPrice" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        	<li class="current">
                                <table class="table responsive">
                                    <th>Artitecture</th>                                    
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox1" runat="server"/>Vastu Artitecture
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox4" runat="server"/>East Facing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox5" runat="server"/>West Facing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox6" runat="server"/>North Facing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox7" runat="server"/>South Facing
                                        </td>
                                    </tr>
                                </table>
                                
                        	</li>
                            <%--<li>
                                <table>
                                    <tr>
                                        <td>
                                            Facility within 5 Km
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckBox2" runat="server" />Roads
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckBox8" runat="server" />Schools
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckBox9" runat="server" />Markets
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckBox10" runat="server" />Others
                                        </td>
                                    </tr>
                                </table>

                            </li>--%>
                            
                            
                        </ul>
                    </div><!-- mediamgr_rightinner -->
                </div><!-- mediamgr_right -->
                <br class="clearall" />
            </div><!--mediamgr-->
            
            <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2015. Housing HackerRank.</span>
                    </div>
                    <div class="footer-right">
                        <span>Design by: <a href="#">Prateek Srivastava</a></span>
                    </div>
                </div><!--footer-->
                
            </div><!--maincontentinner-->
        </div><!--maincontent-->
        
    </div><!--rightpanel-->
    </form>
</div><!--mainwrapper-->

  
</body>

</html>
