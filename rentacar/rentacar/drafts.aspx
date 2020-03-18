<%@ Page Title="" Language="C#" MasterPageFile="~/customer.Master" AutoEventWireup="true" CodeBehind="drafts.aspx.cs" Inherits="rentacar.drafts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            height: 26px;
            width: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="container">
        <div class="form-row">
    <div>
        <h2> My Drafts 
            
        </h2>
        <hr />
        
    </div>
</div>
        <div class="container">
            <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <div class="form-group container align-content-center ">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="draft" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style2" rowspan="2">
                                <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# Eval("pic") %>' Width="300px" />
                            </td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: large" Text='<%# Eval("name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("seater") %>'></asp:Label>
                                &nbsp;<asp:Label ID="Label3" runat="server" Text="Seater  |"></asp:Label>
                                &nbsp;
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("fueltype") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Eval("fromdate") %>'></asp:Label>
                                &nbsp; to&nbsp;
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("todate") %>'></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;
                                <asp:Label ID="Label7" runat="server" Text="Booking Amt"></asp:Label>
                                &nbsp;:
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("totalamt") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="3">&nbsp;
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/images/delete.png" Width="20px" CommandName="deletecar" OnClick="ImageButton1_Click" CommandArgument='<%# Eval("draftid") %>' OnCommand="ImageButton1_Command" />
                                &nbsp;<asp:Button ID="Button2" runat="server" BackColor="#004040" BorderStyle="None" Font-Bold="True" ForeColor="White" Text="Book Now" CommandName="bookcar" OnClick="Button2_Click" CommandArgument='<%# Eval("carid") %>'  />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="draft" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [draft] WHERE ([username] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="username" QueryStringField="usr" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </form>
</asp:Content>
