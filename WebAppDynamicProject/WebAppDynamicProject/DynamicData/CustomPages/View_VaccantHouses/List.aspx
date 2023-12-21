<%@ Page Language="C#" MasterPageFile="~/SiteHome.master" CodeBehind="List.aspx.cs" Inherits="WebAppDynamicProject.nList" %>

<%@ Register src="~/DynamicData/Content/GridViewPager.ascx" tagname="GridViewPager" tagprefix="asp" %>
<%@ Register src="~/DynamicData/Content/FilterUserControl.ascx" tagname="DynamicFilter" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true" />

    <div><h1 style="color:#9b30ff;  font-weight:bold; margin-left:20px;">List of Vaccant Houses <%-- %><%= table.DisplayName%> --%></h1></div><br />

    <asp:ScriptManagerProxy runat="server" ID="ScriptManagerProxy1" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="List of validation errors" />
            <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1" Display="None" />
--%>            <span class="style2">&nbsp; Area:</span> <asp:DropDownList ID="ddlHouse" runat="server" AutoPostBack="false"  ForeColor="Black" Font-Size="Medium" Height="29px" 
                           Width="247px"></asp:DropDownList>
                
            <span class="style2">&nbsp;&nbsp;&nbsp; Category:</span><asp:DropDownList ID="ddlHouse2" runat="server" AutoPostBack="false"  ForeColor="Black" Font-Size="Medium" Height="29px" 
             Width="247px"></asp:DropDownList>
             
             <asp:Button ID="btnSearh" runat="server" onclick="btnSearh_Click"  Text="Search" Height="29px" Font-Size="Medium" ForeColor="Black"/>
                <br />
                <br />
            
            
           
            
            
            <%--<asp:FilterRepeater ID="FilterRepeater" runat="server" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" AssociatedControlID="DynamicFilter$DropDownList1" 
                        Font-Bold="true" Font-Size="1.85em" Text='<%# Eval("DisplayName") %>' />
                    20
                    <asp:DynamicFilter ID="DynamicFilter" runat="server" 
                        OnSelectedIndexChanged="OnFilterSelectedIndexChanged" />
                </ItemTemplate>
                <FooterTemplate>
                    <br />
                    <br />
                </FooterTemplate>
            </asp:FilterRepeater>--%>
            <%--<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" CssClass="gridview6" DataSourceID="GridDataSource">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="EditHyperLink" runat="server" 
                                NavigateUrl="<%# table.GetActionPath(PageAction.Edit, GetDataItem()) %>" 
                                Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" 
                                CommandName="Delete" 
                                OnClientClick="return confirm(&quot;Are you sure you want to delete this item?&quot;);" 
                                Text="Delete" />
                            &nbsp;<asp:HyperLink ID="DetailsHyperLink" runat="server" 
                                NavigateUrl="<%# table.GetActionPath(PageAction.Details, GetDataItem()) %>" 
                                Text="Details" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="footer" />
                <PagerTemplate>
                    <asp:GridViewPager runat="server" />
                </PagerTemplate>
                <EmptyDataTemplate>
                    There are currently no items in this table.
                </EmptyDataTemplate><%--AutoGenerateSelectButton="True"
                
                 <%--<asp:TemplateField HeaderText="Send Request">                   
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1"
                        CommandArgument='<%# Eval("HouseID") %>' 
                        CommandName="SendMessage" runat="server">
                        Send Request</asp:LinkButton>
                    </ItemTemplate>
                    
                    </asp:TemplateField>--%>
                    
            <!--</asp:GridView>--%> -->
            <asp:GridView ID="GridView2" runat="server" CssClass="gridview6"  
            DataKeyNames="HouseID" onrowcommand="GridView2_RowCommand" >
                
             <SelectedRowStyle BorderColor="#009900" BackColor="#FFFFCC"  />
                <Columns>
                <asp:TemplateField HeaderText="Select">                   
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton6"
                        CommandArgument='<%# Eval("HouseID") %>' 
                        CommandName="Select" runat="server">
                        Select</asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Display Picture">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2"
                        CommandArgument='<%# Eval("HouseID") %>' 
                        CommandName="DisplayPicture" runat="server">
                        Display</asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

                <EmptyDataTemplate>
                    There are currently no items in this table.
                </EmptyDataTemplate>
            </asp:GridView>
            <%--<asp:LinqDataSource ID="GridDataSource" runat="server" EnableDelete="true">
                <WhereParameters>
                    <asp:DynamicControlParameter ControlID="FilterRepeater" />
                    
                </WhereParameters>
            </asp:LinqDataSource>--%>
            <br />
            <h3 style="color:#9b30ff;  font-weight:bold; margin-left:20px;">Request Form</h3>
          
           <div class="gridview6">
            <h5 style="color:Black;  font-weight:bold; ">First Name:</h5><asp:TextBox ID="txtName" runat="server"  Width="300px" Font-Size="Medium" ForeColor="Black" Font-Bold="true"></asp:TextBox><br />
            <h5 style="color:Black;  font-weight:bold; ">Last Name:</h5><asp:TextBox ID="txtLast" runat="server"  Width="300px" Font-Size="Medium" ForeColor="Black" Font-Bold="true"></asp:TextBox><br />
             <h5 style="color:Black;  font-weight:bold;">Phone No:</h5><asp:TextBox ID="txtPhone" runat="server" Width="300px" Font-Size="Medium" ForeColor="Black"  Font-Bold="true"></asp:TextBox><br />
             <h5 style="color:Black;  font-weight:bold;">email:</h5><asp:TextBox ID="txtMessage" runat="server" Width="300px" Font-Size="Medium" ForeColor="Black"  Font-Bold="true"></asp:TextBox><br /> <br /> <br />
            <asp:Button ID="btnSend" runat="server" Text="send request" Height="30px"  Width="110px" Font-Bold="true" Font-Size="Larger" 
                    onclick="btnSend_Click" />
            
           </div><hr />
           <div>
                <asp:Label ID="lbldisplay" runat="server" ForeColor="green" Font-Size="XX-Large" Font-Bold="true"></asp:Label></div>

            <div>
            
                <a href="../../../HomePage.aspx" 
                    style=" font-size:3.05em; color:#9b30ff; font-weight:bold; margin-right:65px;  float:right;">
                Back to HomePage</a> <%--<a href="../Requests/Insert.aspx" 
                    style=" font-size:3.05em; color:#9b30ff; font-weight:bold; margin-right:65px;  float:right;">
                House Request Form</a>--%></div>
            <br />
                        

           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style2
        {
            font-size: x-large;
            font-weight: bold;
            color:#9b30ff; 
        }
    </style>

</asp:Content>

