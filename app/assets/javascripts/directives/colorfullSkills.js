(function () {
    'use strict';

    function colorfullSkills() {
        return {
            restrict: 'E',
            template: ['<span ng-repeat-start="skill in skills">',
                        '<button ng-class="getButtonColor(skill)" class="btn btn-mini small-tag">{{skill}}</button>',
                        '</span>',
                        '<span ng-repeat-end></span>'].join(''),
            scope: {
                skills: '=',
            },
            controller: function ($scope, ColorTagService) {
                $scope.getButtonColor = ColorTagService.getButtonColor;
            },
        };
    }
    
    angular
        .module('app')
        .directive('colorfullSkills', colorfullSkills);
})();