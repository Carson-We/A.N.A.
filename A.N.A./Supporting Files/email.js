document.addEventListener("DOMContentLoaded", function() {
  var contactLink = document.getElementById("contact-link");
  contactLink.addEventListener("click", function(event) {
    event.preventDefault();

    var deviceModel = getDeviceModel();
    var operatingSystem = getOperatingSystem();

    var recipient = "carson.developer1125@gmail.com";
    var subject = "User Feedback";
    var body = "Device Model: " + deviceModel + "\nOperating System: " + operatingSystem + "\n\nPlease provide further info/screenshots on what happened.";

    var mailtoLink = "mailto:" + encodeURIComponent(recipient) + "?subject=" + encodeURIComponent(subject) + "&body=" + encodeURIComponent(body);
    window.location.href = mailtoLink;
  });

  function getDeviceModel() {
    var deviceModel = "Unknown";
    if (navigator.userAgent.match(/iPhone|iPad|iPod/i)) {
      deviceModel = "iOS Device";
    } else if (navigator.userAgent.match(/Android/i)) {
      deviceModel = "Android Device";
    } else if (navigator.userAgent.match(/Windows/i)) {
      deviceModel = "Windows PC";
    } else if (navigator.userAgent.match(/Macintosh/i)) {
      deviceModel = "Mac";
    }
    return deviceModel;
  }

  function getOperatingSystem() {
    var operatingSystem = "Unknown";
    var userAgent = navigator.userAgent;
    var platform = navigator.platform;
    var macosPlatforms = ['Macintosh', 'MacIntel', 'MacPPC', 'Mac68K'];
    var windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'];
    var iosPlatforms = ['iPhone', 'iPad', 'iPod'];

    if (macosPlatforms.indexOf(platform) !== -1) {
      operatingSystem = "Mac OS";
    } else if (iosPlatforms.indexOf(platform) !== -1) {
      operatingSystem = "iOS";
    } else if (windowsPlatforms.indexOf(platform) !== -1) {
      operatingSystem = "Windows";
    } else if (/Android/.test(userAgent)) {
      operatingSystem = "Android";
    } else if (/Linux/.test(platform)) {
      operatingSystem = "Linux";
    }

    return operatingSystem;
  }
});


