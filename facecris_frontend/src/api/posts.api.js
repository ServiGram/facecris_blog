import axios from 'axios'

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://127.0.0.1:8000/api';

const POSTS_ENDPOINT = `${API_BASE_URL}/posts/`;

const postApi = axios.create({
    baseURL: POSTS_ENDPOINT
})

//Puedo hacer el return asi
export const getAllPosts = () => {
    return postApi.get("/")
}

//Puedo hacer el return asi
export const createPost = async (data) => {
    const token = localStorage.getItem('access_token');
    return axios.post(POSTS_ENDPOINT, data, {
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'multipart/form-data'
        }
    });
};