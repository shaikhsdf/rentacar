<%@ Page Title="" Language="C#" MasterPageFile="~/customer.Master" AutoEventWireup="true" CodeBehind="bookcar.aspx.cs" Inherits="rentacar.bookcar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="container">
        <div class="align-content-center">
        <div class="form-row">
    <div>
        <h2> Car Booking </h2>
        <hr />
        
    </div>
</div>
  <div class="form-row  align-content-center">
    <div class="form-group col-md-4 container align-content-center ">
        <div class="form-group col-md-6">
      <label for="bookingid" class="align-self-center">Booking ID</label>
        <asp:textbox runat="server" class="form-control " id="bookingid" Enabled="False"></asp:textbox>
     
    </div>
        <asp:datalist runat="server" CellPadding="4" DataSourceID="tempcar" ForeColor="#333333">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td rowspan="3">
                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("pic") %>' Width="200px" />
                        </td>
                        <td rowspan="3">&nbsp;</td>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: large" Text='<%# Eval("name") %>'></asp:Label>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("seater") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label3" runat="server" Text="Seater"></asp:Label>
                            &nbsp;|
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("fueltype") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/images/black rpee.jpg" Width="16px" />
                            &nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Eval("fare") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:datalist>
        <asp:SqlDataSource ID="tempcar" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [bookingtemp] WHERE ([username] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="username" QueryStringField="usr" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
  </div>

    
        <div class="form-row container align-content-center">
  <div class="form-group col-md-3 ">
    <label for="fromdate">From Date</label>
 
      <asp:textbox runat="server" class="form-control" id="fromdate" TextMode="Date" AutoPostBack="True" OnTextChanged="fromdate_TextChanged" ></asp:textbox>
  </div>
  <div class="form-group col-md-3">
    <label for="todate">To Date</label>
 
      <asp:textbox runat="server" class="form-control" id="todate" TextMode="Date" AutoPostBack="True" OnTextChanged="todate_TextChanged"></asp:textbox>
  </div>
           

      </div>
         <div class="form-row align-content-center">
              <div class="form-group col-md-2">
    <label for="days">Total Days</label>
 
      <asp:textbox runat="server" class="form-control" id="days" AutoPostBack="True" OnTextChanged="days_TextChanged"></asp:textbox>
  </div>
  <div class="form-group col-md-2 ">
    <label for="fare">Fare / Day</label>
 
      <asp:textbox runat="server" class="form-control" id="fare" AutoPostBack="True" OnTextChanged="fare_TextChanged" ></asp:textbox>
  </div>
  <div class="form-group col-md-2">
    <label for="total">Booking Amount</label>
 
      <asp:textbox runat="server" class="form-control" id="total" AutoPostBack="True" ></asp:textbox>
  </div>
            

      </div>

  <div class="form-row">
  <div class="form-group col-md-4 ">
    <label for="inputname">Customer Name</label>
 
      <asp:textbox runat="server" class="form-control" id="inputname" placeholder="Full Name"></asp:textbox>
  </div>
  <div class="form-group col-md-2">
    <label for="inputphone">Phone Number</label>
 
      <asp:textbox runat="server" class="form-control" id="inputphone" placeholder="Your Phone Number"></asp:textbox>
  </div>
      </div>
<div class="form-group col-md-6">
    <label for="inputaddress">Pick Up Address</label>
 
      <asp:textbox runat="server" class="form-control" id="inputaddress" placeholder="Full address where you will pick up the car." TextMode="MultiLine"></asp:textbox>
  </div>


  
   <asp:Button ID="later" runat="server" class="btn btn-danger" Text="Save in Drafts" OnClick="later_Click" />
        <asp:Button ID="confirm" runat="server" class="btn btn-danger" Text="Confirm Booking" OnClick="confirm_Click"/>
            </div>
    </form>
</asp:Content>
