import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../functions/AuthContext";

export function Login() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();
    const { login } = useAuth();

    const handleLogin = async (e: React.FormEvent) => {
        e.preventDefault();
        try {
            login(email, password);
            navigate('/');
        } catch (error) {
            console.error('Login failed', error);
            alert('Credenciales incorrectas, intenta nuevamente.');
        }
    };

    return (
        <div className="container">
            <form onSubmit={handleLogin} className="mt-5">
                <div className="mb-3">
                    <label htmlFor="email" className="form-label">Email</label>
                    <input type="email" className="form-control" id="email"
                        value={email} onChange={(e) => setEmail(e.target.value)} required />
                </div>
                <div className="mb-3">
                    <label htmlFor="password" className="form-label">Contraseña</label>
                    <input type="password" className="form-control" id="password"
                        value={password} onChange={(e) => setPassword(e.target.value)} required />
                </div>
                <button type="submit" className="btn btn-primary">Iniciar sesión</button>
            </form>
        </div>
    );
}
