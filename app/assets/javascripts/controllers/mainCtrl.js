(function () {
    'use strict';

    function projectContains(project, word) {
        return project.name.indexOf(word) > -1
            || project.long_description.indexOf(word) > -1;
    }

    function MainCtrl($scope, $resource) {
        var projectsFactory = $resource('/projects.json/:id', { id: '@id' });
        var projects = projectsFactory.query();

        $scope.projects = projects;

        $scope.filteredProjects = projects;

        $scope.search = function(criteria){
            $scope.filteredProjects = _.filter($scope.projects, function(proj)
                {
                    return projectContains(proj, criteria);
                });
        }
    }
    
    angular
        .module('app', ['ngResource'])
        .controller('MainCtrl', MainCtrl);
})();