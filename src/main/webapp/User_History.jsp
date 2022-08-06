<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sample.notification.NotificationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.history.HistoryDTO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="sample.users.UserDTO"%>
<!DOCTYPE html>
<html lang="zxx">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <head>
        <title>F.E.M</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="UserCSS/kagont/assets/images/x-icon/Biểu-tượng-không-chữ1.png">

        <link rel="stylesheet" href="UserCSS/kagont/assets/css/animate.css">
        <link rel="stylesheet" href="UserCSS/kagont/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="UserCSS/kagont/assets/css/all.min.css">
        <link rel="stylesheet" href="UserCSS/kagont/assets/css/icofont.min.css">
        <link rel="stylesheet" href="UserCSS/kagont/assets/css/lightcase.css">
        <link rel="stylesheet" href="UserCSS/kagont/assets/css/swiper.min.css">
        <link rel="stylesheet" href="UserCSS/kagont/assets/css/style.css">
        <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css' />
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
        <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.0-beta.1/angular.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.0-beta.1/angular-animate.js'></script>
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'></script>
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src="UserCSS/kagont/assets/css/script.js"></script>
        <style>
            <% ArrayList<HistoryDTO> dto = new ArrayList<>();
                dto = (ArrayList<HistoryDTO>) request.getAttribute("HISTORY");%>
            <%for (HistoryDTO history : dto) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String takePlaceDate = history.getTakePlaceDate();
                    long millis = System.currentTimeMillis();
                    Date today = new Date(millis);
                    if (takePlaceDate.equals(today.toString()) == true || sdf.parse(takePlaceDate).before(today) == false) {%>
            #<%=history.getEvtID()%> {
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            #<%=history.getEvtID()%>:hover {
                opacity: 0.7;
            }

            /* định dạng phần nền của modal */
            .<%=history.getEvtID() + "modal"%> {
                display: none;
                z-index: 1050;
                position: fixed;

                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0.9);
            }

            /* Phần nội hình ảnh của modal */
            .<%=history.getEvtID() + "modal1-content"%> {
                margin: auto;
                display: block;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                height: 300px;
            }

            /* phần caption của modal image */
            #<%=history.getEvtID() + "caption"%> {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            /* Hiệu ứng chuyển động*/
            .<%=history.getEvtID() + "modal1-content"%>,
            #<%=history.getEvtID() + "caption"%> {
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            /* Button đóng Modal */
            .<%=history.getEvtID() + "close1"%> {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .<%=history.getEvtID() + "close"%>:hover,
            .<%=history.getEvtID() + "close1"%>:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
            <%}
                }%>
            #feedback-form-wrapper #floating-icon>button {
                position: inherit;
                top: 50%;
                transform-origin: right;
                font-size: 10px;
                padding-right: 5px;
                padding-left: 5px;
                text-align: center;
                border-radius: 10px;
                /* background-color: #df01ae; */
            }

            #feedback-form-wrapper .rating-input-wrapper input[type="radio"] {
                display: none;
                color: #000;
            }

            #feedback-form-wrapper .rating-input-wrapper input[type="radio"]~span {
                cursor: pointer;
                color: #000;
            }

            #feedback-form-wrapper .rating-input-wrapper input[type="radio"]:checked~span {
                background-color: #4261dc;
                color: #fff;
            }

            #feedback-form-wrapper .rating-labels>label {
                font-size: 14px;
                color: #777;
            }
            .cak {
                width: 100%;
            }
            .nut_dropdown {
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
            }
            /* Thiết lập vị trí cho thẻ div với class dropdown*/
            .dropdown {
                position: relative;
                display: inline-block;
            }
            /* Nội dung Dropdown */
            .noidung_dropdown {
                /*Ẩn nội dụng các đường dẫn*/
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 400px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                height: 400px;
                overflow: auto;
            }
            /* Thiết kế style cho các đường dẫn tronng Dropdown */
            .noidung_dropdown a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .hienThi{
                display:block;
            }
        </style>
    </head>

    <body>

        <!-- preloader start here -->
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- preloader ending here -->


        <!-- ==========Header Section Starts Here========== -->
        <header class="header-section">
            <div class="header-bottom">
                <div class="container">
                    <div class="header-wrapper">
                        <div class="logo">
                            <a href="MainController?action=homepage">
                                <img src="UserCSS/kagont/assets/images/resize-logo/TEXT-(153x50)1.png" alt="logo">
                            </a>
                        </div>
                        <%
                            UserDTO user = (UserDTO) request.getSession().getAttribute("LOGIN_USER");
                        %>
                        <div class="menu-area">
                            <ul class="menu">
                                <li>
                                    <a href="MainController?action=homepage&userID=<%=user.getId()%>"><i class="fa fa-home"></i>Home</a>
                                </li>

                                <li>
                                    <a href="MainController?action=clubList&userID=<%=user.getId()%>"><i class="fa fa-cube"></i> Club</a>
                                </li>
                                <li>
                                    <a href="MainController?action=viewEventList&userID=<%=user.getId()%>"><i class="fa fa-calendar-check"></i>Event</a>
                                </li>

                                <li>
                                    <a href="MainController?action=ViewBlogList&userID=<%=user.getId()%>"><i class="fa fa-newspaper"></i>Blog</a>
                                </li>
                                <li><a><i class="icofont-ui-message"></i>Contact</a>
                                    <ul class="submenu">
                                        <li><a href="https://hcmuni.fpt.edu.vn/" target="_blank"><i class="icofont-user">&emsp;</i>FPT Univesity</a></li>
                                        <li><a href="https://www.facebook.com/FPTU.HCM" target="_blank"><i class="icofont-user">&emsp;</i>Facebook FPT Univesity</a></li>
                                    </ul> 
                                </li>

                            </ul>
                            <!-- partial:index.partial.html -->
                            <ul class="menu">
                                <li>
                                    <a href="#0"><i class="icofont-user"></i><%= user.getName()%></a>
                                    <ul class="submenu">
                                        <li><a href="MainController?action=profilepage">Profile<i class="icofont-pixels"></i></a></li>
                                        <li><a href="MainController?action=viewhistory">History<i class="icofont-history"></i></a></li>
                                        <li><a href="MainController?action=logout&page=US" onclick="return confirm('Do you want to log out ?')" >Logout<i class="icofont-delivery-time"></i></a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <%ArrayList<NotificationDTO> list = new ArrayList<>();
                                        list = (ArrayList<NotificationDTO>) request.getAttribute("GET_NOTIFICATION"); %>
                                    <div class="dropdown">
                                        <a  onclick="hamDropdown()"  class="nut_dropdown fa fa-bell"></a>
                                        <div class="noidung_dropdown">                                               
                                            <div class="cont">
                                                <%for (NotificationDTO n : list) {%>
                                                <div class="sec new">
                                                    <a href="MainController?action=viewEventDetail&EVENT_ID=<%=n.eventID%>&username=<%=user.getId()%>">
                                                        <div class="profCont">
                                                            <img class="profile" src="<%=n.orgImg%>">
                                                        </div>
                                                        <div class="txt textnotification"><%=n.evtContent%>: "<%=n.notiContent%>"</div>
                                                        <div class="txt sub textnotification"><%=n.notiDate%></div>
                                                    </a>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <!-- toggle icons -->
                            <div class="header-bar d-lg-none">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </header>
        <!-- ==========Header Section Ends Here========== -->

        <!-- Page Header Section Start Here -->
        <section class="page-header padding-tb">
            <div class="overlay"></div>
            <div class="container">
                <div class="page-header-content-area">
                    <h4 class="ph-title">History User</h4>
                    <ul class="lab-ul">
                        <li><a href="MainController?action=homepage">Home</a></li>
                        <li><a class="active">History</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- Page Header Section Ending Here -->



        <!-- Shop Cart Page Section start here -->
        <div class="shop-cart padding-tb">
            <div class="container">
                <div class="section-wrapper">
                    <div class="cart-top">
                        <span style="color:green"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></span>
                        <table>

                            <thead>
                                <tr>
                                    <th>Feed Back Event</th>
                                    <th>Place</th>
                                    <th>Take Place Date</th>
                                    <th>QR Code</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (HistoryDTO history : dto) {%>
                                <tr>   
                                    <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        String takePlaceDate = history.getTakePlaceDate();
                                        long millis = System.currentTimeMillis();
                                        Date today = new Date(millis);%>
                                    <td class="product-item">
                                        <% if (sdf.parse(takePlaceDate).before(today) == true && takePlaceDate.equals(today.toString()) == false) {%>
                                        <div class="p-thumb rounded">
                                            <%if (history.getImgPost().contains("Image")){%>
                                            <a type="button" data-toggle="modal" data-target="#<%=history.getEvtID()%>"><img src="http://localhost:8080/event-management/<%=history.getImgPost()%>" alt="product"></a>
                                            <%} else{%>
                                            <a type="button" data-toggle="modal" data-target="#<%=history.getEvtID()%>"><img src="<%=history.getImgPost()%>" alt="product"></a>
                                            <%}%>
                                        </div>
                                        <div class="p-content">
                                            <a type="button" data-toggle="modal" data-target="#<%=history.getEvtID()%>">
                                                <%=history.getTitle()%>
                                            </a>
                                        </div>
                                        <%} else if (takePlaceDate.equals(today.toString()) == true || sdf.parse(takePlaceDate).before(today) == false) {%>
                                        <div class="p-thumb rounded">
                                            <a type="button" href="MainController?action=viewEventDetail&EVENT_ID=<%=history.getEvtID()%>&username=<%=user.getId()%>"><img src="<%=history.getImgPost()%>" alt="product"></a>
                                        </div>
                                        <div class="p-content">
                                            <a type="button" href="MainController?action=viewEventDetail&EVENT_ID=<%=history.getEvtID()%>&username=<%=user.getId()%>">
                                                <%=history.getTitle()%>
                                            </a>
                                        </div>
                                        <%}%>
                                    </td>
                                    <td><%=history.getLocationName()%></td>
                                    <td><%=history.getTakePlaceDate()%><br> 
                                        <%=history.getSlotTime()%> 
                                    </td>
                                    </td>
                                    <td>
                                        <% if (sdf.parse(takePlaceDate).before(today) == true) {%>
                                        The event took place
                                        <%} else if (takePlaceDate.equals(today.toString()) == true || sdf.parse(takePlaceDate).before(today) == false) {%>
                                        <img id="<%=history.getEvtID()%>" src="<%=history.getQrCode()%>" alt="Trolltunga, Norway"
                                             width="50px" height="50px">
                                        <!-- The Modal -->
                                        <div id="<%=history.getEvtID() + "myModal"%>" class="<%=history.getEvtID() + "modal"%>">
                                            <span class="<%=history.getEvtID() + "close1"%>">&times;</span>
                                            <img class="<%=history.getEvtID() + "modal1-content"%>" id="<%=history.getEvtID() + "index"%>">
                                        </div>
                                        <%}%>
                                    </td>
                                    <td>
                                        <a type="button" data-toggle="modal" data-target="#exampleModalCenterUnparticipate"><img src="UserCSS/kagont/assets/images/del.png" alt="product"></a>
                                        <form action="MainController" method="POST">
                                            <div class="modal fade" id="exampleModalCenterUnparticipate" tabindex="-1" role="dialog"
                                                 aria-labelledby="exampleModalCenterUnparticipateTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" style="color: rgb(255, 255, 255);"
                                                                id="exampleModalLongTitle">Confirm</h5>


                                                        </div>
                                                        <div class="modal-body" style="color: black;">
                                                            DO YOU WANT CANCEL THE EVENT ?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary" name="action" value="UserParticipants">
                                                                <input type="hidden" name="UNPARTICIPANTS" value="UserUnparticipants">
                                                                <input type="hidden" name="HISTORYLIST" value="ViewHistory">
                                                                <input type="hidden" name="username" value="<%=user.getId()%>">
                                                                <input type="hidden" name="eventID" value="<%=history.getEvtID()%>">
                                                                Yes</button>
                                                            <button type="button" class="btn btn-secondary"
                                                                    style="background-color: rgb(207, 6, 6);"
                                                                    data-dismiss="modal">No</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="feedback-form-modal">
                                                <div class="modal fade" id="<%=history.getEvtID()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">FEEDBACK FORM</h5>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label style="color: #000;" for="input-two">Your Feedback</label>
                                                                    <textarea name="content" placeholder="Type Here Message" class="form-control cak" id="input-two" rows="3"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button name="action" value="feedback" type="submit" class="btn btn-primary">Send
                                                                    <input type="hidden" name="userID" value="<%=user.getId()%>"> 
                                                                    <input type="hidden" name="eventID" value="<%=history.getEvtID()%>">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </td>                           
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



        <!-- Footer Section start here -->
        <footer class="footer-section" style="background-image: url(UserCSS/kagont/assets/images/bg-images/footer-bg.png);">
            <div class="footer-top">
                <div class="container">
                    <div class="row g-3 justify-content-center g-lg-0">
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="footer-top-item lab-item">
                                <div class="lab-inner">
                                    <div class="lab-thumb">
                                        <img src="UserCSS/kagont/assets/images/footer/footer-top/01.png" alt="Phone-icon">
                                    </div>
                                    <div class="lab-content">
                                        <a href="#">Phone Number : +84 528 68 71 48</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="footer-top-item lab-item">
                                <div class="lab-inner">
                                    <div class="lab-thumb">
                                        <img src="UserCSS/kagont/assets/images/footer/footer-top/02.png" alt="email-icon">
                                    </div>
                                    <div class="lab-content">
                                        <a href="emailto: daihoc.hcm@fpt.edu.vn">Email :
                                            daihoc.hcm@fpt.edu.vn</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="footer-top-item lab-item">
                                <div class="lab-inner">
                                    <div class="lab-thumb">
                                        <img src="UserCSS/kagont/assets/images/footer/footer-top/03.png" alt="location-icon">
                                    </div>
                                    <div class="lab-content">
                                        <a href="#">Address: Tp. Thủ Đức, TP.HCM.</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-middle padding-tb">
                <div class="container">
                    <div class="row shape-c">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="footer-middle-item-wrapper">
                                <div class="footer-middle-item mb-5 mb-lg-0">
                                    <div class="fm-item-title">
                                        <h5>About F.E.M</h5>
                                    </div>
                                    <div class="fm-item-content">
                                        <p class="mb-30">Trang thông tin chính thức về
                                            chương trình dành cho FPTU
                                            campus
                                            HCM: hoạt động CLB, chuyên đề cập nhật kiến thức
                                            mới, training kỹ năng
                                            sinh
                                            viên, hoạt động trải nghiệm thực tế.</p>
                                        <img class="rounded footer-abt-img"
                                             src="UserCSS/kagont/assets/images/footer/footer-middle/370X200.jpg" alt="about-image">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="footer-middle-item-wrapper">
                                <div class="footer-middle-item mb-5 mb-lg-0">
                                    <div class="fm-item-title">
                                        <h5>our Recent news</h5>
                                    </div>
                                    <div class="fm-item-content">
                                        <div class="fm-item-widget lab-item">
                                            <div class="lab-inner">
                                                <div class="lab-thumb">
                                                    <a
                                                        href="https://hcmuni.fpt.edu.vn/o-dai-hoc-fpt-co-nhung-cau-lac-bo-nao">
                                                        <img src="UserCSS/kagont/assets/images/footer/footer-middle/100X80.01.jpg"
                                                             alt="footer-widget-img"></a>
                                                </div>
                                                <div class="lab-content">
                                                    <h6><a
                                                            href="https://hcmuni.fpt.edu.vn/o-dai-hoc-fpt-co-nhung-cau-lac-bo-nao">
                                                            Ở Đại học FPT có những Câu lạc
                                                            bộ nào?</a></h6>
                                                    <p>September 20, 2022</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fm-item-widget lab-item">
                                            <div class="lab-inner">
                                                <div class="lab-thumb">
                                                    <a
                                                        href="https://hcmuni.fpt.edu.vn/3-dieu-khien-nhieu-sinh-vien-ngung-mo-fvc"><img
                                                            src="UserCSS/kagont/assets/images/footer/footer-middle/100X80.02.jpg"
                                                            alt="footer-widget-img"></a>
                                                </div>
                                                <div class="lab-content">
                                                    <h6><a
                                                            href="https://hcmuni.fpt.edu.vn/3-dieu-khien-nhieu-sinh-vien-ngung-mo-fvc">3
                                                            điều khiến nhiều sinh viên
                                                            “ngưỡng mộ” FVC.</a></h6>
                                                    <p>December 23, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fm-item-widget lab-item">
                                            <div class="lab-inner">
                                                <div class="lab-thumb">
                                                    <a
                                                        href="https://hcmuni.fpt.edu.vn/an-tuong-voi-cau-lac-bo-truyen-thong-gao-coi-cua-truong-dai-hoc-fpt"><img
                                                            src="UserCSS/kagont/assets/images/footer/footer-middle/100X80.03.jpg"
                                                            alt="footer-widget-img"></a>
                                                </div>
                                                <div class="lab-content">
                                                    <h6><a
                                                            href="https://hcmuni.fpt.edu.vn/an-tuong-voi-cau-lac-bo-truyen-thong-gao-coi-cua-truong-dai-hoc-fpt">Ấn
                                                            tượng với Câu lạc bộ Truyền
                                                            thông "gạo cội" của trường
                                                            Đại
                                                            học
                                                            FPT
                                                        </a></h6>
                                                    <p>July 29, 2021</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="footer-middle-item-wrapper">
                                <div class="footer-middle-item-3 mb-5 mb-lg-0">
                                    <div class="fm-item-title">
                                        <h5>OUR NEWSLETTER</h5>
                                    </div>
                                    <div class="fm-item-content">
                                        <p>F.E.M is a event organization supported
                                            by community leaders</p>
                                        <form>
                                            <div class="form-group">
                                                <input type="email" class="form-control" placeholder="Enter email">
                                            </div>
                                            <a href="mailto:daihoc.hcm@fpt.edu.vn">
                                                <button type="submit" class="lab-btn"><span>Send
                                                        Massage</span> <i class="icofont-paper-plane"></i></button>
                                            </a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="footer-bottom-content text-center">
                                <p>&copy;2022 <a href="index.html">F.E.M</a> - Best For
                                    Event Management Schedule.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section end here -->



        <!-- scrollToTop start here -->
        <a href="#" class="scrollToTop"><i class="icofont-bubble-up"></i><span class="pluse_1"></span><span
                class="pluse_2"></span></a>
        <!-- scrollToTop ending here -->

        <script src="UserCSS/kagont/assets/js/jquery.js"></script>
        <script src="UserCSS/kagont/assets/js/fontawesome.min.js"></script>
        <script src="UserCSS/kagont/assets/js/waypoints.min.js"></script>
        <script src="UserCSS/kagont/assets/js/bootstrap.bundle.min.js"></script>
        <script src="UserCSS/kagont/assets/js/swiper.min.js"></script>
        <script src="UserCSS/kagont/assets/js/circularProgressBar.min.js"></script>
        <script src="UserCSS/kagont/assets/js/isotope.pkgd.min.js"></script>
        <script src="UserCSS/kagont/assets/js/lightcase.js"></script>
        <script src="UserCSS/kagont/assets/js/functions.js"></script>
        <script>
            <%for (HistoryDTO history : dto) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String takePlaceDate = history.getTakePlaceDate();
                    long millis = System.currentTimeMillis();
                    Date today = new Date(millis);
                    if (takePlaceDate.equals(today.toString()) == true || sdf.parse(takePlaceDate).before(today) == false) {
            %>
                                            // Lấy phần Modal
                                            var modal = document.getElementById('<%=history.getEvtID() + "myModal"%>');

                                            // Lấy đường dẫn của hình ảnh và gán vào trong phần Modal
                                            var img = document.getElementById('<%=history.getEvtID()%>');
                                            var modalImg = document.getElementById("<%=history.getEvtID() + "index"%>");
                                            img.onclick = function () {
                                                modal.style.display = "block";
                                                modalImg.src = this.src;
                                            }

                                            // lấy button span có chức năng đóng Modal
                                            var span = document.getElementsByClassName("<%=history.getEvtID() + "close1"%>")[0];

                                            //Khi button được click, đóng modal
                                            span.onclick = function () {
                                                modal.style.display = "none";
                                            }
            <%}
                }%>
        </script>
        <script>  function hamDropdown() {
                document.querySelector(".noidung_dropdown").classList.toggle("hienThi");
            }</script>
        <script> window.onclick = function (e) {
                if (!e.target.matches('.nut_dropdown')) {
                    var noiDungDropdown = document.querySelector(".noidung_dropdown");
                    if (noiDungDropdown.classList.contains('hienThi')) {
                        noiDungDropdown.classList.remove('hienThi');
                    }
                }
            };
        </script>
    </body>

</html>