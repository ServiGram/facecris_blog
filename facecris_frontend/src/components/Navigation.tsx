import { Link, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { useAuth } from "../functions/AuthContext";
import 'bootstrap/dist/css/bootstrap.min.css';

export function Navigation() {
    const { isAuthenticated, login, logout } = useAuth();
    const navigate = useNavigate();
    const [authChanged, setAuthChanged] = useState(false);


    useEffect(() => {
        const handleStorageChange = () => {
            const token = localStorage.getItem('access_token');
            if (token) {
                login();
            } else {
                logout();
            }
            setAuthChanged(true);  // Marco que hubo un cambio
        };

        window.addEventListener("storage", handleStorageChange);

        return () => window.removeEventListener("storage", handleStorageChange);
    }, [login, logout]);

    useEffect(() => {
        if (authChanged) {
            navigate(isAuthenticated ? "/" : "/login");
            setAuthChanged(false);
        }
    }, [authChanged, isAuthenticated, navigate]);

    const handleLogin = () => {
        login();
        navigate("/login");
    };

    const handleLogout = () => {
        logout();
        navigate("/");
    };

    return (
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <div className="container-fluid">
                <Link className="navbar-brand" to={"/"}>Facecris</Link>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li><Link to={"#"} className="nav-link">Social</Link></li>
                        {isAuthenticated && (
                            <li><Link to={"create-post/"} className="nav-link">Crear Post</Link></li>
                        )}
                    </ul>
                    <button
                        className="btn btn-outline-primary ms-3"
                        onClick={isAuthenticated ? handleLogout : handleLogin}
                    >
                        {isAuthenticated ? "Logout" : "Login"}
                    </button>
                </div>
            </div>
        </nav>
    );
}
