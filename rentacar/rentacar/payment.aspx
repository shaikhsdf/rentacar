<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="rentacar.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rent A Car</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div class="form-row">
    <div>
        <h2> List of Confirmed Booking
            
        </h2>
        <hr />
        
    </div>
            </div>
        <div class="form-group row  ">
    <label for="paymentid" class="col-sm-2 col-form-label">Payment ID</label>
    <div class="col-sm-10">
     
        <asp:TextBox class="form-control" id="paymentid" placeholder="Email" runat="server" ReadOnly="true"></asp:TextBox>
    </div>
  </div>
  
         <div class="form-group row">
    <label for="phone" class="col-sm-2 col-form-label">Customer Phone</label>
    <div class="col-sm-10">
     
        <asp:TextBox class="form-control" id="phone" placeholder="1234567891" runat="server" ReadOnly="true"></asp:TextBox>
    </div>
  </div>
         <div class="form-group row">
    <label for="paidamount" class="col-sm-2 col-form-label">Amount</label>
    <div class="col-sm-10">
     
        <asp:TextBox class="form-control" id="paidamount" placeholder="0" runat="server" ReadOnly="true" OnTextChanged="amount_TextChanged"></asp:TextBox>
    </div>
  </div>
         <div class="form-group row">
    <label for="status" class="col-sm-2 col-form-label">Payment Status</label>
    <div class="col-sm-10">
     
        <asp:TextBox class="form-control" id="status" placeholder="Email" runat="server" ReadOnly="true"></asp:TextBox>
    </div>
  </div>
        <div class="form-group row">
    <div class="col-sm-10">
        <asp:Button ID="confirm" runat="server" class="btn btn-danger" Text="Continue" OnClick="confirm_Click"/>
         </div>
  </div>
        <div class="form-group row">
            <asp:Label ID="Label1" runat="server" CssClass="form-control" Text="" Visible="false" style="font-weight: 700"></asp:Label>
    
  </div>
    </form>
</body>
</html>
