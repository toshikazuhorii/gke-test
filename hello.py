import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    content = "Hello World!更新するよ！！！"

    app_name = os.getenv('APP_NAME')
    if app_name is not None:
        content += ' / [app_name] ' + app_name

    password = os.getenv('PASSWORD')
    if password is not None:
        content += ' / [password] ' + password

    return content

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
