(function () {
    'use strict';

    function NeedConfirmationService($timeout, $http, $log){
        var self = this;

        var timer;
        var refreshServer = function () {
            var delayTime = 3000;

            timer = $timeout(function () {
                $http.get('/api/users/needConfirmation').
                    success(function (data) {
                        self.confirmations = data;
                        refreshServer();
                    }).
                    error(function () {
                        $log.info("Backend server didn't respond to heartbeat");
                    });
            }, delayTime, false);
        };

        refreshServer();

        this.confirmations = function(){
            return self.confirmations;
        }
    }
    
    angular
        .module('app')
        .service('NeedConfirmationService', NeedConfirmationService);
})();