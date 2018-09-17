<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Full-Detail.aspx.cs" Inherits="Full_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cptitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" Runat="Server">
    <section class="single-course">
					<div class="container">
						<div class="row">
							<div class="col-md-8">
								<div class="single-item">		
									<div class="row">		
										<div class="col-md-12">
											<div class="item course-item">
												<div class="up-content">
													<a href="single-course.html"><h4><%=title %></h4></a>
													
													
												</div>
												<div class="courses-slider">
													<ul class="slides">
													    <li >
													      <img src='../uploadimage/<%=image %>' alt="" />
													    </li>
													    
													</ul>
												</div>
											</div>
											<div class="description">
												<h4>Description</h4>
												<p><%=disc %></p>
											</div>
											
											
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								
								<div class="related-courses">
									<div class="widget-heading">
										<h4>More Courses</h4>
									</div>
									<ul>
        <asp:ListView ID="lvrelate" runat="server">
            <ItemTemplate>
                <li>
                    <a href="Full-Detail.aspx?id=<%#Eval("Id") %>">
                        <img src='../uploadimage/<%#Eval("Image") %>' alt="" class="img-responsive" width="70"></a>
                    <span><%#Eval("Type") %></span>
                    <a href="#">
                        <h6><%#Eval("Name") %></h6>
                    </a>
                    
                </li>
            </ItemTemplate>
        </asp:ListView>
										
										
									</ul>
								</div>
								<div class="categories">
									<div class="widget-heading">
										<h4>Categories</h4>
									</div>
									<ul>
                                    <asp:ListView ID="lvcat" runat="server">
                                        <ItemTemplate>
                                            <li><a href="Courses.aspx?id=<%#Eval("Type") %>"><i class="fa fa-angle-right"></i><%#Eval("Type") %></a></li>
                                        </ItemTemplate>
                                    </asp:ListView>
										
									</ul>
								</div>
							</div>
						</div>
					</div>
				</section>
</asp:Content>

