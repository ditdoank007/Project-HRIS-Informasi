from flask import Flask, render_template

app = Flask(__name__)

@app.get("/")
def index():
    return render_template("display.html")

@app.get("/health")
def health():
    return {"status": "ok", "service": "hris-informasi"}
