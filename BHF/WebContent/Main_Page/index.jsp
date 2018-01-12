<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="header_Main.jsp" />




    <!-- Page Content -->
    <section class="content-section-a hidden" id ="howItWorksID">

      <div class="container">
        <div class="row">
          <div class="col-lg-5 ml-auto">
            <hr class="section-heading-spacer">
            <div class="clearfix"></div>
            <h2 class="section-heading">SHIT SHIT SHIT SHIT<br>BIKE IS IT BIKE BIKE BIKE</h2>
            <p class="lead">A lama in my living room. Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. 
            Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque 
            semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies 
            purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, 
            vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget
             neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus
              eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi,
               in interdum massa nibh nec erat.</p>
            
          </div>
          <div class="col-lg-5 mr-auto">
       		  <img class="img-fluid" src="/BHF/Main_Page/img/Main_Bike.jpg" alt="" id ="img234"> 
          </div>
        </div>

      </div>
      <!-- /.container -->
    </section>

    <section class="content-section-b hidden" id ="howItWorksID_2">

      <div class="container">

        <div class="row">
          <div class="col-lg-5 mr-auto order-lg-2">
            <hr class="section-heading-spacer">
            <div class="clearfix"></div>
            <h2 class="section-heading">HARD TIMES</h2>
            <p class="lead">GONNA MAKE U WONDER WHY U EVEN TRY <br> HARD TIMES <br>
            gonna take your laugh and make u cry. Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. 
            Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque 
            semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies 
            purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, 
            vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget
             neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus
              eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi,
               in interdum massa nibh nec erat.</p>
          </div>
          <div class="col-lg-5 ml-auto order-lg-1">
        	   <img class="img-fluid" src="/BHF/Main_Page/img/b5.jpg" alt="">
          </div>
        </div>

      </div>
      <!-- /.container -->

    </section>
    <!-- /.content-section-b -->

    <section class="content-section-c hidden" id="about">

      <div class="container">
        <div class="row">
          <div class="col-lg-5 ml-auto">
            <hr class="section-heading-spacer">
            <div class="clearfix"></div>
            <h2 class="section-heading">About us</h2>
            <p class="lead">Łukasz Majcher in 2017 created B^5. His goal was to help people find better roads for cycling <br>
            and encourage people to start doin' it with his little help. Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. 
            Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque 
            semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies 
            purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, 
            vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget
             neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus
              eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi,
               in interdum massa nibh nec erat.</p>
          </div>
          <div class="col-lg-5 mr-auto ">
              <img class="img-fluid" src="/BHF/Main_Page/img/b8.jpg" alt="">
          </div>
        </div>

      </div>
      <!-- /.container -->

    </section>
    <!-- /.content-section-a -->

    <aside class="banner">

      <div class="container hidden">
      
      
    <!-- Contact -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">Contact Us</h2>
            <h3 class="section-subheading">If u have any questions for us, please don't be afraid to ask.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <form id="contactForm" name="sentMessage" novalidate>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <!-- <input class="form-control" id="name" type="text" placeholder="Your Name" required data-validation-required-message="Please enter your name."> -->
                    <input class="form-control" id="name" type="text" placeholder="Your Name" data-toggle="popover" data-placement="top" data-content="Please enter your name.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="email" type="email" placeholder="Your Email" data-toggle="popover" data-placement="top" data-content="Please enter your email address.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="phone" type="tel" placeholder="Your Phone" data-toggle="popover" data-placement="top" data-content="Please enter your phone number.">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Your Message" data-toggle="popover" data-placement="top" data-content="Please enter a message."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                
                <div class="clearfix"></div>
                <div class="col-lg-12 text-center">
                  <div id="success"></div>
                  <button id="sendMessageButton" class="btn btn-xl" type="submit">Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
      
      </div>
      <!-- /.container -->

    </aside>
    <!-- /.banner -->
    
    

   <jsp:include page="footer_Main.jsp" />
   
