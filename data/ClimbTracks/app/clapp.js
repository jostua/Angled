angular.module('app', []).
    controller('MainCtrl', function (){
        var self = this;

        self.message = 'hello';

        self.changeMessage = function(message){
            self.message = message;
        };
    }).
    controller('SecCtrl', ['$scope','notify', function ($scope, notify){
        $scope.callNotify = function(msg) {
            notify(msg);
        };
    }]).
    factory('messages', function() {
        var messages = {};

        var messages.list = [];

        messages.add = function(message) {
            messages.list.push({id: messages.list.length, text: message});
        };

        return messages
    }]);
