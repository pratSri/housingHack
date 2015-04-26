<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchDetail.aspx.cs" Inherits="SearchDetail" %>

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

        //var lang = jQuery.url.param("Longitude");
        //var lati = jQuery.url.param("Latitude");
        //alert(lang, lati);
        FindLocaiton();
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
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script language="javascript" type="text/javascript">

    var map;
    var geocoder;
    function InitializeMap() {
        
        //var latlng = new google.maps.LatLng(-34.397, 150.644);
        var latlng = new google.maps.LatLng(12.9200, 77.6100);
        //var latlng = new google.maps.LatLng(lat, lon);
        var myOptions =
        {
            zoom: 13,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true
        };
        
        map = new google.maps.Map(document.getElementById("map"), myOptions);

       
    }

    function getRequests() {
        var s1 = location.search.substring(1, location.search.length).split('&');
        for (var s in s1) {
            var attribute = s.split('=');
            
        }
    }
    function FindLocaiton() {
        
        geocoder = new google.maps.Geocoder();
        InitializeMap();
        
        //var address = document.getElementById("addressinput").value;
        
        address = "";
        geocoder.geocode({ 'address': address }, function (results, status) {

            if (status == google.maps.GeocoderStatus.OK) {
                
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                var count = 0;
                for (var ob in results) {
                    count++;
                }
                
                document.getElementById("s").innerHTML = results;
            }
            else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });

    }


    

    //window.onload = FindLocaiton;

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
                
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="images/photos/thumb1.png" alt="" />
                        <div class="userinfo">
                            <h5>Juan Dela Cruz <small>- juan@themepixels.com</small></h5>
                            <ul>
                                <li><a href="editprofile.html">Edit Profile</a></li>
                                <li><a href="">Account Settings</a></li>
                                <li><a href="index.html">Sign Out</a></li>
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
            <li><a href="#"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Search Property <span class="separator"></span> Property Analysis</li>
            
            
        </ul>
        
        <div class="pageheader">            
            <div class="pageicon"><span class="iconfa-laptop"></span></div>
            <div class="pagetitle">
                <h5>find your search property details</h5>
                <h1>Property Detail</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
                <div class="mediamgr">
            	<%--<div class="mediamgr_left">
                	<div class="mediamgr_head">
                    	<ul class="mediamgr_menu">
                        	<li>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Agriculture</asp:ListItem>
                                <asp:ListItem>Regedencial</asp:ListItem>
                                <asp:ListItem>Commercial</asp:ListItem>
                                </asp:DropDownList>
                        	</li>
                            <li>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>Land-Free Hold</asp:ListItem>
                                <asp:ListItem>Land</asp:ListItem>
                                <asp:ListItem>Form House</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li class="marginleft15 filesearch">
                            	<form>
                            		<input type="text" id="filekeyword" class="filekeyword" placeholder="Search file here" />
                                </form>
                            </li>
                            <li class="right newfilebtn">
                                <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary"/>
                                </li>
                        </ul>
                        <span class="clearall"></span>
                    </div>--%><!--mediamgr_head-->
                    
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
                        
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False">
                            <Fields>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table class="auto-style1">
                                            <tr>
                                                <td colspan="5">
                                                    <h1>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                    </h1>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5">
                                                    <div id ="map" style="height: 300px; width:800px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><b>No of Person Interested</b></td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NoOfPrsnInterest") %>'></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <b>Sold By</b>
                                                </td>
                                                <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("sellingBy") %>'></asp:Label></td>                                                                                               
                                            </tr>
                                            <tr>
                                                <td><b>No of View</b></td>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("NoOfView") %>'></asp:Label>
                                                </td> 
                                                <td>&nbsp;</td>
                                                <td><b>Owner Detail</b></td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Click to check contact detail</asp:LinkButton>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("OwnerID") %>'/>
                                                </td>
                                            </tr>
                                            <tr>                                                
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td> 
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <b><asp:Label ID="Label11" runat="server" Text=""></asp:Label></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Property Detail</b></td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td><b>&nbsp;</b></td>
                                                <td>
                                                    <b><asp:Label ID="Label12" runat="server" Text=""></asp:Label></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Type</b></td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <b><asp:Label ID="Label13" runat="server" Text=""></asp:Label></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Subtype</b></td>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("SubType") %>'></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td><b>Area</b></td>
                                                <td>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Area") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Locality</b></td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="Click to know more about this locality" PostBackUrl='<%# Eval("locality","~/AreaAnalysis.aspx?locality={0}" )%>'><%# Eval("Locality") %></asp:LinkButton>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td><b>Rates(/sft)</b></td>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Rate") %>'></asp:Label>
                                                </td>                                                
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp</td>
                                                <td><b>Total</b></td>
                                                <td > <!--style ="border-top : 2px solid black"-->
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/rupee.jpg" Width="15" Height="15"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Government Facilities</b></td>
                                                <td>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Facility") %>'></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
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
                
                <div class="mediamgr_right">

<%--                	<div class="mediamgr_rightinner">
                        <h4>Filter Search</h4>
                        <ul class="menuright">
                        	<li class="current">
                                <table>
                                    <tr>
                                        <td>
                                            Artitecture
                                        </td>
                                    </tr>
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
                            <li>
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

                            </li>
                            <li>
                                <table>
                                    <tr>
                                        <td>
                                            Price
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Min Price
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Max Price
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            
                        </ul>
                    </div>
                    --%>
                    <!-- mediamgr_rightinner -->
                </div><!-- mediamgr_right -->
                <br class="clearall" />
            </div><!--mediamgr-->
            
            <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2015. Housing HackerRank.</span>
                    </div>
                    <div class="footer-right">
                        <span>Designed by: <a href="#">Prateek Srivastava</a></span>
                    </div>
                </div><!--footer-->
                
            </div><!--maincontentinner-->
        </div><!--maincontent-->
        
    </div><!--rightpanel-->
    </form>
</div><!--mainwrapper-->

  
</body>

</html>
