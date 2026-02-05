from flask import Flask

def create_app():
    app = Flask(__name__)
    app.config["SECRET_KEY"] = "school-secret-key"

    @app.route("/")
    def home():
        return {
            "status": "ok",
            "version": "v2",
            "message": "School Management App is Running on GKE 🚀"
    }, 200


    @app.route("/login")
    def login():
        return "Login Page (Admin / Faculty)", 200

    @app.route("/admin")
    def admin_dashboard():
        return "Admin Dashboard", 200

    @app.route("/faculty")
    def faculty_dashboard():
        return "Faculty Dashboard", 200

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0", port=5000)
