# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
# vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
# require jquery
#= require jquery_ujs
# require_tree ./pages
# require bootstrap-sprockets
# require_tree .

@vendor_prop_set = (elem, prop, val) ->
  for vendor in ['webkit','moz','o','']
    prop = if vendor == ''
      prop
    else
      '-' + vendor + '-' + prop

    $(elem).css(prop, val)

@setup_page_nav_links = (idx, elem) ->
  vendor_prop_set(this, 'animation-delay', 0.5 + idx * 0.1 + 's')
  $(elem).addClass 'animated fadeInDown'
  .click (evt) ->
    href = $(this).attr 'href'
    return if !href.match /^#/

    evt.preventDefault
    y = $(href).offset().top - 77

    $("html, body").animate scrollTop: y, 1000, jQuery.easing['easeInOutQuad']

# scrollup
$.scrollUp
  scrollName: 'scrollUp', # Element ID
  topDistance: '77', # Distance from top before showing element (px)
  topSpeed: 300, # Speed back to top (ms)
  easingType: 'easeInOutQuad',
  animation: 'fade', # Fade, slide, none
  animationInSpeed: 200, # Animation in speed (ms)
  animationOutSpeed: 200, # Animation out speed (ms)
  scrollText: '', # Text for element
  scrollTrigger: '#scrollTopBtn',
  activeOverlay: false  # Set CSS color to display scrollUp active point, e.g '#00FFFF'

  # navigation
  $('.page-nav > li > a').each setup_page_nav_links
