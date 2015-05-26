angular.module('shopApp', ['ngRoute'])
    .controller("HomeCtrl", function ($scope, $http) {
        $http.post('/Home/GetTopSellingAlbumsAsync')
            .success(function (data) {
                $scope.albums = data;
            })
            .error(function () {
                alert("error");
            });
    });

