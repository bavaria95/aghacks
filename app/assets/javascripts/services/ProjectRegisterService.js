(function () {
    'use strict';

    function ProjectRegisterService($http){
         this.register = function(projectId) {
            console.log('registerd');
            return $http.post("users/apply/" + projectId);
         }
    }
    
    angular
        .module('app')
        .service('ProjectRegisterService', ProjectRegisterService);
})();