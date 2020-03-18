<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="createcar.aspx.cs" Inherits="rentacar.createcar" %>
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
     <div class="form-row">
    <div class="form-group col-md-1 ">
      <label for="carid" >CarID</label>
        <asp:TextBox ID="carid" placeholder="Car ID" runat="server" class="form-control"></asp:TextBox>
      <%--<input type="text" class="form-control" id="carid" >--%>
   </div>
    <div class="form-group col-md-5">
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
         <asp:Button ID="new" runat="server" class="btn btn-danger" Text="New" OnClick="new_Click" />
        <asp:Button ID="Save" runat="server" class="btn btn-danger" Text="Save" OnClick="Save_Click" />
          <asp:Button ID="find" runat="server" class="btn btn-danger" Text="Find" OnClick="find_Click" />
       
</form>
</asp:Content>
