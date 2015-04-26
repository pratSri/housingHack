<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AreaAnalysis.aspx.cs" Inherits="AreaAnalysis" %>

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
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script language="javascript" type="text/javascript">

        var map;
        var geocoder;
        function InitializeMap() {
            
            //var latlng = new google.maps.LatLng(-34.397, 150.644);
            var latlng = new google.maps.LatLng(12.9200, 77.6100);
            var myOptions =
            {
                zoom: 13,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                disableDefaultUI: true
            };
            //map = new google.maps.Map(document.getElementById("map"), myOptions);
        }

        function getRequests() {
            var s1 = location.search.substring(1, location.search.length).split('=');            
            return s1[1];
        }

        //Some issue in recurtion, may response not support or take more time
        //We can take a look in future
        var count = 0;
        function FindLocaiton1(adrs) {

            geocoder = new google.maps.Geocoder();
            var address = "";
            InitializeMap();
            if (count === 0) {
                address  = "Schools in " + adrs;
            }
            else
                if(count ===1)
                {
                    address  = "Banks in " + adrs;
                }
                else
                    if (count === 2) {
                        address = "Hospitals in " + adrs;
                    }
            count++;
            geocoder.geocode({ 'address': address }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        
                        var i = 0;
                        for (var ob in results) {
                            i++;
                        }
                        if (count === 1) {
                            document.getElementById("lblSchools").innerHTML = i;
                            FindLocaiton1(adrs);
                        }
                        else
                            if (count === 2) {
                                document.getElementById("lblBanks").innerHTML = i;
                                FindLocaiton1(adrs);
                            }
                            else 
                                if (count == 3) {
                                    document.getElementById("lblHospital").innerHTML = i;
                                }
                    }
                    else {
                        alert("Geocode was not successful for the following reason: " + status);
                    }
                });
            

        }

        function checkLocality(adrs) {
            
            var address = getRequests(); //requestAnimationFrame document.getElementById("Label1").value;
            if (address != null) {
                FindLocaiton1(address);

            }
            else
                if(adrs != null)
            {
                FindLocaiton1(adrs);
            }
            
        }

        jQuery(document).ready(function () {

            checkLocality("");
            
            });
        
        </script>
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
                                <li><a href="">Account Settings</a></li>
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
                <h5>find your suitable area</h5>
                <h1>Area Analyser</h1>
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
                                <asp:ListItem>INDIA</asp:ListItem>                                
                                </asp:DropDownList>
                        	</li>
                            <li>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>Karnataka</asp:ListItem>                                
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:DropDownList ID="DropDownList3" runat="server">
                                <asp:ListItem>Bangalore</asp:ListItem>                                
                                </asp:DropDownList>
                            </li>
                            <li class="marginleft15 filesearch">
                                <asp:TextBox ID="TextBox3" runat="server" class="filekeyword" ToolTip="Search location here" Text ="BTM"></asp:TextBox>
                            		
                                
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
                        
                        <table class="table responsive">
                            <th>Area</th> 
                            <th>No Of Schools</th>
                            <th>No Of Banks</th>
                            <th>No Of Hospital</th>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </td>
                            
                                <td>
                                    <asp:Label ID="lblSchools" runat="server" Text=""></asp:Label>
                                </td>
                            
                                <td>
                                    <asp:Label ID="lblBanks" runat="server" Text=""></asp:Label>
                                </td>
                            
                                <td>
                                    <asp:Label ID="lblHospital" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
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
                        	<li class="current">
                                <table class="table responsive">
                                                                  
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox1" runat="server"/>Schools
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox4" runat="server"/>Banks
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                                            
                                            <asp:CheckBox ID="CheckBox5" runat="server"/>Hospitals
                                        </td>
                                    </tr>
                                    
                                </table>
                        	</li>                            
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
