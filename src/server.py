from sanic import Sanic
from sanic.request import Request
from sanic.response import json, text

app = Sanic("MyHelloWorldApp")


@app.get("/")
async def hello_world(request: Request):
    return text(f"Hello, Sanic! - 1.0.0 ({app.config.MODE})")


@app.route("/json")
async def json_handler(request):
    return json({"hello": "world", "mode": app.config.MODE})
