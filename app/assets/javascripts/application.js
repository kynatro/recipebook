//= require jquery
//= require jquery_ujs
//= require cocoon
//= require angular
//= require angular-rails-templates
//= require bootstrap-sprockets
//= require_tree ../templates
//= require_tree ./controllers
//= require_self

(function($, window, undefined){
  var app = angular.module('RecipebookApp', ['templates', 'recipes']);
})(jQuery, window, null);
