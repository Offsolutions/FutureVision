<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cptitle" Runat="Server">
   <h1>Contact Us</h1>
	<span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" Runat="Server">
    <section class="contact-info">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="contact-content">
									<div class="contact-item">
										<i class="fa fa-map-marker"></i>
										<h4>Address Info</h4>
										<p><%=add %></p>
									</div>
									<div class="contact-item">
										<i class="fa fa-envelope-o"></i>
										<h4>Email Info</h4>
										<p><%=email %></p>
									</div>
									<div class="contact-item last-contact">
										<i class="fa fa-phone"></i>
										<h4>Phone Number</h4>
										<p><%=phn %></p>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</section>
    <section class="contact-form">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="location-contact">
									<div class="widget-heading">
										<h4>Location Map</h4>
									</div>
									<div class="content-map">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3426.308421068784!2d75.17190231473991!3d30.82202298160619!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391a088c4d187b9d%3A0x6de939b24c270875!2sFuture+Vision!5e0!3m2!1sen!2sin!4v1537202686940" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>								</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="message-form">
									<div class="widget-heading">
										<h4>Contact Us</h4>
									</div>
									<div class="message-content">
										<div class="row">
											<div class="col-md-6">
												<input type="text" id="txtname" name="s" placeholder="Full Name" value="" runat="server">
											</div>
											<div class="col-md-6">
												<input type="text" id="txtemail" name="s" placeholder="E-mail Address" value="" runat="server">
											</div>
											<div class="col-md-12">
												<textarea id="txtmsz" class="message" name="message" placeholder="Write message" runat="server"></textarea>
											</div>
										</div>
										<div class="accent-button">
										
                                            <asp:LinkButton ID="lnksubmit" OnClick="lnksubmit_Click" runat="server">Submit Message</asp:LinkButton>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
</asp:Content>

