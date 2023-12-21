<%@ Page Title="" Language="C#" MasterPageFile="~/SiteHome.Master" AutoEventWireup="true" CodeBehind="PictureDisplay.aspx.cs" Inherits="WebAppDynamicProject.PictureDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<div style="font-size:larger;  width: 30%; height: auto; " >
    
    <br />
</div>
<div style=" vertical-align:top;">
    <br /><br />
    
</div>
--%>
<table  cellpadding="15px" width="80%"   style="border-style:none; margin: 20px;" >
    <tr><td colspan="2"><%--<h4>Select House & Picture Location:</h4>--%><asp:DropDownList ID="ddlHouse" runat="server" Width="300px"
        AutoPostBack="True" onselectedindexchanged="ddlHouse_SelectedIndexChanged" Visible="False"></asp:DropDownList><br /><br />
        <asp:FileUpload ID="fu" runat="server" Width="300px" Visible="False"  /><br />
        <asp:Button ID="upload" runat="server" onclick="upload_Click" Text="upload Picture" Visible="False" />
        </td>
        <td rowspan="3" align="right">
        <asp:Image ID="iDisplay" runat="server"   ImageAlign="Right"  BorderWidth="10px"  Width="895px" Height="400px" BorderColor="#9b30ff" 
        BorderStyle="Inset"  />            
        
        </td></tr>
    
   
        
    <%--<tr><td colspan="2"></td></tr>--%>
    <tr><td colspan="3"><asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor= "green"></asp:Label></td></tr>
    <tr><td></td><td></td><td></td></tr>
   <tr><td><asp:LinkButton ID="linkButton" runat="server" PostBackUrl="/View_VaccantHouses/List.aspx" ForeColor="#9b30ff" Font-Size="Large" Font-Bold="true" >Back to Search Page</asp:LinkButton></td><td colspan="2" align="right"><asp:Label ID="lblHouseNo"  runat="server" Font-Size="XX-Large" Font-Bold="true" ForeColor="Chocolate"></asp:Label></td></tr>
</table><br /><br /><br />
</asp:Content>
