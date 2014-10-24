(function () {
    'use strict';

    function MainCtrl($scope, $resource) {
        console.log(1)

        var projectsFactory = $resource('/projects.json/:id', { id: '@id' });
        var projects = projectsFactory.query();

        $scope.projects = projects;

        $scope.search = function(){
            var pr = $scope.projects;
            console.log(2)
        }
    }
    
    angular
        .module('app', ['ngResource'])
        .controller('MainCtrl', MainCtrl);
})();