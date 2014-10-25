(function () {
    'use strict';

    function cuttags() {
        return function (value, max) {
            if (!value) return '';

            return value.join(', ');

            // max = parseInt(max, 10);
            // if (!max) return value;
            // if (value.length <= max) return value;

            // value = value.substr(0, max);
            // if (wordwise) {
            //     var lastspace = value.lastIndexOf(' ');
            //     if (lastspace != -1) {
            //         value = value.substr(0, lastspace);
            //     }
            // }

            // return value + (tail || ' …');
        };
    }
    
    angular
        .module('app')
        .filter('cuttags', cuttags);
        
})();