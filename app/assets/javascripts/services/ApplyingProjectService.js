(function () {
    'use strict';

    function ApplyingProjectService($timeout, $http, $log){
        var self = this;

        var timer;
        var refreshServer = function () {
            var delayTime = 10000;

            timer = $timeout(function () {
                $http.get('/api/users/1').
                    success(function (data) {
                        $log.info(data);
                        self.projectId = data.project_id;
                        refreshServer();
                    }).
                    error(function () {
                        $log.info("Backend server didn't respond to heartbeat");
                    });
            }, delayTime, false);
        };

        refreshServer();

        this.projectId = function(){
            return self.projectId;
        }
    }
    
    angular
        .module('app')
        .service('ApplyingProjectService', ApplyingProjectService);
})();