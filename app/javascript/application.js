// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require jquery_ujs

function check_password()
{
  var password = document.getElementById("password").value;
  var confirm_password = document.getElementById("confirm_password").value;
  console.log(password)
  console.log(confirm_password)
  if(password)
    {
      if(confirm_password==password)
        {
          alert("password matched...")
        }
      else
      {
        alert("password is not matching")
        document.getElementById("confirm_password").value=""
      }
    }
  else
  {
    alert("please first type password")
    document.getElementById("confirm_password").value=""
  }
}
function myFunction() {
  var checkBox = document.getElementById("check");
  var email_field = document.getElementById("email");
  if (checkBox.checked == true){
    email_field.style.display="block"
  } 
  else {
    alert("unchecked")
    email_field.style.display="none"
  }
}
