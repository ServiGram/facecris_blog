import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import axios from 'axios';
import { loginUser, userInfo } from '../api/user.api';

interface AuthContextProps {
    isAuthenticated: boolean;
    isAdmin: boolean;
    loading: boolean;
    login: (email: string, password: string) => Promise<void>;
    logout: () => void;
}

interface AuthProviderProps {
    children: ReactNode;
}

const API_BASE_URL = process.env.REACT_APP_API_BASE_URL || 'http://127.0.0.1:8000/api';
const AuthContext = createContext<AuthContextProps | null>(null);

export const AuthProvider: React.FC<AuthProviderProps> = ({ children }) => {
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [isAdmin, setIsAdmin] = useState(false);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const checkAuth = async () => {
            setLoading(true);
            const token = localStorage.getItem("access_token");
            if (token) {
                try {
                    const response = await axios.get(`${API_BASE_URL}/auth/users/me/`, {
                        headers: { Authorization: `Bearer ${token}` },
                    });
                    setIsAuthenticated(true);
                    setIsAdmin(response.data.is_admin);
                } catch (error) {
                    console.error("Error fetching user info:", error);
                    setIsAuthenticated(false);
                    setIsAdmin(false);
                }
            } else {
                setIsAuthenticated(false);
                setIsAdmin(false);
            }
            setLoading(false);  // Finaliza la carga
        };

        checkAuth();
    }, []);

    const login = async (email: string, password: string) => {
        try {

            const response = await loginUser(email, password);
            const token = response.data.access;
            localStorage.setItem("access_token", token);

            setIsAuthenticated(true);

            const res = await userInfo();
            const user = res.data;

            setIsAdmin(user && user.is_admin);
        } catch (error) {
            console.error("Error en el inicio de sesión:", error);
        }
    };


    const logout = () => {
        localStorage.removeItem("access_token");
        setIsAuthenticated(false);
        setIsAdmin(false);
    };

    return (
        <AuthContext.Provider value={{ isAuthenticated, isAdmin, loading, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => {
    const context = useContext(AuthContext);
    if (!context) {
        throw new Error("useAuth must be used within an AuthProvider");
    }
    return context;
};
