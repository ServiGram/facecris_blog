import axios from 'axios'

const userApi = axios.create({
    baseURL: "http://127.0.0.1:8000/api/auth/users/me/"
})

export const userInfo = async () => {
    const token = localStorage.getItem('access_token');
    try {
        const response = await axios.get('http://127.0.0.1:8000/api/auth/users/me/', {
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
    return axios.post('http://127.0.0.1:8000/api/auth/jwt/create/', {
        email,
        password
    });
};