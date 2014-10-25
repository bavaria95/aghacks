(function () {
    'use strict';

    function projectContains(project, word) {
        return project.name.indexOf(word) > -1
            || project.info.indexOf(word) > -1
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

    function MainCtrl($resource, $scope, ProjectRegisterService, ApplyingProjectService) {
        var vm = this;

        vm.showProjectDetails = showProjectDetails;
        vm.showUserDetails = showUserDetails;
        vm.applyToProject = ProjectRegisterService.register;

        var projectsFactory = $resource('/projects.json/:id', { id: '@id' });
        var projects = projectsFactory.query();
        vm.projects = projects;
        vm.filteredProjects = projects;

        var usersFactory = $resource('/users.json/:id', { id: '@id' });
        var users = usersFactory.query();
        vm.users = users;
        vm.filteredUsers = users;

        $scope.$watch(function($scope){
            return ApplyingProjectService.userData;
        }, function(userData){
            if (userData.is_confirmed) {
                vm.myProject = _.findWhere(vm.projects, {id: userData.project_id});
            } else {
                vm.myProject = undefined;
            }
            console.log(userData);
        })

        vm.search = function(criteria){
            var projectPredicate = function(proj)
            {
                return projectContains(proj, criteria);
            }

            var userPredicate = function(user)
            {
                return userContains(user, criteria);
            }

            if (!criteria){
                projectPredicate = function() { return true;}
                userPredicate = function() { return true;}
            }

            vm.filteredProjects = _.filter(vm.projects, projectPredicate);

            vm.filteredUsers = _.filter(vm.users, userPredicate);

            vm.choosenProject = undefined;
            vm.choosenUser = undefined;
        }

        function showProjectDetails(project){
            if (!angular.isUndefined(vm.choosenProject) && vm.choosenProject.name === project.name) {
                vm.choosenProject = undefined;
            } else {
                vm.choosenProject = project;
            }

            vm.choosenUser = undefined;
        }

        function showUserDetails(user){
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