(function () {
    'use strict';

    function ProjectRegisterService($http, ApplyingProjectService){
        this.register = function(projectId) {
            if (ApplyingProjectService.userData.project_id === projectId) {
                console.log('removing');
                return $http.post("/api/users/remove/");
            } else {
                console.log('registerd');
                return $http.post("/api/users/apply/" + projectId);
            }
        }
    }
    
    angular
        .module('app')
        .service('ProjectRegisterService', ProjectRegisterService);
})();