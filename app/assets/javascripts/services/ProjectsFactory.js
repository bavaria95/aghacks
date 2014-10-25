(function () {
    'use strict';

    function ProjectsFactory($http) {

        ProjectsFactory.filteredProjects = [];

        var allProjects = [];

        ProjectsFactory.getProjects = function () {
            return $http.get('/projects.json/')
                .success(function (data) {
                    ProjectsFactory.filteredProjects = data;
                    allProjects = data;
                })
                .error(function () {
                    NotificationFactory.showError();
                });
        }

        return ProjectsFactory;
    }

    angular
        .module('app')
        .factory('ProjectsFactory', ProjectsFactory);
})();