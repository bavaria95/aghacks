(function () {
    'use strict';

    function appConfig() {
        
    }
    
    angular
        .module('app', ['ngResource', 'bootstrap-tagsinput', 'ngSanitize'])
        .config(appConfig);
    
})();