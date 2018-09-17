<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cptitle" Runat="Server">
    <h1>Courses</h1>
	<span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" Runat="Server">
        <asp:ListView ID="lvcourse" runat="server">
        <ItemTemplate>

					
							
           
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <div style="    height: 200px;
    overflow: hidden;">
                        <img src='uploadimage/<%#Eval("Image") %>' alt="" class="img-responsive">
                            </div>
                        <div class="caption">
                            <h4 style="    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;"><%#Eval("Name") %></h4>
                         
                            <p><a href="Full-Detail.aspx?id=<%#Eval("Id") %>" class="btn btn-primary" role="button">Readmore</a> </p>
                        </div>
                    </div>
                </div>
            
								
					
							
					
				

            
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

