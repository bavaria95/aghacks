(function () {
    'use strict';

    function projectContains(project, word) {
        return project.name.indexOf(word) > -1
            || project.long_description.indexOf(word) > -1
            || containsAnySkill(project.skills, word);
    }

    function userContains(user, word) {
        return user.username.indexOf(word) > -1;
        // TODO Description
            // || user.long_description.indexOf(word) > -1;
            // || containsAnySkill(user.skills, word);
    }

    function containsAnySkill(skills, word){
        return _.some(skills, function(skill){
            return skill.indexOf(word) > -1;
        });
    }

    function MainCtrl($resource) {
        var vm = this;

        var projectsFactory = $resource('/projects.json/:id', { id: '@id' });
        var projects = projectsFactory.query();
        vm.projects = projects;
        vm.filteredProjects = projects;

        var usersFactory = $resource('/users.json/:id', { id: '@id' });
        var users = usersFactory.query();
        vm.users = users;
        vm.filteredUsers = users;

        vm.search = function(criteria){
            if (!criteria) 
                return;

            vm.filteredProjects = _.filter(vm.projects, function(proj)
                {
                    return projectContains(proj, criteria);
                });

            vm.filteredUsers = _.filter(vm.users, function(user)
                {
                    return userContains(user, criteria);
                });
        }

        vm.showProjectDetails = function(project){
            if (!angular.isUndefined(vm.choosenProject) && vm.choosenProject.name === project.name) {
                vm.choosenProject = undefined;
            } else {
                vm.choosenProject = project;
            }

            vm.choosenUser = undefined;
        }

        vm.showUserDetails = function(user){
            if (!angular.isUndefined(vm.choosenUser) && vm.choosenUser.username === user.username) {
                vm.choosenUser = undefined;
            } else {
                vm.choosenUser = user;
            }

            vm.choosenProject = undefined;
        }
    }
    
    angular
        .module('app')
        .controller('MainCtrl', MainCtrl);
})();