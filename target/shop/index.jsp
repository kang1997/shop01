<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<script>
    function selectUser() {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("test").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", "user/showUser.do?id=1", true);
        xmlhttp.send(null);
    }
</script>

<body>
<p id="test">Hello World!</p>
<button type="button" onclick="selectUser()">onclick test</button>
</body>
</html>

