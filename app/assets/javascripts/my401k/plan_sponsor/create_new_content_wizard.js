function extract_product_id(model_type, data){
  var re = new RegExp("<div id=\\\"" + model_type + "_(\\\d+)\\\" class=\\\"" + model_type + "\\\">|<a href=\\\"\/bcms_blog\/blog_posts\/(\\\d+)\\\"");
  var md = null

  return (md = data.match(re)) ? (md[1] || md[2]) : null;
}

function CKupdate(){
  if(typeof(CKEDITOR) != "undefined"){
    for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();
  }
}

function unloadCKEditor(){
  if(typeof(CKEDITOR) != "undefined"){
    for ( instance in CKEDITOR.instances ){
      console.log("removing instance: " + instance);
      //CKEDITOR.instances[instance].updateElement();
      CKEDITOR.instances[instance].destroy(true);
      //CKEDITOR.replace(instance);
    }
  }
}

function update_product(form, options){
  if(form == null){
    display_message("no form; no update to be performed");
    options.after_success();
    return false;
  }

  var href = $(form).attr("action");

  CKupdate();

  var jqxhr = $.post(href, form.serialize() + "&update_draft=", function(){}, "json")
  .done(function(data, textStatus, jqXHR){
    display_message("successful update");
    // var product_id = extract_product_id("blog_post", data);
    // $(form).attr("data-product-id", product_id);
    $("#current-product-id").text(data.id);
    console.log("data.id: " + data.id);

    options.after_success();
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    display_message("error with update: " + errorThrown);
    // display error message indicating what validation failed
    // e.g., 'fix and try again'
    console.log("error: " + errorThrown);
  });
}

function retire_messages(){
  $("#messages li").css("color", "red");
}

function display_message(msg){
  return false; //remove this line to enable
  $("#messages").append("<li>" + msg + "</li>")
  var msgItem = $("#messages").children().last();
  //$("#message").show();
 
  // setTimeout(function(){
  //   $(msgItem).fadeOut()
  // }, 1000);
}

function register_buttons(){
  display_message("registering buttons...");
  $(".tab-pane.active a:contains('Next')").click(function(){
    $('#rootwizard').bootstrapWizard('next');
  });
  $(".tab-pane.active a:contains('Previous')").click(function(){
    $('#rootwizard').bootstrapWizard('previous');
  });
}

// function register_buttons(){
//   display_message("registering buttons...");
//   $(".tab-pane.active a:contains('Previous')").click(function(){
//     update_product(this, {
//       after_success: function(){
//         // save was successful; move on
//         $('#rootwizard').bootstrapWizard('previous');
//       }
//     });
//   });
// 
//   $(".tab-pane.active a:contains('Next')").click(function(){
//     update_product(this, {
//       after_success: function(){
//         // save was successful; move on
//         $('#rootwizard').bootstrapWizard('next');
//       }
//     });
//   });
// }

var handleOnTabShow = function(tab, navigation, index) {
    retire_messages(); 
    display_message("handling onTabShow...");
    unloadCKEditor();

    var $total = navigation.find('li').length;
    var $current = index+1;
    var $percent = ($current/$total) * 100;
    $('#rootwizard').find('.bar').css({width:$percent+'%'});

    // If it's the last tab then hide the last button and show the finish instead
    if($current >= $total) {
      $('#rootwizard').find('.pager .next').addClass("disabled");
      $('#rootwizard').find('.pager .finish').removeClass("disabled");
      $('#rootwizard').find('.pager .last').addClass("disabled");
    } else {
      $('#rootwizard').find('.pager .next').removeClass("disabled");
      $('#rootwizard').find('.pager .last').removeClass("disabled");
      $('#rootwizard').find('.pager .finish').addClass("disabled");
    }

    if($('#rootwizard .pager .previous').hasClass("disabled")){
      $('#rootwizard .pager .first').addClass("disabled");
    } else {
      $('#rootwizard .pager .first').removeClass("disabled");
    }


    //console.log($(tab).html());
    var href = $("a", tab).attr("href");
    if(!href.match(/^#/)){
      var parts = href.split(/#/);
      var product_id = $("#current-product-id").text();

      // if there is an product id that has been stored for this session already
      if(product_id.length > 0){
        href = parts[0] + "?id=" + product_id + "#" + parts[1];
      }
    }

    // var form = $("#blog_post_blog_id").closest("form")
    // if($(form).attr("data-product_id")){
    //   // var parts = href.split(/#/);
    //   // href = parts[0] + "/" + product_id + "#" + parts[1];
    //   href = href + "?id=" + product_id;
    // }
    console.log("href: " + href);

    $(".tab-pane").each(function(i, obj){
      $(obj).html("");
    });

    //console.log(href);
  display_message("href for get... '" + href + "'");
    if(!href.match(/^#/)){
      $.get(href, function(data){
        var lz_id = href.match(/(#[^#]+)$/)[1];
        $(lz_id).html(data);

        // register the buttons in the wizard; usually this is to navigate to previous and next
        setTimeout(function(){
          register_buttons();
        }, 50);
      });
    }

  }

$(document).ready(function() {
  $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index){
    display_message("handling onTabShow (1)...");

    var form = $(".tab-pane.active").find("form").first();
    display_message("form: " + $("form").attr("action"));
    //if($("#flag-first-time").length == 0){
    if(typeof(form[0]) != "undefined"){
      display_message("updating product...");
      update_product(form, {
        after_success: function(){
          display_message("callback: handleOnTabShow");
          // save was successful; move on
          handleOnTabShow(tab, navigation, index);
          //$('#rootwizard').bootstrapWizard('next');
        }
      });
    } else {
      $("#flag-first-time").remove();
      handleOnTabShow(tab, navigation, index);
    }

  }});

  $('#rootwizard').bootstrapWizard("show", 3);
});

