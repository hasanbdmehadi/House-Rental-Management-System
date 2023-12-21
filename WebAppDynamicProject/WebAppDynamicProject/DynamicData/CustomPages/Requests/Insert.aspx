<%@ Page Language="C#" MasterPageFile="~/SiteHome.master" CodeBehind="Insert.aspx.cs" Inherits="WebAppDynamicProject.Insertn" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true" />
    
    <h1 style=" margin-left:100px; color:#9b30ff;font-weight:bolder;">Add new entry: <%= table.DisplayName %></h1><br /><br />

    <asp:ScriptManagerProxy runat="server" ID="ScriptManagerProxy1" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="List of validation errors"  Visible="false"/>
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="DetailsView1" Display="None" />

            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="DetailsDataSource" DefaultMode="Insert"
                AutoGenerateInsertButton="True" OnItemCommand="DetailsView1_ItemCommand" OnItemInserted="DetailsView1_ItemInserted"
                CssClass="detailstable6" FieldHeaderStyle-CssClass="bold">
            </asp:DetailsView><br /><br />

            <asp:LinqDataSource ID="DetailsDataSource" runat="server" EnableInsert="true">
            </asp:LinqDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
