<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="managecar.aspx.cs" Inherits="rentacar.managecar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="container" runat="server">
  <div class="form-row">
    <div>
        <h2> Car Management Form</h2>
        <hr />
        
    </div>
</div>
        <%--work here for centering the form--%>
        <div class=" container align-content-center ">

       
        <div class="form-row">
    <div class="form-group col-md-4 ">
        <asp:Button ID="viewcarslist" CssClass="form-control col-md-12 col-lg-12 col-sm-12 col-4 " runat="server" Text="View All Cars" BackColor="#006666" BorderStyle="None" ForeColor="White" OnClick="viewcarslist_Click" />
      <%--<input type="text" class="form-control" id="carid" >--%>
   </div>
            </div>
     <div class="form-row">
    <div class="form-group col-md-1 ">
      <label for="carid" >CarID</label>
        <asp:TextBox ID="carid" placeholder="Car ID" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
        
      <%--<input type="text" class="form-control" id="carid" >--%>
   </div>
                     

    <div class="form-group col-md-4">
      <label for="carname">Name</label>

      <asp:TextBox ID="carname" placeholder="Ex: Honda Civic" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>

<div class="form-row">
    <div class="form-group col-md-3 ">
      <label for="FileUpload1" >Choose Car Image</label>
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
        <br />
        <asp:Button ID="upload" runat="server" Text="Upload"  class="btn btn-success col-md-3 form-control" OnClick="upload_Click" />
        
   </div>
    <div class="form-group col-md-2">
     <asp:Image ID="carimage" runat="server" class="form-control" Height="200px" ImageUrl="~/images/defaultcar.jpg" Width="260px" />
       
    </div>
</div>

  <div class="form-row">
<div class="form-group col-md-2">
      <label for="inputfuel">Fuel Type</label>
      
       <asp:DropDownList id="inputfuel" class="form-control" runat="server">
              
              <asp:ListItem Selected="True">Petrol</asp:ListItem>
              <asp:ListItem>Diesel</asp:ListItem>
              
            </asp:DropDownList>
    </div>

        <div class="form-group col-md-2 ">
      <label for="inputseat">Seater Capacity</label>
    
          <asp:DropDownList id="inputseat" class="form-control" runat="server">
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem Selected="True">4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
              <asp:ListItem>7</asp:ListItem>
            </asp:DropDownList>
       
    </div>

  <div class="form-group col-md-2" >
    <label for="inputfare">Fare / Day</label>
    <asp:TextBox runat="server" class="form-control" id="inputfare" placeholder="10"></asp:TextBox>
  </div>
    </div>
        <div class="form-row">
 <div class="form-group col-md-3">
      <label for="inputno">Car No.</label>
      
     <asp:TextBox class="form-control" id="inputno" placeholder="Ex : KA 30 A 5676" runat="server"></asp:TextBox>
    </div>
 <div class="form-group col-md-3">
      <label for="inputStatus">Status</label>
      
          <asp:DropDownList id="inputStatus" class="form-control" runat="server">
              <asp:ListItem Selected="True">Choose</asp:ListItem>
              <asp:ListItem>Available</asp:ListItem>
              <asp:ListItem>Booked</asp:ListItem>
              <asp:ListItem>Maintenence</asp:ListItem>
              
          </asp:DropDownList>

            </div>
  </div>
        
        <asp:Button ID="Update" runat="server" class="btn btn-danger" Text="Update" OnClick="Update_Click" />
        <asp:Button ID="Delete" runat="server" class="btn btn-danger" Text="Delete" OnClick="Delete_Click"  />
             </div>
</form>
</asp:Content>
