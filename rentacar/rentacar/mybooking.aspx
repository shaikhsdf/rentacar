<%@ Page Title="" Language="C#" MasterPageFile="~/customer.Master" AutoEventWireup="true" CodeBehind="mybooking.aspx.cs" Inherits="rentacar.mybooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="form-row">
    <div>
        <h2> Booking History </h2>
        <hr />
        
    </div>
</div>
        <div class="form-control">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: large" Visible="False" ></asp:Label>
        </div>
  <div class="form-group">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="bookingid" DataSourceID="bookings" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
          <Columns>
              <asp:BoundField DataField="bookingid" HeaderText="Booking ID" ReadOnly="True" SortExpression="bookingid" />
              <asp:BoundField DataField="bookingdate" HeaderText="Date" SortExpression="bookingdate" />
              <asp:BoundField DataField="customername" HeaderText="Name" SortExpression="customername" />
              <asp:BoundField DataField="customerphone" HeaderText="Phone" SortExpression="customerphone" />
              <asp:BoundField DataField="customeraddress" HeaderText="Pick Up Address" SortExpression="customeraddress" />
              <asp:BoundField DataField="name" HeaderText="Car Name" SortExpression="name" />
              <asp:BoundField DataField="fueltype" HeaderText="Fuel Type" SortExpression="fueltype" />
              <asp:BoundField DataField="fare" HeaderText="Fare" SortExpression="fare" />
              <asp:BoundField DataField="fromdate" HeaderText="From" SortExpression="fromdate" />
              <asp:BoundField DataField="todate" HeaderText="To Date" SortExpression="todate" />
              <asp:BoundField DataField="days" HeaderText="Total Days" SortExpression="days" />
              <asp:BoundField DataField="totalamt" HeaderText="Booking Amt" SortExpression="totalamt" />
              <asp:BoundField DataField="payment" HeaderText="Pay Status" SortExpression="payment" />
              <asp:BoundField DataField="status" HeaderText="Booking Status" SortExpression="status" />
          </Columns>
          <FooterStyle BackColor="White" ForeColor="#333333" />
          <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="White" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F7F7F7" />
          <SortedAscendingHeaderStyle BackColor="#487575" />
          <SortedDescendingCellStyle BackColor="#E5E5E5" />
          <SortedDescendingHeaderStyle BackColor="#275353" />
      </asp:GridView>
      <asp:SqlDataSource ID="bookings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [booking] WHERE ([username] = ?)">
          <SelectParameters>
              <asp:QueryStringParameter Name="username" QueryStringField="usr" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  
 
    </form>
</asp:Content>
