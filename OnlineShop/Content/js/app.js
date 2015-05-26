var app = angular.module('shopApp', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngResource', 'ngRoute', 'ui.bootstrap', 'ng.shims.placeholder']);

app.Controller("HomeController", function($scope, $http) {
    $http.get('/Home/Index')
        .success(function (data, status, headers, config) {
            $scope.albums = data;
        })
        .error(function(data, status, headers, config) {
        alert("error");
        });
});

