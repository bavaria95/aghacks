(function () {
    'use strict';

    function ApplyingProjectService($timeout, $http, $log){
        var self = this;

        var timer;
        var refreshServer = function () {
            var delayTime = 3000;

            timer = $timeout(function () {
                $http.get('/api/users/1').
                    success(function (data) {
                        $log.info(data);
                        self.userData = data;
                        refreshServer();
                    }).
                    error(function () {
                        $log.info("Backend server didn't respond to heartbeat");
                    });
            }, delayTime, false);
        };

        refreshServer();

        this.userData = function(){
            return self.userData;
        }
    }
    
    angular
        .module('app')
        .service('ApplyingProjectService', ApplyingProjectService);
})();