<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleAPI.aspx.cs" Inherits="GoogleAPI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false">
        
</script>
    <script type="text/javascript">

        function InitializeMap() {
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var myOptions = {
                zoom: 8,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map"), myOptions);
        }
        window.onload = InitializeMap;
        </script>
</head>
<body>
    
    <div id ="map"   style="width: 304px; top: 68px; left: 172px; position: absolute; height: 238px">

</div>
    
</body>
</html>
