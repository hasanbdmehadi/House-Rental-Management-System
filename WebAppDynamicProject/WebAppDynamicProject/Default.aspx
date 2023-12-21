<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="WebAppDynamicProject._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server" />

    <div>
    <asp:GridView ID="Menu1" runat="server" AutoGenerateColumns="False"
        CssClass="gridview9" AlternatingRowStyle-CssClass="even" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:TemplateField HeaderText="Operational Dashboard" SortExpression="TableName">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("ListActionPath") %>'><%#Eval("DisplayName") %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />

<AlternatingRowStyle CssClass="even" BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
    </asp:GridView> 
    </div><br /><br />        
</asp:Content>


