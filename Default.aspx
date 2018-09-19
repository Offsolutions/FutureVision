<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="en-US">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <title>Future Vision | Knoweledge that can change the world</title>


    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700' rel='stylesheet' type='text/css'>



    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.css">
    <link rel="stylesheet" href="assets/css/simple-line-icons.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/icon-font.css">
    <link rel="stylesheet" href="assets/css/educa.css">

    <link rel="stylesheet" href="assets/rs-plugin/css/settings.css">
    <link href="assets/css/responsiveslides.css" rel="stylesheet" />
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
    <link href="assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="assets/css/main.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">

        <div class="sidebar-menu-container" id="sidebar-menu-container">

            <div class="sidebar-menu-push">

                <div class="sidebar-menu-overlay"></div>

                <div class="sidebar-menu-inner">

                    <header class="site-header">

                        <div class="navbar navbar-default" role="navigation">
                            <div class="container">
                                <div class="col-md-3">
                                    <div class="navbar-header" style="height: 121px;">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>

                                        <a href="Default.aspx" class="navbar-brand">
                                            <img src="assets/images/logo.png" alt="" width="210"></a>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="header-info hidden-sm hidden-xs">
                                        <ul>
                                            <li><i class="fa fa-whatsapp"></i><%=whatsapp %></li>
                                            <li><i class="fa fa-phone"></i><%=phn %></li>
                                            <li><i class="fa fa-envelope-o"></i><%=email %></li>

                                        </ul>
                                    </div>
                                    <div class="navbar-collapse navbar-right collapse" aria-expanded="false" style="height: 1px;">

                                        <ul class="nav navbar-nav navbar-right">

                                            <li class="active"><a href="Default.aspx">Home</a></li>
                                            <li><a href="About-Us.aspx">About Us</a></li>
                                            <li>
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Courses<b class="caret"></b></a>
                                                <ul class="dropdown-menu multi-level">
                                                    <asp:ListView ID="lvc" runat="server" OnItemDataBound="lvc_ItemDataBound">
                                                        <ItemTemplate>
                                                            <li class="dropdown-submenu">

                                                                <asp:LinkButton ID="lnkmain" runat="server" class="dropdown-toggle" data-toggle="dropdown" Text='<%#Eval("Cat_name") %>'><%#Eval("Type") %></asp:LinkButton>
                                                                <ul class="dropdown-menu" style="min-width: 320px">
                                                                    <asp:ListView ID="lvsub" runat="server">
                                                                        <ItemTemplate>
                                                                            <li>

                                                                                <a href='Full-Detail.aspx?id=<%#Eval("Id") %>'><%#Eval("Name") %></a>
                                                                            </li>
                                                                        </ItemTemplate>
                                                                    </asp:ListView>

                                                                </ul>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </ul>
                                            </li>
                                            <li><a href="verification.aspx">Student Verification</a></li>
                                            <li><a href="Contact.aspx">Contact Us</a></li>
                                        </ul>

                                    </div>
                                    <!--/.nav-collapse -->
                                </div>
                            </div>
                        </div>

                    </header>

                    <div class="container-fluid" style="background: #415ba6">
                        <div class=" container">
                            <div class="col-sm-1">
                                <h3 style="color: white">NEWS</h3>
                            </div>
                            <div class="col-sm-11">
                                <div class="TickerNews" id="example">
                                    <div class="ti_wrapper">
                                        <div class="ti_slide">
                                            <div class="ti_content">

                                                <asp:ListView ID="lvnews" runat="server">
                                                    <ItemTemplate>
                                                        <div class="ti_news" style="overflow: hidden;">
                                                            <a href="#">
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Description") %>'></asp:Label></a>  |
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:ListView>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="rslides">
                        <asp:ListView ID="lvslider" runat="server">
                            <ItemTemplate>
                                <li>
                                    <img src="uploadimage/<%#Eval("Image") %>" alt=""></li>

                            </ItemTemplate>
                        </asp:ListView>


                    </ul>


                    <section class="popular-courses">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="section-heading text-center">
                                    <h1>Our Courses</h1>
                                    <img src="assets/images/line-dec.png" alt="">
                                </div>
                            </div>
                            <div class="row">
                                <div id="owl-courses-second">

                                    <asp:ListView ID="lvcourse" runat="server">
                                        <ItemTemplate>
                                            <div class="item course-item">
                                                <a href="#">
                                                    <div style="height: 150px; overflow: hidden">
                                                        <img src='uploadimage/<%#Eval("Image") %>' alt="">
                                                    </div>
                                                </a>
                                                <div class="down-content">
                                                    <h6>Duration</h6>
                                                    <div class="price-red">
                                                        <span><%#Eval("Duration") %></span>
                                                        <div class="base"></div>
                                                    </div>
                                                    <a href="#">
                                                        <h4><%#Eval("Name") %></h4>
                                                    </a>
                                                    <%--<p><%#Eval("Description") %></p>--%>
                                                    <div class="text-button">
                                                        <a href="Full-Detail.aspx?id=<%#Eval("Id") %>">view more<i class="fa fa-arrow-right"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>


                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="welcome-intro">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="section-heading text-center">
                                            <h1>Welcome to Future Vision</h1>
                                            <span>Knowledge that will change the world</span>
                                            <img src="assets/images/line-dec.png" alt="">
                                            <p><%=home %></p>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4">
                                                <div class="service-item">
                                                    <i class="fa fa-graduation-cap"></i>
                                                    <h4>Experienced Staff</h4>
                                                    <div class="line-dec"></div>

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4">
                                                <div class="service-item">
                                                    <i class="fa fa-globe"></i>
                                                    <h4>Seprate Classes For Girls</h4>
                                                    <div class="line-dec"></div>

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4">
                                                <div class="service-item">
                                                    <i class="fa fa-video-camera" aria-hidden="true"></i>
                                                    <h4>CCTV</h4>
                                                    <div class="line-dec"></div>

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4">
                                                <div class="service-item last-service">
                                                    <i class="fa fa-bus" aria-hidden="true"></i>
                                                    <h4>Near Bus stand</h4>
                                                    <div class="line-dec"></div>

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4">
                                                <div class="service-item">
                                                    <i class="fa fa-wifi" aria-hidden="true"></i>
                                                    <h4>WIfi</h4>
                                                    <div class="line-dec"></div>

                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-4">
                                                <div class="service-item last-service">
                                                    <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                    <h4>Educational Tour</h4>
                                                    <div class="line-dec"></div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4" style="display: none">
                                        <div class="request-information">
                                            <div class="widget-heading">
                                                <h4>Student Verification</h4>
                                            </div>
                                            <div class="search-form">
                                                <input type="text" id="txtname" name="s" placeholder="Full Name" value="" runat="server">
                                                <input type="text" id="txtroll" name="s" placeholder="RollNo" value="" runat="server">
                                                <%-- <div class="select">
			                                    <select name="mark" id="campus">
			                                        <option value="-1">Campus of Interests</option>
			                                          <option>Nearby</option>
			                                          <option>High Classes</option>
			                                          <option>Short Time</option>
			                                          <option>Long Time</option>
			                                    </select>
			                                </div>
			                                <div class="select">
			                                    <select name="mark" id="program">
			                                        <option value="-1">Program of Interests</option>
			                                          <option>Wroking Process</option>
			                                          <option>Archivements</option>
			                                          <option>Social</option>
			                                          <option>Profits</option>
			                                    </select>
			                                </div>--%>
                                                <div class="accent-button">

                                                    <asp:LinkButton ID="lnkrequest" OnClick="lnkrequest_Click" runat="server">Submit Request</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="testimonials-news" style="background: #f5a425;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="section-heading">
                                        <h1>What Our Students Say</h1>
                                        <img src="assets/images/line-dec.png" alt="">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="owl-testimonials" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                                                <div class="owl-wrapper-outer">
                                                    <div class="owl-wrapper" style="width: 2220px; left: 0px; display: block; transition: all 800ms ease; transform: translate3d(-555px, 0px, 0px);">
                                                        <asp:ListView ID="lvtest" runat="server">
                                                            <ItemTemplate>
                                                                <div class="owl-item" style="width: 555px;">
                                                                    <div class="item">

                                                                        <%#Eval("Description") %>
                                                                        <img src='uploadimage/<%#Eval("Image") %>' alt="">
                                                                        <h4><%#Eval("Name") %></h4>

                                                                    </div>

                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:ListView>



                                                    </div>
                                                </div>

                                                <div class="owl-controls clickable">
                                                    <div class="owl-buttons">
                                                        <div class="owl-prev"></div>
                                                        <div class="owl-next"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="section-heading university-news">
                                        <h1>Our Shining Stars</h1>
                                        <img src="assets/images/line-dec.png" alt="">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <section class="our-teachers" style="padding: 0px">
                                                <div class="container">

                                                    <div class="row">
                                                        <marquee direction="left">
                                <asp:ListView ID="lvac" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-2 col-sm-6">
								<div class="teacher-item">
									<div class="thumb-holder">
										<a href="#"><img src="uploadimage/<%#Eval("Image") %>" alt=""></a>
										
									</div>
									<div class="down-content">
										<a href="#"><h4><%#Eval("Name") %></h4></a>
										<span><%#Eval("Band") %></span>
										
									</div>
								</div>
							</div>
                                    </ItemTemplate>
                                </asp:ListView>
							
                                </marquee>
                                                    </div>
                                                </div>
                                            </section>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>




                    <div class="container-fluid" style="padding: 50px 0px">
                        <div class="container">
                            <div id="owl-example" class="owl-carousel">
                                <asp:ListView ID="Listlogo" runat="server">
                                    <ItemTemplate>
                                        <div>
                                            <img src="uploadimage/<%#Eval("Image") %>" />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>


                            </div>
                        </div>
                    </div>





                    <footer>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="footer-widget">
                                        <div class="educa-info">
                                            <%--<img src="assets/images/logo-2.png" alt="">--%>
                                            <h2>Future Vision</h2>
                                            <div class="line-dec"></div>
                                            <p><%=about %></p>
                                            <div class="text-button">
                                                <a href="About-Us.aspx">Read More <i class="fa fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="footer-widget">
                                        <div class="featured-links">
                                            <h2>Featured Links</h2>
                                            <div class="line-dec"></div>
                                            <div class="fb-page" data-href="https://www.facebook.com/futurevisionmoga016/?fref=ts" data-width="250" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true">
                                                <blockquote cite="https://www.facebook.com/futurevisionmoga016/?fref=ts" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/futurevisionmoga016/?fref=ts">Official Solutions</a></blockquote>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="footer-widget">
                                        <div class="university-address">
                                            <h2>Find Us</h2>
                                            <div class="line-dec"></div>
                                            <ul>
                                                <li><i class="fa fa-home"></i><%=add %></li>
                                                <li><i class="fa fa-phone"></i><%=phn %></li>
                                                <li><i class="fa fa-envelope-o"></i><%=email %></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="footer-widget">
                                        <div class="newsletters">
                                            <h2>Get In Touch</h2>
                                            <div class="line-dec"></div>
                                            <input type="text" class="email" name="s" placeholder="Name" value="">
                                            <input type="text" class="email" name="s" placeholder="Phome" value="">
                                            <input type="text" class="email" name="s" placeholder="Email" value="">
                                            <input type="text" class="email" name="s" placeholder="Query" value="">
                                            <div class="accent-button">
                                                <a href="#">SUBMIT</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="copyright-menu">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="copyright-text">
                                                    <p>@ Copyright 2015 Future Vision. All Rights Reserved | Created By : <a href="http://www.officialsolutions.in">Official Solutions</a></p>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="menu">
                                                    <ul>
                                                        <li><a href="Default.aspx">Home</a></li>
                                                        <li><a href="About-Us.aspx">About US</a></li>
                                                        <li><a href="#">Course List</a></li>
                                                        <li><a href="Contact.aspx">Contact</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </footer>


                    <a href="#" class="go-top"><i class="fa fa-angle-up"></i></a>

                </div>

            </div>

            <%--<nav class="sidebar-menu slide-from-left">
			<div class="nano">
				<div class="content">
					<nav class="responsive-menu">
						<ul>
							<li class="menu-item-has-children"><a href="#">Home</a>
								<ul class="sub-menu">
									<li><a href="index-2.html">Homepage 1</a></li>
									<li><a href="homepage-2.html">Homepage 2</a></li>
								</ul>
							</li>
							<li class="menu-item-has-children"><a href="#">Courses</a>
								<ul class="sub-menu">
									<li><a href="courses-grid.html">Courses Grids</a></li>
									<li><a href="courses-list.html">Courses List</a></li>
									<li><a href="#">Single Course</a></li>
								</ul>
							</li>
							<li class="menu-item-has-children"><a href="#">Events</a>
								<ul class="sub-menu">
									<li><a href="classic-events.html">Classic Events</a></li>
									<li><a href="calendar-events.html">Calendar Events</a></li>
									<li><a href="single-event.html">Single Event</a></li>
								</ul>
							</li>
							<li class="menu-item-has-children"><a href="#">Pages</a>
								<ul class="sub-menu">
									<li><a href="about.html">About Us</a></li>
									<li><a href="our-teachers.html">Our Teachers</a></li>
									<li><a href="single-teacher.html">Single Teacher</a></li>
									<li><a href="gallery-4.html">Gallery 4 Columns</a></li>
									<li><a href="gallery-3.html">Gallery 3 Columns</a></li>
								</ul>
							</li>
							<li class="menu-item-has-children"><a href="#">News</a>
								<ul class="sub-menu">
									<li><a href="classic-news.html">Classic News</a></li>
									<li><a href="grid-news.html">Grid News</a></li>
									<li><a href="single-post.html">Single Post</a></li>
								</ul>
							</li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</nav>--%>
        </div>



    </form>
    <script type="text/javascript" src="assets/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
    <script src="assets/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script src="assets/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <script type="text/javascript" src="assets/js/plugins.js"></script>
    <script type="text/javascript" src="assets/js/custom.js"></script>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=755281824540788";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <script src="assets/js/jquery-1.11.2.min.js"></script>
    <script src="assets/css/jquery.tickerNews.min.js"></script>
    <script type="text/javascript">
        $(function () {
            _Ticker = $(".TickerNews").newsTicker();
        });
    </script>

    <script src="assets/js/owl.carousel.js"></script>
    <script>
        $(document).ready(function () {

            $("#owl-example").owlCarousel({

                autoplay: true,
                items: 5,

            });

        });
    </script>
    <script src="assets/css/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $(".rslides").responsiveSlides();
        });
    </script>
</body>


</html>
