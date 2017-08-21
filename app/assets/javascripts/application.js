// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require speak/speakClient
//= require_tree .

// Load a setting from localStorage, or use a default
var loadSetting = function(key,default_value){
  if(typeof(Storage) !== "undefined"){
    return localStorage.getItem(key) || default_value;
  }
  return default_value;
};

// Save a setting to localStorage
var saveSetting = function(key,value){
  if(typeof(Storage) !== "undefined"){
    localStorage.setItem(key,value);
  }
};

// load settings
$(document).ready(function(){
  // Set slider textfields
  $('#voice_speed').on('change',function(){
    var v = $(this).val();
    $('#voice_speed_value').val(v);
    saveSetting("speed",v);
  });
  $('#voice_wordgap').on('change',function(){
    var v = $(this).val();
    $('#voice_wordgap_value').val(v);
    saveSetting("wordgap",v);
  });
  $('#voice_pitch').on('change',function(){
    var v = $(this).val();
    $('#voice_pitch_value').val(v);
    saveSetting("pitch",v);
  });

  $('#voice_speed').val(loadSetting("speed",165));
  $('#voice_speed_value').val($('#voice_speed').val());

  $('#voice_wordgap').val(loadSetting("wordgap",3));
  $('#voice_wordgap_value').val($('#voice_wordgap').val());

  $('#voice_pitch').val(loadSetting("pitch",50));
  $('#voice_pitch_value').val($('#voice_pitch').val());
});

