<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="rentacar.history" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server" class="container">
        <div class="form-row">
    <div>
        <h2> List of All Bookings
            
        </h2>
        <hr />
        
    </div>

            </div>
        <div class="form-row">       
         <div class="form-group col-md-3 ">
      <label for="searchstatus">Search By Booking Status</label>
    
          <asp:DropDownList id="searchstatus" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="searchstatus_SelectedIndexChanged">
              <asp:ListItem>Confirmed</asp:ListItem>
              <asp:ListItem Selected="True">Booked</asp:ListItem>
              <asp:ListItem>Completed</asp:ListItem>
              <asp:ListItem>Cancelled</asp:ListItem>
            </asp:DropDownList>
       
    </div>
          <div class="form-group col-md-2" >
    <label for="searchbookid">Booking ID</label>
    <asp:TextBox runat="server" class="form-control" id="searchbookid" placeholder="1" AutoPostBack="True" OnTextChanged="searchbookid_TextChanged"></asp:TextBox>
  </div>
             <div class="form-group col-md-2" >
    <label for="searchphone">Customer Phone</label>
    <asp:TextBox runat="server" class="form-control" id="searchphone" placeholder="phone number" AutoPostBack="True" OnTextChanged="searchphone_TextChanged"></asp:TextBox>
  </div>
            <div class="form-group col-md-3" >
    <label for="searchname">Customer name</label>
    <asp:TextBox runat="server" class="form-control" id="searchname" placeholder="Customer Name" AutoPostBack="True" OnTextChanged="searchname_TextChanged"></asp:TextBox>
  </div>
             <div class="form-group col-md-1" >
    <label for="searchcarid">CarID</label>
    <asp:TextBox runat="server" class="form-control" id="searchcarid" placeholder="1" AutoPostBack="True" OnTextChanged="searchcarid_TextChanged"></asp:TextBox>
  </div>
             <div class="form-group col-md-1 ">          
                            
                    <br />
              <p></p>
                <asp:ImageButton ID="refresh" runat="server" Height="30px" ImageUrl="~/images/refresh.png" Width="30px" OnClick="refresh_Click" />
                </div>
             </div>
          <div class="container" >
             <asp:label runat="server" id="Label1" style="font-weight: 700; font-size: large" Visible="False"></asp:label>
         </div>
         <div >
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                 <Columns>
                     <asp:BoundField DataField="bookingid" HeaderText="ID" ReadOnly="True" />
                     <asp:BoundField DataField="bookingdate" HeaderText="Date" ReadOnly="True" />
                     <asp:BoundField DataField="customername" HeaderText="CustomerName" ReadOnly="True" />
                     <asp:BoundField DataField="customerphone" HeaderText="Phone" ReadOnly="True" />
                     <asp:BoundField DataField="customeraddress" HeaderText="Address" ReadOnly="True" />
                     <asp:BoundField DataField="carid" HeaderText="CarID" ReadOnly="True" />
                     <asp:BoundField DataField="name" HeaderText="CarName" ReadOnly="True" />
                     <asp:BoundField DataField="fromdate" HeaderText="From" ReadOnly="True" />
                     <asp:BoundField DataField="todate" HeaderText="To" ReadOnly="True" />
                     <asp:BoundField DataField="totalamt" HeaderText="Paid Amt" ReadOnly="True" />
                     <asp:BoundField DataField="status" HeaderText="Status" ReadOnly="True" />
                     <asp:CommandField SelectText="View" ShowCancelButton="False" ShowSelectButton="True" >
                     <ItemStyle ForeColor="#336699" />
                     </asp:CommandField>
                 </Columns>
                 <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                 <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                 <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#F7F7F7" />
                 <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                 <SortedDescendingCellStyle BackColor="#E5E5E5" />
                 <SortedDescendingHeaderStyle BackColor="#242121" />
             </asp:GridView>
             </div>
         </form>
</asp:Content>
