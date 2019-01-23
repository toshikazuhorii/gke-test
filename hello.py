import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    content = "Hello World!更新するよ！！！"

    env_value = os.getenv('APP_NAME')
    if env_value is not None:
        content += ' / [app_name] ' + env_value

    return content

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
