(function () {
    'use strict';

    function ProjectRegisterService($http){
         this.register = function(projectId) {
            console.log('registerd')
         }
    }
    
    angular
        .module('app')
        .service('ProjectRegisterService', ProjectRegisterService);
})();