<%@ Page Language="C#" MasterPageFile="~/Print.Master" CodeBehind="Details.aspx.cs" Inherits="WebAppDynamicProject.DetailsR" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true" />
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="text-align: center";>
    <h2 >House Renting Management</h2>
    <h4>Address:Mirpur-1, Zoo Road,Dhaka</h4>
    <h4>Tel:+8802-8056208, houserental@gmail.com</h4>
    <h4>Agent Name: Zafrul Kabir</h4>
    <h4>Reciept No:0001</h4>
    <h5>Date: <%=DateTime.Now %></h5>
        
    </div>
    <h2 style="text-align: center";>&nbsp;&nbsp; Details of <%= table.DisplayName %></h2><hr /><br />
    <asp:ScriptManagerProxy runat="server" ID="ScriptManagerProxy1" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="List of validation errors" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="DetailsView1" Display="None" />

            <asp:DetailsView ID="DetailsView1" runat="server" 
                DataSourceID="DetailsDataSource" OnItemDeleted="DetailsView1_ItemDeleted"
                CssClass="Printable" FieldHeaderStyle-CssClass="bold" Width="264px" 
                BorderStyle="None" GridLines="None" >
                <FieldHeaderStyle CssClass="bold" />
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="EditHyperLink" runat="server" CssClass="nonPrintable"
                                NavigateUrl='<%# table.GetActionPath(PageAction.Edit, GetDataItem()) %>'
                                Text="Edit" />
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false" CssClass="nonPrintable"
                                OnClientClick='return confirm("Are you sure you want to delete this item?");'
                                Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <br /><hr />
            <h2 style="text-align: center";> Authorized Signature</h2>
            <p ;="" style="text-align: center">
                &nbsp;</p>
            <p ;="" style="text-align: center">
                &nbsp;</p>
            <p ;="" style="text-align: center">
                &nbsp;</p>
            <asp:LinqDataSource ID="DetailsDataSource" runat="server" EnableDelete="true">
                <WhereParameters>
                    <asp:DynamicQueryStringParameter />
                </WhereParameters>
            </asp:LinqDataSource>

            <br />
            <div>Vat Note: For owners 20%, for agent 15%, for client 10% of total rent.</div>

            <div class="bottomhyperlink">
                <asp:HyperLink ID="ListHyperLink" runat="server"  CssClass="nonPrintable">Show all items</asp:HyperLink>
            </div>  
            <br /><br />
            <span><input id="ppp" type="button" value="Print"  onclick="pprint()" class="nonPrintable"/></span>
            <h5>&nbsp;&nbsp; @2017 HouseRenting System, All rights reserved.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h5>      
            
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <%--<script type="text/javascript">
        window.print();
    </script>--%>
    
    <script type="text/javascript">
        function pprint() {
            window.print();
        }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .Printable
        {
            text-align: center;
        }
    </style>

</asp:Content>
