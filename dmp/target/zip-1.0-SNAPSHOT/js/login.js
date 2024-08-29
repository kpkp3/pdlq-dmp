document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 防止表单默认提交行为

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'https://your-api-endpoint/login', true); // 替换为实际的登录接口URL
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    // 获取表单数据
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    var data = 'username=' + encodeURIComponent(username) + '&password=' + encodeURIComponent(password);

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                document.getElementById('responseMessage').innerText = 'Login successful: ' + response.message;
            } else {
                document.getElementById('responseMessage').innerText = 'Login failed: ' + xhr.statusText;
            }
        }
    };

    xhr.send(data);
});
