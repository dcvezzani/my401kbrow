// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// require jquery
// require jquery_ujs
// require_tree .
//
//= require jquery
//= require jquery_ujs
//= require 'rangy-1.2.3/rangy-core.js'
//= require 'rangy-1.2.3/rangy-cssclassapplier.js'
//= require 'rangy-1.2.3/rangy-selectionsaverestore.js'
//= require 'rangy-1.2.3/rangy-serializer.js'
//= require 'spin.min.js'
//= require 'spin-instance.js'
//= require_tree .

function saveWizardPage(step, serialized_data, success, failure){
  href = "/content_page/wizard/step_0" + step;
  //alert(href + "?ajax=true");
  var jqxhr = $.post(href + "?ajax=true", serialized_data, success).error(failure);
}


function deleteAndUpdateSection(href, css_selector, callback){
  if(arguments.length > 1){
  } else {
    css_selector = "#mid-section";
  }

  if(arguments.length > 2){
  } else {
    callback = function(){};
  }

  //alert(href + "?ajax=true");
  var token = $("meta[name='csrf-token']").attr('content')
  var jqxhr = $.post( href+"?ajax=true", {authenticity_token: token, utf8: 1, _method: 'delete'}, function(data){
    $(css_selector).html(data);
    callback();
  })
  .error(function(){
    redirect_to_sign_in();
  });
}
var deleteAndUpdateMidSection = deleteAndUpdateSection;

/* used when the need for sign in arises during an ajax call 
   used when content needs to be swapped out of div#mid-section
   if there is an error, assume it is a login error and ask the user to log in
*/
function updateSection(href, css_selector, callback){
  if(arguments.length > 1){
  } else {
    css_selector = "#mid-section";
  }

  if(arguments.length > 2){
  } else {
    callback = function(){};
  }

  //alert(href + "?ajax=true");
  var jqxhr = $.get(href + "?ajax=true", function(data){
    $(css_selector).html(data);
    callback();
  })
  .error(function(){
    redirect_to_sign_in();
  });
}
var updateMidSection = updateSection;

function updateTools(href, callback){
  var jqxhr = $.get(href + "?ajax=true", function(data){
    var tools_section = $("div#left div.tools");
    //alert($(tools_section).length);
    $(tools_section).html(data);

    var tab_id = $(tools_section).attr('id');
    var tabs_section = $("div#left div.split-navigation");
    if(tabs_section.length > 0){
      //$("a[href='#" + tab_id + "']").effect("highlight", {}, 1500);
      $(tabs_section).tabs("select", 0);
    }

    if(arguments.length > 1){
      callback();
    }
  })
  .error(function(){
    redirect_to_sign_in();
  });
}
/*
function updateNavAndMidSection(href){
  var jqxhr = $.get(href, function(data){
    $("#mid-section").html(data);
  }, "json")
  .error(function(){
    redirect_to_sign_in();
  });
}
*/

function redirect_to_sign_in(){
    // scrape the csrf token from the header section; we'll need it for POST requests
    /* e.g., 
    <meta name="csrf-param" content="authenticity_token">
    <meta name="csrf-token" content="V6KGb+fj6Stvfy445WXxAQVTD0duamPFaW7uDhIA/Ik=">
    */
    var csrfParam = $("meta[name='csrf-param']").attr("content"), 
        csrfToken = $("meta[name='csrf-token']").attr("content"); 

    // assemble the parameters to be included in the content-header
    var data = {path: location.href};
    data[csrfParam] = csrfToken;
    
    //$.post("/set_redirect_to", {path: href}, function(data){
    $.post("/set_redirect_to", data, function(data){
      location.href = $("#sign-in").attr("href");
    });
}


