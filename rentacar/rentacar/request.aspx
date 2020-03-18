<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="request.aspx.cs" Inherits="rentacar.request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server" class="container">
        <div class="form-row">
    <div>
        <h2> List of Booking Requests 
            
        </h2>
        <hr />
        
    </div>

            </div>
         <div>
             <asp:label runat="server" id="Label1" style="font-weight: 700; font-size: large"></asp:label>
         </div>
         <div>
             <asp:gridview runat="server" id="gridview1" AutoGenerateColumns="False" DataKeyNames="bookingid" DataSourceID="bookingrequest" OnSelectedIndexChanged="gridview1_SelectedIndexChanged" OnRowCommand="gridview1_RowCommand" OnSelectedIndexChanging="gridview1_SelectedIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCancelingEdit="gridview1_RowCancelingEdit">
                 <Columns>
                     <asp:BoundField DataField="bookingid" HeaderText="ID" ReadOnly="True" SortExpression="bookingid" />
                     <asp:BoundField DataField="bookingdate" HeaderText="Date" SortExpression="bookingdate" />
                     <asp:BoundField DataField="customername" HeaderText="CustomerName" SortExpression="customername" />
                     <asp:BoundField DataField="customerphone" HeaderText="Phone" SortExpression="customerphone" />
                     <asp:BoundField DataField="customeraddress" HeaderText="Address" SortExpression="customeraddress" />
                     <asp:BoundField DataField="carid" HeaderText="carID" SortExpression="carid" />
                     <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                     <asp:BoundField DataField="fromdate" HeaderText="FromDate" SortExpression="fromdate" />
                     <asp:BoundField DataField="todate" HeaderText="ToDate" SortExpression="todate" />
                     <asp:BoundField DataField="days" HeaderText="Days" SortExpression="days" />
                     <asp:BoundField DataField="totalamt" HeaderText="Paid Amt" SortExpression="totalamt" />
                     <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                     <asp:CommandField SelectText="Confirm" ShowCancelButton="False" ShowSelectButton="True">
                     <ItemStyle ForeColor="#006666" />
                     </asp:CommandField>
                     <asp:CommandField>
                     <ItemStyle ForeColor="#990000" />
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
             </asp:gridview>
             <asp:SqlDataSource ID="bookingrequest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT * FROM [booking] WHERE ([status] = ?) ORDER BY [bookingid] DESC">
                 <SelectParameters>
                     <asp:Parameter DefaultValue="Booked" Name="status" Type="String" />
                 </SelectParameters>
             </asp:SqlDataSource>
         </div>
            </form>
</asp:Content>
