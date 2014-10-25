(function () {
    'use strict';

    function UsersFactory($http) {

        UsersFactory.filteredUsers = [];

        var allUsers = [];

        UsersFactory.getUsers = function () {
            return $http.get('/users.json/')
                .success(function (data) {
                    UsersFactory.filteredUsers = data;
                    allUsers = data;
                })
                .error(function () {
                    NotificationFactory.showError();
                });
        }

        return UsersFactory;
    }

    angular
        .module('app')
        .factory('UsersFactory', UsersFactory);
})();