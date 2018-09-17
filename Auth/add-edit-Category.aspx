<%@ Page Title="" Language="C#" MasterPageFile="~/Auth/main.master" AutoEventWireup="true" CodeFile="add-edit-Category.aspx.cs" Inherits="Auth_add_edit_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphead" Runat="Server">
     <script src="tinymce/tinymce.min.js"></script>
    <script>tinymce.init({
    selector: 'textarea',
    height: 500,
    theme: 'modern',
    plugins: [
      'advlist autolink lists link image charmap print preview hr anchor pagebreak',
      'searchreplace wordcount visualblocks visualchars code fullscreen',
      'insertdatetime media nonbreaking save table contextmenu directionality',
      'emoticons template paste textcolor colorpicker textpattern imagetools codesample'
    ],
    toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
    toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
    image_advtab: true,
    templates: [
      { title: 'Test template 1', content: 'Test 1' },
      { title: 'Test template 2', content: 'Test 2' }
    ],
    content_css: [
      '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
      '//www.tinymce.com/css/codepen.min.css'
    ]
});</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cptitle" Runat="Server">
Category
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpmain" Runat="Server">
<div class="col-md-8">
                 <div class="form-group">
               <label>Name</label>
               <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
          </div>
    <div class="form-group" style="display:none">
        <label>Discription</label>
        <asp:TextBox ID="txtdisc" runat="server" class="form-control" TextMode="MultiLine" placeholder="Enter Name"></asp:TextBox>
    </div>
    <div class="form-group" >
        <label>Priority</label>
        <asp:TextBox ID="txtpre" runat="server" class="form-control"  placeholder="Priority"></asp:TextBox>
    </div>
    <div class="form-group" style="display:none">
        <label>Image</label>
       <asp:FileUpload ID="sliderimage" runat="server" CssClass="form-control" />   
    </div>
          <div class="form-group">
                   <asp:Button CssClass="btn-success" ID="btnsubmit" runat="server" 
                       Text="Submit" onclick="btnsubmit_Click" />
        </div>   

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpfotter" Runat="Server">
</asp:Content>

