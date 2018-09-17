<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/main.master" AutoEventWireup="true" CodeFile="add-edit-achiever.aspx.cs" Inherits="Auth1_add_edit_achiever" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cptitle" Runat="Server">]
Add/Edit Achiever
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpmain" Runat="Server">
<div class="col-md-8">
        <div class="form-group">
            <label>Student Name</label>
            <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>           
        </div> 
         <div class="form-group">
            <label>Band</label>
            <asp:TextBox ID="txtband" CssClass="form-control" runat="server"></asp:TextBox>    
              
        </div> 
        <div class="form-group">
            <label>Upload Image</label>
            <asp:FileUpload ID="stuimg" runat="server" />
        </div>
       <div class="form-group">
       <asp:Button ID="btnadd" runat="server" CssClass="bordered-link" Text="Submit" onclick="btnadd_Click" ValidationGroup="g1" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ValidationGroup="g1" />
</div>

 </div>
    <div class="col-md-4">

          <img alt="" src="../uploadimage/<%=img %>" width="80px"/>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpfotter" Runat="Server">
</asp:Content>

