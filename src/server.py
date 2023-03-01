from sanic import Sanic
from sanic.request import Request
from sanic.response import text

app = Sanic("MyHelloWorldApp")


@app.get("/")
async def hello_world(request: Request):
    return text("Hello, Sanic! - 1.0.0")