(function () {
    'use strict';

    function compareInsensitive(longText, word){
        return longText.toUpperCase().indexOf(word.toUpperCase()) > -1;
    }

    function containsAnySkill(skills, word){
        return _.some(skills, function(skill){
            return compareInsensitive(skill, word);
        });
    }

    function MainCtrl($resource, $scope, ProjectRegisterService, ApplyingProjectService, UsersFactory, ProjectsFactory, ColorTagService, NeedConfirmationService) {
        var vm = this;

        vm.projectContains = projectContains;
        vm.userContains = userContains;

        vm.showProjectDetails = showProjectDetails;
        vm.showUserDetails = showUserDetails;
        vm.applyToProject = ProjectRegisterService.register;
        vm.getButtonColor = ColorTagService.getButtonColor;

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

            if (vm.choosenProject) {
                refreshCaption();
            };
        })

        $scope.$watch(function($scope){
            return NeedConfirmationService.confirmations;
        }, function(confirmations){
            vm.showConfirmations = confirmations && confirmations.length;
        })

        function projectContains(project) {
            if(!vm.word)
                return true;
            
            var result = compareInsensitive(project.name, vm.word)
                || compareInsensitive(project.info, vm.word)
                || containsAnySkill(project.skills, vm.word)

            return result;
        }

        function userContains(user) {
            if(!vm.word)
                return true;
            
            return compareInsensitive(user.username, vm.word)
                || compareInsensitive(user.info, vm.word)
                || containsAnySkill(user.skills, vm.word);
        }

        vm.search = function(criteria){
            vm.word = criteria;
            vm.choosenProject = undefined;
            vm.choosenUser = undefined;
        }

        function refreshCaption() {
            vm.caption = 'Apply to this project';
            if (vm.choosenProject.id === ApplyingProjectService.userData.project_id) {
                if (ApplyingProjectService.userData.is_confirmed) {
                    vm.caption = 'Cancel my confirmation';
                } else {
                    vm.caption = 'Remove my application';
                }
            };

            vm.isMyProject = vm.choosenProject.creator === ApplyingProjectService.userData.username 
        }

        function showProjectDetails(project){
            if (!angular.isUndefined(vm.choosenProject) && vm.choosenProject.id === project.id) {
                vm.choosenProject = undefined;
            } else {
                vm.choosenProject = project;

                refreshCaption();
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

        vm.colorCounter = 0;

        function getButtonColor(){
            vm.colorCounter++;

            if (vm.colorCounter % 2 === 0) {
                return ""
            };

            return "btn-danger"
        }
    }
    
    angular
        .module('app')
        .controller('MainCtrl', MainCtrl);
})();