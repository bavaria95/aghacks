(function () {
    'use strict';

    function ColorTagService($http, ApplyingProjectService){

        var counter = 0;

        var colorPerTag = {
            0: "btn-primary",
            1: "btn-info",
            2: "btn-success",
        }

        this.getButtonColor = function(tagName) {
            counter++;
            
            return colorPerTag[counter%3];
        }
    }
    
    angular
        .module('app')
        .service('ColorTagService', ColorTagService);
})();