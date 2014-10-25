(function () {
    'use strict';

    function jointags() {
        return function (value) {
            if (!value) return '';

            return value.join(', ');
        };
    }
    
    angular
        .module('app')
        .filter('jointags', jointags);
        
})();