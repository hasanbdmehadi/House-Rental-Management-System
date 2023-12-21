<%@ Control Language="C#" CodeBehind="DateTime_Edit.ascx.cs" Inherits="WebAppDynamicProject.DateTime_EditField" %>


<asp:TextBox ID="TextBox1" runat="server" CssClass="droplist" Text='<%# FieldValueEditString %>' Columns="20"></asp:TextBox>
<br /><asp:Calendar ID="CalDate" runat="server" Visible="true"   
    onselectionchanged="CalDate_SelectionChanged"  EnableViewState="False"  CssClass="droplist" ></asp:Calendar>

    
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="droplist" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="droplist" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="droplist" ControlToValidate="TextBox1" Display="Dynamic" />

