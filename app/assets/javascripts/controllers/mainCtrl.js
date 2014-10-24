(function () {
    'use strict';

    function MainCtrl($scope) {
        console.log(1)
    }
    
    angular
        .module('app')
        .controller('MainCtrl', MainCtrl);
})();