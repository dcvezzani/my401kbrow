function next_product_id(class_name){
  class_name = "BcmsBlog::BlogPost"
  var href = "/my401k/plan_sponsor/create_new_content/next_product_id?product[class_name]=" + class_name;
  var next_id = null;

  $.get(href, function(data){
    next_id = data['next_id'];
  }, "json");

  return next_id;
}
function extract_product_id(model_type, data){
  var re = new RegExp("<div id=\\\"" + model_type + "_(\\\d+)\\\" class=\\\"" + model_type + "\\\">|<a href=\\\"\/bcms_blog\/blog_posts\/(\\\d+)\\\"");
  var md = null

  return (md = data.match(re)) ? (md[1] || md[2]) : null;
}

function register_buttons(){
  $("a:contains('Previous')").click(function(){
    $('#rootwizard').bootstrapWizard('previous');
  });
  $("a:contains('Next')").click(function(){
    //var next_id = next_product_id;

    var form = $(this).closest(".wrapper").find("form").first();
    var href = $(form).attr("action");

    var jqxhr = $.post(href, form.serialize())
    .done(function(data, textStatus, jqXHR){
      var product_id = extract_product_id("blog_post", data);
      $(form).attr("data-product-id", product_id);

      // save was successful; move on
      $('#rootwizard').bootstrapWizard('next');
    })
    .fail(function(jqXHR, textStatus, errorThrown){
      // display error message indicating what validation failed
      // e.g., 'fix and try again'
    });

  });
}

$(document).ready(function() {
  $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
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
    var form = $("#blog_post_blog_id").closest("form")
    if($(form).attr("data-product_id")){
      // var parts = href.split(/#/);
      // href = parts[0] + "/" + product_id + "#" + parts[1];
      href = href + "?id=" + product_id;
    }

    //console.log(href);
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

  }});
});

