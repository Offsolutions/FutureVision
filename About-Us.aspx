<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="About-Us.aspx.cs" Inherits="About_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cptitle" Runat="Server">
    <h1>About Us</h1>
	<span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" Runat="Server">
    <div class="col-md-5">
        <div class="left-images">
            <div class="row">
                <div class="col-md-12">
                    <a href="#">
                        <img src='uploadimage/<%=img %>' alt=""></a>
                    <a href="#"><i class="fa fa-pencil"></i></a>
                </div>

            </div>
        </div>
    </div>
    <div class="col-md-7">
        <div class="welcome-to-educa">
            <div class="section-heading">
                <h1>About Us Future Vision</h1>
                <img src="assets/images/line-dec.png" alt="">
              
            </div>
            <div class="row">
                <%=data %>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <section class="our-skills">
					<div class="container">
						
						<div class="row">
							<div class="col-md-6">
								<div class="skill-item first-item">
									<h6>Computer Basic</h6>
									<span>80%</span>
									<div class="bg-bar"></div>
									<div class="fill-bar"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="skill-item second-item">
									<h6>Ielts</h6>
									<span>70%</span>
									<div class="bg-bar"></div>
									<div class="fill-bar"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="skill-item third-item">
									<h6>Web Designing</h6>
									<span>85%</span>
									<div class="bg-bar"></div>
									<div class="fill-bar"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="skill-item fourth-item">
									<h6>Typing</h6>
									<span>75%</span>
									<div class="bg-bar"></div>
									<div class="fill-bar"></div>
								</div>
							</div>
						</div>
					</div>
				</section>
    </div>
</asp:Content>

