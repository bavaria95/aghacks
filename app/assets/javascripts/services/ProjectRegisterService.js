(function () {
    'use strict';

    function ProjectRegisterService($http){
         this.register = function(projectId) {
            console.log('registerd');
            return $http.post("projects/" + projectId + "/user/11");
         }
    }
    
    angular
        .module('app')
        .service('ProjectRegisterService', ProjectRegisterService);
})();