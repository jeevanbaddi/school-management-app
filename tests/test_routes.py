from app.main import create_app

def test_login_page():
    app = create_app()
    client = app.test_client()

    response = client.get("/login")
    assert response.status_code == 200

def test_admin_dashboard():
    app = create_app()
    client = app.test_client()

    response = client.get("/admin")
    assert response.status_code == 200
