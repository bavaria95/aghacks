(function () {
    'use strict';

    function TagsCtrl($scope){
        // var vm = this;

        $scope.inputs = ["Amsterdam","Washington","Sydney","Beijing","Cairo"];
        $scope.selectedInputs = ["Amsterdam"];

        console.log(1)
    }
    
    angular
        .module('app')
        .controller('TagsCtrl', TagsCtrl);
})();