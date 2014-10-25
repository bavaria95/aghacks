(function () {
    'use strict';

    function projectContains(project, word) {
        return project.name.indexOf(word) > -1
            || project.long_description.indexOf(word) > -1;
    }

    function MainCtrl($resource) {
        var vm = this;

        var projectsFactory = $resource('/projects.json/:id', { id: '@id' });
        var projects = projectsFactory.query();

        vm.projects = projects;

        vm.filteredProjects = projects;

        vm.search = function(criteria){
            vm.filteredProjects = _.filter(vm.projects, function(proj)
                {
                    return projectContains(proj, criteria);
                });
        }
    }
    
    angular
        .module('app', ['ngResource'])
        .controller('MainCtrl', MainCtrl);
})();