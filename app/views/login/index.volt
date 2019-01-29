  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            {{ form("login/login","method": "post") }}
              <h1>Login Form</h1>
              <div id="alerts">{{ flashSession.output() }}</div>
              <div>
                {{ text_field('username', 'class':'form-control', 'placeholder': 'Username','name':'username','value':username) }}
              </div>
              <div>
                {{ password_field('password', 'class':'form-control', 'placeholder': 'Password','name':'password') }}
              </div>
              <div>
                {{ submit_button('Log in','type':'submit','class':'btn btn-default submit','id':'loginSubmit') }}

                {{ link_to('login/repass','Lost your password?','class':'reset_pass') }}
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                  <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                </div>
              </div>
            {{ endForm() }}
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            {{ form("login/signin","method": "post") }}
              <h1>Create Account</h1>
              <div>
                {{ text_field('username', 'class':'form-control', 'placeholder': 'Username','name':'create[username]','value':create.username,'required':'required') }}
              </div>
              <div>
                {{ text_field('email', 'class':'form-control', 'placeholder': 'Email','name':'create[email]','value':create.username,'required':'required') }}
              </div>
              <div>
                {{ password_field('password', 'class':'form-control', 'placeholder': 'Password','name':'create[password]','value':'','required':'required') }}
              </div>
              <div>
                {{ submit_button('Submit','type':'submit','class':'btn btn-default submit','id':'signinSubmit') }}
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                  <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                </div>
              </div>
            {{ endForm() }}
          </section>
        </div>
      </div>
    </div>
  </body>