<%@ Page Title="" Language="C#" MasterPageFile="~/customer.Master" AutoEventWireup="true" CodeBehind="viewcars.aspx.cs" Inherits="rentacar.viewcars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 252px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div class="container">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="carid" DataSourceID="cardatalist" BackColor="White" BorderColor="#EAEAEA" BorderStyle="Solid" BorderWidth="10px" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Both" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White" BorderStyle="Solid" BorderWidth="20px" />
            <ItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1" colspan="2" style="text-align: center">
                            <asp:Image ID="Image1" runat="server" Height="264px" ImageUrl='<%# Eval("pic") %>' Width="300px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" style="font-size: large; font-weight: 700;" Text='<%# Eval("name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("seater", "{0}") %>'></asp:Label>
                            &nbsp;
                            <asp:Label ID="Label3" runat="server" Text="Seater"></asp:Label>
                            &nbsp;|&nbsp;
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("fueltype") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/images/black rpee.jpg" Width="22px" />
                            &nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Eval("fare") %>'></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:Button ID="Button1" runat="server" BackColor="#005151" BorderStyle="None" Font-Bold="True" ForeColor="White" Text="Book" Width="96px" CommandName="bookcar" CommandArgument='<%# Eval("carid") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>

        <asp:SqlDataSource ID="cardatalist" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [car] WHERE ([status] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Available" Name="status" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</form>
</asp:Content>
