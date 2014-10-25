(function () {
    'use strict';

    function ColorTagService($http){

        var counter = 0;

        var colorPerTag = {
            0: "btn-primary",
            1: "btn-info",
            2: "btn-success",
            3: "btn-warning",
            4: "btn-danger",
            5: "btn-inverse",
        }

        var tagColorDictionary = {};

        this.getButtonColor = function(tagName) {
            var color = tagColorDictionary[tagName];

            if (angular.isUndefined(color)) {
                color = getNextColor();
                tagColorDictionary[tagName] = color;
            };

            return color;
        }

        function getNextColor(){
            counter++;
            
            return colorPerTag[counter % 6];
        }
    }
    
    angular
        .module('app')
        .service('ColorTagService', ColorTagService);
})();