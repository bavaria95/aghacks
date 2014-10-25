(function () {
    'use strict';

    function containsAnySkill(skills, word){
        return _.some(skills, function(skill){
            return skill.indexOf(word) > -1;
        });
    }

    function MainCtrl($resource, $scope, ProjectRegisterService, ApplyingProjectService, UsersFactory, ProjectsFactory) {
        var vm = this;

        vm.projectContains = projectContains;
        vm.userContains = userContains;

        vm.showProjectDetails = showProjectDetails;
        vm.showUserDetails = showUserDetails;
        vm.applyToProject = ProjectRegisterService.register;

        UsersFactory.getUsers()
          .then(function () {
            vm.filteredUsers = UsersFactory.filteredUsers;
          });

        ProjectsFactory.getProjects()
          .then(function () {
            vm.filteredProjects = ProjectsFactory.filteredProjects;
          });

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

        function projectContains(project) {
            if(!vm.word)
                return true;
            
            return project.name.indexOf(vm.word) > -1
                || project.info.indexOf(vm.word) > -1
                || containsAnySkill(project.skills, vm.word);
        }

        function userContains(user, word) {
            if(!vm.word)
                return true;
            
            return user.username.indexOf(vm.word) > -1;
            // TODO Description
                // || user.long_description.indexOf(word) > -1;
                // || containsAnySkill(user.skills, word);
        }

        vm.search = function(criteria){
            vm.word = criteria;
            vm.choosenProject = undefined;
            vm.choosenUser = undefined;
        }

        function showProjectDetails(project){
            if (!angular.isUndefined(vm.choosenProject) && vm.choosenProject.id === project.id) {
                vm.choosenProject = undefined;
            } else {
                vm.choosenProject = project;

                vm.caption = 'Apply to this project';
                if (project.id === ApplyingProjectService.userData.project_id) {
                    if (ApplyingProjectService.userData.is_confirmed) {
                        vm.caption = 'Cancel my confirmation';
                    } else {
                        vm.caption = 'Remove my application';
                    }
                };
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