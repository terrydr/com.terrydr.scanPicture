var tdScanPicture = {
tdScanPicture: function(successCallback, errorCallback) {
    console.log("invoked");
    cordova.exec(
                 successCallback,
                 errorCallback,
                 "TDScanPicture",
                 "tdScanPicture",
                 []
                 );
    
}
    
}


module.exports = tdScanPicture;
