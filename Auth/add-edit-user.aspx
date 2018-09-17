<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/main.master" AutoEventWireup="true" CodeFile="add-edit-user.aspx.cs" Inherits="Auth_add_edit_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cptitle" Runat="Server">
    User Account
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpmain" Runat="Server">
     <div class="col-lg-12">
                        <h1 class="page-header">
                            Add/Edit User 
                        </h1>
                        <div class="form-group">
                           <label>Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                           <div class="form-group">
                           <label>Phone No.</label>
                            <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                          <div class="form-group">
                           <label>Usertype</label>
                            <asp:TextBox ID="txttype" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <label>Username</label>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <label>Password</label>
                            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" 
                                TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                                <asp:Button ID="btnubmit" runat="server" Text="Submit" CssClass="btn-success" 
                                    onclick="btnubmit_Click" />
                        </div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpfotter" Runat="Server">
</asp:Content>

