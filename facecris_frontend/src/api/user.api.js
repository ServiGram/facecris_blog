import axios from 'axios';

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://127.0.0.1:8000/api';

const userApi = axios.create({
    baseURL: API_BASE_URL
});

export const userInfo = async () => {
    const token = localStorage.getItem('access_token');
    try {
        const response = await axios.get(`${API_BASE_URL}/auth/users/me/`, {
            headers: {
                Authorization: `Bearer ${token}`,
            },
        });
        return response;
    } catch (error) {
        console.error("Error fetching user info:", error);
        throw error;
    }
};

export const loginUser = async (email, password) => {
    return axios.post(`${API_BASE_URL}/auth/jwt/create/`, {
        email,
        password
    });
};
