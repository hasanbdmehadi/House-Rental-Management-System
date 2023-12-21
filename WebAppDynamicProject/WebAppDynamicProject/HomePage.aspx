<%@ Page Title="Client Home Page" Language="C#" MasterPageFile="~/SiteHome.master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebAppDynamicProject.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

<!--div id="main"-->	
  	
<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
       <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <!-- <li data-target="#myCarousel" data-slide-to="3"></li> 
      <li data-target="#myCarousel" data-slide-to="4"></li>  
      <li data-target="#myCarousel" data-slide-to="5"></li> 
      <li data-target="#myCarousel" data-slide-to="6"></li> -->
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
       <!--div class="item">
           <h2>Welcome to Housing Rental System</h2>
           <h2></h2>
                                
      </div-->

      <div class="item active">
      
        <p>
      	 	
     	<img src="images/15840947_1835628916692233_1042093865_n.jpg" alt="my photo" height="350" width="600">
	<img src="images/15879319_1835628896692235_1619915342_n.jpg" alt="my photo" height="350" width="600"> </br>  
     <div class="carousel-caption"><br /><h4 style="color:blue; margin-left:5px;">Welcome to  HouseRenting.com  If you’re a renter who needs a place to live, you’ve come to the right place! House Renting.com makes it quick and easy for tenants to search for rental homes.</h4><br />
        <a href="View_VaccantHouses/List.aspx" style="color:#9b30ff; font-weight:bolder;">Find Vaccant Houses</a>
    </div>        
        </p>	
      </div>
      <div class="item">
          <p>
      		
     	<img src="images/15841041_1835628856692239_691366931_n.jpg" alt="my photo" height="350" width="600">
	<img src="images/360_nos_residential_flats_building_1.png" alt="my photo" height="350" width="600"></br>  
     <div class="carousel-caption"><br /><h4 style="color:blue; margin-left:5px;">Welcome to  HouseRenting.com  If you’re a renter who needs a place to live, you’ve come to the right place! House Renting.com makes it quick and easy for tenants to search for rental homes.</h4><br /> 
        <a href="View_VaccantHouses/List.aspx" style="color:#9b30ff; font-weight:bolder;">Find Vaccant Houses</a>
        
    </div>        
                
        </p>
	</div>
      <div class="item">
          <!-- h2>Build a new skills on <strong>Programming</strong></h2
          <p>
      		
     	<img src="images/Rangamati_Lake_bd.jpg" alt="my photo" height="350" width="600">
	<img src="images/sansad_design.jpg" alt="my photo" height="350" width="600">
                
        </p>
	</div> 

      <!--class="btn btn-lg" btn btn-default btn-sign-up-->
     <!-- <div class="item">
      	<p>
      		
     	<img src="images/Dell-600x337.jpg" alt="my photo" height="350" width="600">
	<img src="images/Lumia-535-600x337.png" alt="my photo" height="350" width="600">
                
        </p>
     </div>

    <!--/div>
    </div-->
    <div class="item">
          <p>
     	<img src="images/ffe08b55d9bfa82b5b4e903198cad7b9.jpg" alt="my photo" height="350" width="600">
	<img src="images/images.jpg" alt="my photo" height="350" width="600">
        <!--div class="carousel-caption">
          Find us <br>through http://www.bing.com
        </div-->
        <p>
     </div> 
     
     <div class="item">
     	<p>
     	<img src="images/padma2.jpg" alt="my photo" height="250" width="600" > 
	    <img src="images/LearnfromMCT6.jpg" alt="my photo" height="250" width="600"></br>  
     <div class="carousel-caption">
        <a href="View_VaccantHouses/List.aspx" style="color:#9b30ff; font-weight:bolder;">Find Vaccant Houses</a>
    </div>        
	 </p>   
       
     </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>   

 

  <!--div id="foot01"></div-->

<!--/div-->
</asp:Content>
