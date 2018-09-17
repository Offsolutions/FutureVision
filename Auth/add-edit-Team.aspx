<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/main.master" AutoEventWireup="true" CodeFile="add-edit-Team.aspx.cs" Inherits="Auth_add_edit_Team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphead" Runat="Server">
        <script src="tinymce/tinymce.min.js"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cptitle" Runat="Server">
    Team
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpmain" Runat="Server">
    <div class="col-md-8">
                        <h1 class="page-header">
                            Add/Edit Team 
                        </h1>
                        <div class="form-group">
                           <label>Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                           <div class="form-group">
                           <label>Designation</label>
                            <asp:TextBox ID="txtdes" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="form-group">
                           <label>Team type</label>
                            <asp:DropDownList ID="ddlteam" CssClass="form-control" runat="server">
                                <asp:ListItem>Select Team Type</asp:ListItem>
                                <asp:ListItem>India</asp:ListItem>
                                <asp:ListItem>Canada</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="form-group">
                           <label>Upload Image</label>
                            <asp:FileUpload ID="sliderimage" runat="server" CssClass="form-control" />   
                        </div>
                        <div class="form-group">
                           <label>Facebook Url</label>
                            <asp:TextBox ID="txtfb" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <label>Twitter Url</label>
                            <asp:TextBox ID="txttwitter" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <label>G+ Url</label>
                            <asp:TextBox ID="txtgplus" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn-success" 
                                    onclick="btnsubmit_Click" />
                        </div>
</div>
    <div class="col-md-4">
            <img alt="" src="../uploadimage/<%=img %>" width="80px"/>
        </div> 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpfotter" Runat="Server">
</asp:Content>

