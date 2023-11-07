<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WidUs</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
  <link href="resources/home/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
 
  <!-- Vendor CSS Files -->
  <link href="resources/home/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="resources/home/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/home/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/home/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/home/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/home/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/home/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/home/assets/css/home.css" rel="stylesheet">

  <!-- ========================================================
  * Template Name: Arsha
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
  	
<style>
	body {
		font-family: 'Nanum Gothic', sans-serif;
  	}
</style>
</head>

<body>

 <jsp:include page="header.jsp"></jsp:include>

  <!-- ======= Hero Section ======== -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>업무 관리의 첫 걸음</h1>
          <h2> WidUs와 함께 프로젝트를 보다 빠르고 쉽게 관리하세요!</h2>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="${pageContext.request.contextPath}/user/login" class="btn-get-started scrollto" style="font-weight:600">지금 시작하기</a>
            <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>소개 영상</span></a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="resources/home/assets/img/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
      <div class="container">

        <div class="row" data-aos="zoom-in">

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="resources/home/assets/img/clients/client-1.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="resources/home/assets/img/clients/client-2.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="resources/home/assets/img/clients/client-3.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="resources/home/assets/img/clients/client-4.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="resources/home/assets/img/clients/client-5.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="resources/home/assets/img/clients/client-6.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Cliens Section -->

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>소개</h2>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <p style="font-weight:600; font-size:14.5px;">
				기존의 협업툴에 만족하지 못한 저희는 더 나은 도구를 창조하고자 'WidUs'의 개발을 시작하였습니다.<br>
				대규모 업무를 체계적으로 관리하고, 맞춤형 기능을 제공함으로써 사용자의 편의성을 높였습니다. <br>
				이제 저희가 제작한 'WidUs'를 통해 효율적이고 만족스러운 업무 환경을 경험해 보시길 바랍니다.
            </p>
            <ul style="font-size:12.5px;">
              <li><i class="ri-check-double-line"></i> 사용자들이 실제로 필요로 하는 기능들을 개발하는 데에 집중하였습니다.</li>
              <li><i class="ri-check-double-line"></i> 타 협업툴들의 강력한 이슈트래킹 시스템을 융합하고 도입하여 업무 추적에 효과적입니다.</li>
              <li><i class="ri-check-double-line"></i> 다양한 소통 기능으로 인해 대규모 프로젝트를 위한 업무 협업 툴로 효과적입니다.</li>
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0" style="display: flex; flex-direction: column; justify-content: flex-start;">
            <p style="font-weight:600; font-size:14.5px;">
			WidUs의 목표는 단순히 업무 처리 속도를 높이거나 생산성만 증대시키는 것이 아닙니다. <br>
			모든 구성원이 자신의 역량과 장점을 최대화 할 수 있는 환경을 만들어 함께 성장하는 조직 문화를 만드는 것에 중점을 두고 있습니다.
            </p>
            <div>
            	<a href="../widus/user/login" class="btn-learn-more" >지금 시작하기</a>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= Skills Section ======= -->
    <section id="skills" class="skills">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 d-flex align-items-center" data-aos="fade-right" data-aos-delay="100">
            <img src="home/assets/img/skills.png" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 content" data-aos="fade-left" data-aos-delay="100">
            <h3 style="font-weight:600">저희의 개발 환경을 소개합니다</h3>
            <p class="fst-italic" style="font-size:14.5px">
              저희 팀에서는 체계적이고 효율적인 개발을 위해 다양한 기술을 활용하고 있습니다. <br>
              현재 저희가 주로 사용한 기술들을 소개드리겠습니다.
            </p>

            <div class="skills-content">

              <div class="progress">
                <span class="skill">Spring Boot<i class="val">100%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">Oracle <i class="val">90%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">JavaScript <i class="val">75%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">Html & CSS <i class="val">55%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>

            </div>

          </div>
        </div>

      </div>
    </section><!-- End Skills Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>팀</h2>
          <p>저희 WidUs 프로젝트 개발에 참여한 팀원들을 소개합니다.</p>
        </div>

        <div class="row">

          <div class="col-lg-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/project/img/projectboard/team/user1.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>김수연</h4>
                <span style="font-weight:600">Teacher</span>
                <p>한 학기동안 이끌어주셔서 정말 감사드립니다.</p>
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="200">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/project/img/projectboard/team/user4.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>박민기</h4>
                <span style="font-weight:600">조 장</span>
                <p>채팅, 개인 대시보드, 캘린더, 이슈 CRUD</p>
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/project/img/projectboard/team/user3.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>김주영</h4>
                <span style="font-weight:600">조 원</span>
                <p>로그인 & 회원가입, 프로젝트 검색, 파일함</p>
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="400">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/project/img/projectboard/team/user2.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>김혜원</h4>
                <span style="font-weight:600">조 원</span>
                <p>알림 & 언급, 할당된 작업 게시판</p>
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="400">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/project/img/projectboard/team/user6.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>옥진석</h4>
                <span style="font-weight:600">조 원</span>
                <p>프로젝트 리스트, 프로젝트 대시보드, 프로젝트 CRUD</p>
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="400">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/project/img/projectboard/team/user5.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>한혜진</h4>
                <span style="font-weight:600">조 원</span>
                <p>마이 페이지, 관리자 페이지, 북마크</p>
                <div class="social">
                  <a href=""><i class="ri-twitter-fill"></i></a>
                  <a href=""><i class="ri-facebook-fill"></i></a>
                  <a href=""><i class="ri-instagram-fill"></i></a>
                  <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                </div>
              </div>
            </div>
          </div>

      </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>오시는길</h2>
          
        </div>

        <div class="row">

          <div class="col-lg-5 d-flex align-items-stretch" style="width:100%;">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>주소:</h4>
                <p>서울특별시 종로구 율곡로10길 105 디아망 4층 (봉익동 10-1)</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>kingpmk1004@naver.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>연락처:</h4>
                <p>070-8240-3211~3</p>
              </div>

              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.2407443204884!2d126.98965597488043!3d37.5729483720369!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2de8755d8a5%3A0xcebb3cb311014c45!2z7KSR7JWZSFRB!5e0!3m2!1sko!2skr!4v1695199578377!5m2!1sko!2skr" frameborder="0" style="border:0; width: 100%; height: 290px;" allowfullscreen></iframe>
            </div>

          </div>

<!--           <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="name">이름</label>
                  <input type="text" name="name" class="form-control" id="name" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="name">이메일</label>
                  <input type="email" class="form-control" name="email" id="email" required>
                </div>
              </div>
              <div class="form-group">
                <label for="name">제목</label>
                <input type="text" class="form-control" name="subject" id="subject" required>
              </div>
              <div class="form-group">
                <label for="name">문의 내용</label>
                <textarea class="form-control" name="message" rows="10" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">메일이 전송되었습니다.</div>
              </div>
              <div class="text-center"><button type="submit">보내기</button></div>
            </form>
          </div> -->

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>WidUs</h3>
            <p>
              서울 종로구 율곡로10길 <br>
              105 디아망 4층<br>
              봉익동 10-1 03134<br><br>
              <strong>Phone:</strong> 010-1234-1234<br>
              <strong>Email:</strong> WidUs1004@naver.com<br>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>다음으로 이동</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">홈</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">소개</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">솔루션</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">서비스 약관</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">개인정보 이용약관</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>SNS</h4>
            <p>WidUs 팀원들의 SNS 계정을 방문해 보세요.</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>WidUs</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ -->
        Designed by <a href="https://bootstrapmade.com/">JHTA_L3_1</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/home/assets/vendor/aos/aos.js"></script>
  <script src="resources/home/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/home/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/home/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/home/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/home/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="resources/home/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/home/assets/js/main.js"></script>

</body>

</html>