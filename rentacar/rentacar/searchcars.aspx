<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="searchcars.aspx.cs" Inherits="rentacar.searchcars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server" class="container">
        <div class="form-row">
    <div>
        <h2> List of All Cars
            
        </h2>
        <hr />
        
    </div>
            <div >
             <asp:label runat="server" id="Label1" style="font-weight: 700; font-size: large" Visible="False"></asp:label>
         </div>

            </div>
        <div class="form-row">       
         <div class="form-group col-md-2 ">
      <label for="searchcarid">Search By Car ID</label>
             <asp:TextBox ID="searchcarid" CssClass="form-control " runat="server" placeholder="Car ID" AutoPostBack="True" OnTextChanged="searchcarid_TextChanged"></asp:TextBox>         
       
    </div>
             <div class="form-group col-md-3 ">
      <label for="searchcarname">Car Name</label>
             <asp:TextBox ID="searchcarname" CssClass="form-control " runat="server" placeholder="Car Name" AutoPostBack="True" OnTextChanged="searchcarname_TextChanged"></asp:TextBox>         
       
    </div>
             <div class="form-group col-md-2  ">
      <label for="searchcarno">Car No. </label>
             <asp:TextBox ID="searchcarno" CssClass="form-control " runat="server" placeholder="Car No. Plate" AutoPostBack="True" OnTextChanged="searchcarno_TextChanged"></asp:TextBox>       
       
    </div>
            <div class="form-group col-md-3  ">
      <label for="searchstatus">Car Status </label>
                <asp:DropDownList ID="searchstatus" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="searchstatus_SelectedIndexChanged">
                    <asp:ListItem>Booked</asp:ListItem>
                    <asp:ListItem>Available</asp:ListItem>
                    <asp:ListItem>Maintenence</asp:ListItem>
                    <asp:ListItem Selected="True">Unavailable</asp:ListItem>
                </asp:DropDownList>
    </div>
            <div class="form-group col-md-2 ">          
                            
                    <br />
              <p></p>
                <asp:ImageButton ID="refresh" runat="server" Height="30px" ImageUrl="~/images/refresh.png" Width="30px" OnClick="refresh_Click" />
                </div>

            </div>
         <div>
             <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                 <Columns>
                     <asp:BoundField DataField="carid" HeaderText="CarID" />
                     <asp:BoundField DataField="name" HeaderText="Name" />
                     <asp:BoundField DataField="fueltype" HeaderText="Fueltype" />
                     <asp:BoundField DataField="seater" HeaderText="Seater" />
                     <asp:BoundField DataField="fare" HeaderText="Fare" />
                     <asp:BoundField DataField="noplate" HeaderText="No." />
                     <asp:BoundField DataField="status" HeaderText="Status" />
                     <asp:CommandField ShowCancelButton="False" ShowSelectButton="True" >
                     <ItemStyle Font-Bold="True" ForeColor="#009900" />
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
