angular.module('app', []);

angular.module('app').controller('MainCtrl', function (){
  var self = this;

  self.message = 'hello';

  self.changeMessage = function(message){
    self.message = message;
  };
});